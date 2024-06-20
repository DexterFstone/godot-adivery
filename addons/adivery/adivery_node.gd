@tool
@icon("res://addons/adivery/icon.svg")
class_name Adivery
extends Node
## نودی که قابلیت نمایش تبلیغات را درون بازی شما می دهد
##
## [b] مثالی از پیاده سازی تبلیغات جایزه ای: [/b]
## [codeblock]
## @onready var adivery: Adivery = Adivery.new()
## func _ready() -> void:
##     adivery.app_id = "59c36ce3-7125-40a7-bd34-144e6906c796"
##     create_rewarded_ad()
##     add_child(adivery)
##     adivery.on_rewarded_ad_loaded.connect(_on_rewarded_ad_loaded)
##     adivery.on_rewarded_ad_shown.connect(_on_rewarded_ad_shown)
##     adivery.on_rewarded_ad_clicked.connect(_on_rewarded_ad_clicked)
##     adivery.on_rewarded_ad_closed.connect(_on_rewarded_ad_closed)
##
## func create_rewarded_ad() -> void:
##     var rewarded: Advertisement = Advertisement.new()
##     rewarded.type = Advertisement.Type.REWARDED
##     rewarded.placement_id = "16414bae-368e-4904-b259-c5b89362206d"
##     rewarded.prepare = true
##     adivery.add_advertisement(rewarded)
##
## func _on_rewarded_ad_loaded(advertisement: Advertisement) -> void:
##     pass
## func _on_rewarded_ad_shown(advertisement: Advertisement) -> void:
##     pass
## func _on_rewarded_ad_clicked(advertisement: Advertisement) -> void:
##     pass
## func _on_rewarded_ad_closed(advertisement: Advertisement,is_rewarded: bool) -> void:
##     pass
## [/codeblock]
## [b]نکته:[/b] اطمینان حاصل کنید که [member Advertisement.type] با [member Advertisement.placement_id] هم خوانی داشته باشند در غیر این صورت با خطا رو به رو خواهید شد.
## [br]
## [b]نکته:[/b] درصورتی که مقدار [member Advertisement.prepare] برابر با [code]true[/code] نباشد تبلیغ به صورت خودکار بارگیری نمیشود و باید دستور [method request_rewarded_ad] را صدا بزنید.
## [br]
## [b]نکته:[/b] جایزه را در سیگنال [signal on_rewarded_ad_closed] و با بررسی مقدار [code]is_rewarded[/code] به بازیکن بدهید.

## زمانی منتشر میشود که [member log] برابر با [code]true[/code] باشد. پیام قابل مشاهده میشود.
signal on_log(advertisement: Advertisement, message: String)
## زمانی منتشر میشود که تبلیغ میان صفحه ای بارگیری شده باشد.
signal on_interstitial_ad_loaded(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ میان صفحه ای پخش شده باشد.
signal on_interstitial_ad_shown(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ میان صفحه ای کلیک شده باشد.
signal on_interstitial_ad_clicked(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ میان صفحه ای بسته شده باشد.
signal on_interstitial_ad_closed(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ جایزه ای بارگیری شده باشد.
signal on_rewarded_ad_loaded(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ جایزه ای پخش شده باشد.
signal on_rewarded_ad_shown(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ جایزه ای کلیک شده باشد.
signal on_rewarded_ad_clicked(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ جایزه ای بسته شده باشد.
## [br]
##  با بررسی مقدار [code]is_rewarded[/code] به بازیکن جایزه را بدهید.
signal on_rewarded_ad_closed(advertisement: Advertisement,is_rewarded: bool)
## زمانی منتشر میشود که تبلیغ بازشدن اپلیکیشن بارگیری شده باشد.
signal on_app_open_ad_loaded(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ بازشدن اپلیکیشن بسته شده باشد.
signal on_app_open_ad_closed(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ بازشدن اپلیکیشن کلیک شده باشد.
signal on_app_open_ad_clicked(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ بازشدن اپلیکیشن پخش شده باشد.
signal on_app_open_ad_shown(advertisement: Advertisement)

## نمایش پیام ها با کمک سیگنال [signal on_log]
## [br]
## جهت تست تبلیغات و رفع خطا آن را فعال کنید.
@export var log: bool:
	get:
		return log
## شناسه اپلیکیشن
## [br]
## [b]نکته:[/b] جهت تست تبلیغات مقدار پیشفرض را تغییر ندهید.
## [br]
## [b]نکته:[/b] شناسه اپلیکیشن را از داشبورد خود دریافت و جایگزین کنید.
@export var app_id: String = "59c36ce3-7125-40a7-bd34-144e6906c796":
	set(new_id):
		app_id = new_id
		notify_property_list_changed()
## لیست تبلیغ گاه های شما
@export var advertisements: Array[Advertisement]

var _singleton: JNISingleton
var _singleton_name: String = "GodotAdivery"

func _validate_property(property: Dictionary) -> void:
	if property.name == "advertisements":
		if app_id.is_empty():
			property.usage = PROPERTY_USAGE_STORAGE
		else :
			property.usage = PROPERTY_USAGE_DEFAULT

func _ready() -> void:
	configure()
	show_log()
	for ad: Advertisement in advertisements:
		if not ad.prepare: continue
		match ad.type:
			Advertisement.Type.APP_OPEN:
				prepare_app_open_dd(ad)
			Advertisement.Type.INTERSTITIAL:
				prepare_interstitial_ad(ad)
			Advertisement.Type.REWARDED:
				request_rewarded_ad(ad)
## پیکربندی ادیوری با استفاده از [member app_id]
## [br]
## [b]نکته:[/b] درصورتی که مقدار [member app_id] خالی است نیاز می باشد که شناسه اپلیکیشن را به عنوان ورودی به دستور بدهید. 
## [br]
## [b]مقال:[/b]
## [codeblock]
## ...
## adivery.app_id = "59c36ce3-7125-40a7-bd34-144e6906c796"
## adivery.configure()
## [/codeblock]
## یا
## [codeblock]
## adivery.app_id = ""
## adivery.configure("59c36ce3-7125-40a7-bd34-144e6906c796")
## [/codeblock]
func configure(app_id: String = "") -> void:
	if not app_id.is_empty():
		self.app_id = app_id
	if self.app_id.is_empty(): return
	if Engine.has_singleton(_singleton_name):
		_singleton = Engine.get_singleton(_singleton_name)
		_singleton.configure(self.app_id)
## نمایش پیام
## [br]
## [b]نکته:[/b] درصورتی که مقدار [member log] برابر [code]false[/code] می باشد باید مقدار جدید را به عنوان ورودی دستور بدهید.
func show_log(value: bool = false) -> void:
	if not Engine.has_singleton(_singleton_name): return
	if value:
		self.log = value
	if not self.log: return
	_singleton.show_log()
	_singleton._on_log.connect(_on_log)
## آماده سازی تبلیغات میان صفحه ای
## [br]
## [b]نکته:[/b] ادیوری بطور خودکار پس از نمایش یک تبلیغ، تبلیغ بعدی را برای شما آماده می‌کند و نیازی به فراخوانی دوباره دستور فوق ندارید.
## [br]
## [b]نکته:[/b] درصورتی که مقدار وروی خالی باشد، پلاگین بصورت خودکار تمامی تبلیغات میان صفحه ای را آماده سازی میکند.
## [br]
## [b]نکته:[/b] درصورتی که مقدار [member Advertisement.prepare] برابر [code]true[/code] باشد نیازی به صدا زدن این دستور ندارید.
func prepare_interstitial_ad(advertisement: Advertisement = null) -> void:
	if not Engine.has_singleton(_singleton_name): return
	if advertisement:
		_singleton.prepare_interstitial_ad(advertisement.placement_id)
		_singleton._on_interstitial_ad_loaded.connect(_on_interstitial_ad_loaded)
		_singleton._on_interstitial_ad_shown.connect(_on_interstitial_ad_shown)
		_singleton._on_interstitial_ad_clicked.connect(_on_interstitial_ad_clicked)
		_singleton._on_interstitial_ad_closed.connect(_on_interstitial_ad_closed)
	else :
		_prepare_all_advertisement(Advertisement.Type.INTERSTITIAL)
## آماده سازی تبلیغات جایزه ای
## [br]
## [b]نکته:[/b] ادیوری بطور خودکار پس از نمایش یک تبلیغ، تبلیغ بعدی را برای شما آماده می‌کند و نیازی به فراخوانی دوباره دستور فوق ندارید.
## [br]
## [b]نکته:[/b] درصورتی که مقدار وروی خالی باشد، پلاگین بصورت خودکار تمامی تبلیغات جایزه ای را آماده سازی میکند.
## [br]
## [b]نکته:[/b] درصورتی که مقدار [member Advertisement.prepare] برابر [code]true[/code] باشد نیازی به صدا زدن این دستور ندارید.
func request_rewarded_ad(advertisement: Advertisement = null) -> void:
	if not Engine.has_singleton(_singleton_name): return
	if advertisement:
		_singleton.request_rewarded_ad(advertisement.placement_id)
		_singleton._on_rewarded_ad_loaded.connect(_on_rewarded_ad_loaded)
		_singleton._on_rewarded_ad_shown.connect(_on_rewarded_ad_shown)
		_singleton._on_rewarded_ad_clicked.connect(_on_rewarded_ad_clicked)
		_singleton._on_rewarded_ad_closed.connect(_on_rewarded_ad_closed)
	else :
		_prepare_all_advertisement(Advertisement.Type.REWARDED)
## آماده سازی تبلیغات بازشدن اپلیکیشن
## [br]
## [b]نکته:[/b] ادیوری بطور خودکار پس از نمایش یک تبلیغ، تبلیغ بعدی را برای شما آماده می‌کند و نیازی به فراخوانی دوباره دستور فوق ندارید.
## [br]
## [b]نکته:[/b] درصورتی که مقدار وروی خالی باشد، پلاگین بصورت خودکار تمامی تبلیغات بازشدن اپلیکیشن را آماده سازی میکند.
## [br]
## [b]نکته:[/b] درصورتی که مقدار [member Advertisement.prepare] برابر [code]true[/code] باشد نیازی به صدا زدن این دستور ندارید.
func prepare_app_open_dd(advertisement: Advertisement = null) -> void:
	if not Engine.has_singleton(_singleton_name): return
	if advertisement:
		_singleton.request_rewarded_ad(advertisement.placement_id)
		_singleton._on_app_open_ad_loaded.connect(_on_app_open_ad_loaded)
		_singleton._on_app_open_ad_closed.connect(_on_app_open_ad_closed)
		_singleton._on_app_open_ad_clicked.connect(_on_app_open_ad_clicked)
		_singleton._on_app_open_ad_shown.connect(_on_app_open_ad_shown)
	else :
		_prepare_all_advertisement(Advertisement.Type.APP_OPEN)
## نمایش تبلیغ جایزه ای و میان صفحه ای
## [br]
## [b]نکته:[/b] در سیگنال های بارگیری ([code]loaded[/code]) از این دستور استفاده نکنید.
## [br]
## [b]نکته:[/b] درصورت خالی بودن ورودی دستور، اولین تبلیغ در دسترس نمایش داده میشود که میتواند جایزه ای و یا میان صفحه ای باشد.
func show_ad(advertisement: Advertisement = null):
	if not Engine.has_singleton(_singleton_name): return
	if advertisement:
		_singleton.show_ad(advertisement.placement_id)
	else :
		for ad: Advertisement in advertisements:
			if ad.type == Advertisement.Type.APP_OPEN: continue
			_singleton.show_ad(ad.placement_id)

## نمایش تبلیغ بازشدن اپلیکیشن
## [br]
## [b]نکته:[/b] در سیگنال های بارگیری ([code]loaded[/code]) از این دستور استفاده نکنید.
func show_app_open_ad(advertisement: Advertisement = null):
	if not Engine.has_singleton(_singleton_name): return
	if advertisement:
		_singleton.show_app_open_ad(advertisement.placement_id)
	else :
		for ad: Advertisement in advertisements:
			if ad.type != Advertisement.Type.APP_OPEN: continue
			_singleton.show_app_open_ad(advertisement.placement_id)

## افزودن تبلیغ گله به نود ادیوری
func add_advertisement(advertisement: Advertisement) -> void:
	advertisements.append(advertisement)

func _on_log(placement_id: String, message: String) -> void:
	on_log.emit(_get_advertisement(placement_id), message)

func _on_interstitial_ad_loaded(placement_id: String) -> void:
	on_interstitial_ad_loaded.emit(_get_advertisement(placement_id))

func _on_interstitial_ad_shown(placement_id: String) -> void:
	on_interstitial_ad_shown.emit(_get_advertisement(placement_id))

func _on_interstitial_ad_clicked(placement_id: String) -> void:
	on_interstitial_ad_clicked.emit(_get_advertisement(placement_id))

func _on_interstitial_ad_closed(placement_id: String) -> void:
	on_interstitial_ad_closed.emit(_get_advertisement(placement_id))

func _on_rewarded_ad_loaded(placement_id: String) -> void:
	on_rewarded_ad_loaded.emit(_get_advertisement(placement_id))

func _on_rewarded_ad_shown(placement_id: String) -> void:
	on_rewarded_ad_shown.emit(_get_advertisement(placement_id))

func _on_rewarded_ad_clicked(placement_id: String) -> void:
	on_rewarded_ad_clicked.emit(_get_advertisement(placement_id))

func _on_rewarded_ad_closed(placement_id: String, is_rewarded: bool) -> void:
	on_rewarded_ad_closed.emit(_get_advertisement(placement_id),is_rewarded)

func _on_app_open_ad_loaded(placement_id: String) -> void:
	on_app_open_ad_loaded.emit(_get_advertisement(placement_id))

func _on_app_open_ad_closed(placement_id: String) -> void:
	on_app_open_ad_closed.emit(_get_advertisement(placement_id))

func _on_app_open_ad_clicked(placement_id: String) -> void:
	on_app_open_ad_clicked.emit(_get_advertisement(placement_id))

func _on_app_open_ad_shown(placement_id: String) -> void:
	on_app_open_ad_shown.emit(_get_advertisement(placement_id))

func _get_advertisement(placement_id: String) -> Advertisement:
	var advertisement: Advertisement
	for ad: Advertisement in advertisements:
		if ad.placement_id == placement_id:
			ad = advertisement
			break
	return advertisement

func _prepare_all_advertisement(type: Advertisement.Type) -> void:
	for ad in advertisements:
		if ad.type != type: continue
		match type:
			Advertisement.Type.APP_OPEN:
				_singleton.prepare_app_open_dd(ad.placement_id)
			Advertisement.Type.INTERSTITIAL:
				_singleton.prepare_interstitial_ad(ad.placement_id)
			Advertisement.Type.REWARDED:
				_singleton.request_rewarded_ad(ad.placement_id)
	match type:
		Advertisement.Type.APP_OPEN:
			_singleton._on_app_open_ad_loaded.connect(_on_app_open_ad_loaded)
			_singleton._on_app_open_ad_closed.connect(_on_app_open_ad_closed)
			_singleton._on_app_open_ad_clicked.connect(_on_app_open_ad_clicked)
			_singleton._on_app_open_ad_shown.connect(_on_app_open_ad_shown)
		Advertisement.Type.INTERSTITIAL:
			_singleton._on_interstitial_ad_loaded.connect(_on_interstitial_ad_loaded)
			_singleton._on_interstitial_ad_shown.connect(_on_interstitial_ad_shown)
			_singleton._on_interstitial_ad_clicked.connect(_on_interstitial_ad_clicked)
			_singleton._on_interstitial_ad_closed.connect(_on_interstitial_ad_closed)
		Advertisement.Type.REWARDED:
			_singleton._on_rewarded_ad_loaded.connect(_on_rewarded_ad_loaded)
			_singleton._on_rewarded_ad_shown.connect(_on_rewarded_ad_shown)
			_singleton._on_rewarded_ad_clicked.connect(_on_rewarded_ad_clicked)
			_singleton._on_rewarded_ad_closed.connect(_on_rewarded_ad_closed)
