@icon("res://addons/adivery/icon.svg")
class_name Adivery
extends Node
## نودی که قابلیت نمایش تبلیغات را درون بازی شما می دهد 
##
## نودی که قابلیت نمایش تبلیغات را درون بازی شما می دهد. 
## [br]
## [b] مثالی از پیاده سازی تبلیغات جایزه ای: [/b]
## [codeblock]
## @onready var adivery: Adivery = Adivery.new()
## func _ready() -> void:
##     adivery.app_id = "1d0b8063-4971-4310-a7b1-8330ef89f46d"
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
signal loged(advertisement: Advertisement, message: String)
## زمانی منتشر میشود که تبلیغ میان صفحه ای بارگیری شده باشد. 
signal interstitial_ad_loaded(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ میان صفحه ای پخش شده باشد. 
signal interstitial_ad_shown(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ میان صفحه ای کلیک شده باشد. 
signal interstitial_ad_clicked(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ میان صفحه ای بسته شده باشد. 
signal interstitial_ad_closed(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ جایزه ای بارگیری شده باشد. 
signal rewarded_ad_loaded(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ جایزه ای پخش شده باشد. 
signal rewarded_ad_shown(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ جایزه ای کلیک شده باشد. 
signal rewarded_ad_clicked(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ جایزه ای بسته شده باشد. 
## [br]
##  با بررسی مقدار [code]is_rewarded[/code] به بازیکن جایزه را بدهید. 
signal rewarded_ad_closed(advertisement: Advertisement,is_rewarded: bool)
## زمانی منتشر میشود که تبلیغ بازشدن اپلیکیشن بارگیری شده باشد. 
signal app_open_ad_loaded(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ بازشدن اپلیکیشن بسته شده باشد. 
signal app_open_ad_closed(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ بازشدن اپلیکیشن کلیک شده باشد. 
signal app_open_ad_clicked(advertisement: Advertisement)
## زمانی منتشر میشود که تبلیغ بازشدن اپلیکیشن پخش شده باشد. 
signal app_open_ad_shown(advertisement: Advertisement)

const DEFAULT_APP_ID: String = "1d0b8063-4971-4310-a7b1-8330ef89f46d"

## نمایش پیام ها با کمک سیگنال [signal on_log] 
## [br]
## جهت تست تبلیغات و رفع خطا آن را فعال کنید. 
@export var log: bool
## شناسه اپلیکیشن 
## [br]
## [b]نکته:[/b] جهت تست تبلیغات مقدار پیشفرض را تغییر ندهید.
## [br]
## [b]نکته:[/b] شناسه اپلیکیشن را از داشبورد خود دریافت و جایگزین کنید.
@export_placeholder(DEFAULT_APP_ID) var app_id: String

## لیست تبلیغ گاه های شما 
@export var advertisements: Array[Advertisement]

static var _self: Adivery
static var _singleton: JNISingleton
static var _singleton_name: String = "GodotAdivery"

func _init() -> void:
	add_user_signal("configured")

func _enter_tree() -> void:
	_self = self

func _ready() -> void:
	configure()
	show_log()
	prepare_app_open_ad()
	prepare_interstitial_ad()
	request_rewarded_ad()
## پیکربندی ادیوری با استفاده از [member app_id] 
## [br]
## [b]نکته:[/b] درصورتی که مقدار [member app_id] خالی است نیاز می باشد که شناسه اپلیکیشن را به عنوان ورودی به دستور بدهید. 
## [br]
## [b]مقال:[/b]
## [codeblock]
## ...
## adivery.app_id = "1d0b8063-4971-4310-a7b1-8330ef89f46d"
## adivery.configure()
## [/codeblock]
## یا
## [codeblock]
## adivery.app_id = ""
## adivery.configure("1d0b8063-4971-4310-a7b1-8330ef89f46d")
## [/codeblock]
func configure(app_id: String = "") -> void:
	if not app_id.is_empty():
		self.app_id = app_id
	if self.app_id.is_empty():
		self.app_id = DEFAULT_APP_ID
	if Engine.has_singleton(_singleton_name):
		_singleton = Engine.get_singleton(_singleton_name)
		_singleton.configure(self.app_id)
		emit_signal("configured")
## نمایش پیام 
## [br]
## [b]نکته:[/b] درصورتی که مقدار [member log] برابر [code]false[/code] می باشد باید مقدار جدید را به عنوان ورودی دستور بدهید.
func show_log(value: bool = false) -> void:
	if not Engine.has_singleton(_singleton_name): return
	if value:
		self.log = value
	if not self.log: return
	_singleton.show_log()
	_singleton._on_log.connect(__on_log)
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
		if (advertisement as InterstitialAdvertisement).placement_id.is_empty():
			(advertisement as InterstitialAdvertisement).placement_id = InterstitialAdvertisement.DEFAULT_PLACEMENT_ID
		_singleton.prepare_interstitial_ad(advertisement.placement_id)
		_connect_interstitial_signals()
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
		if (advertisement as RewardedAdvertisement).placement_id.is_empty():
			(advertisement as RewardedAdvertisement).placement_id = RewardedAdvertisement.DEFAULT_PLACEMENT_ID
		_singleton.request_rewarded_ad(advertisement.placement_id)
		_connect_rewarded_signals()
	else :
		_prepare_all_advertisement(Advertisement.Type.REWARDED)
## آماده سازی تبلیغات بازشدن اپلیکیشن 
## [br]
## [b]نکته:[/b] ادیوری بطور خودکار پس از نمایش یک تبلیغ، تبلیغ بعدی را برای شما آماده می‌کند و نیازی به فراخوانی دوباره دستور فوق ندارید.
## [br]
## [b]نکته:[/b] درصورتی که مقدار وروی خالی باشد، پلاگین بصورت خودکار تمامی تبلیغات بازشدن اپلیکیشن را آماده سازی میکند.
## [br]
## [b]نکته:[/b] درصورتی که مقدار [member Advertisement.prepare] برابر [code]true[/code] باشد نیازی به صدا زدن این دستور ندارید.
func prepare_app_open_ad(advertisement: Advertisement = null) -> void:
	if not Engine.has_singleton(_singleton_name): return
	if advertisement:
		if (advertisement as AppOpenAdvertisement).placement_id.is_empty():
			(advertisement as AppOpenAdvertisement).placement_id = AppOpenAdvertisement.DEFAULT_PLACEMENT_ID
		if (advertisement as AppOpenAdvertisement).show_on_resume:
			_singleton.set_show_on_resume(advertisement.show_on_resume)
			_singleton.set_i_placement_id(advertisement.placement_id)
		_singleton.prepare_app_open_ad(advertisement.placement_id)
		_connect_app_open_signals()
	else :
		_prepare_all_advertisement(Advertisement.Type.APP_OPEN)
## نمایش تبلیغ جایزه ای 
## [br]
## [b]نکته:[/b] در سیگنال های بارگیری ([code]loaded[/code]) از این دستور استفاده نکنید.
## [br]
## [b]نکته:[/b] درصورت خالی بودن ورودی دستور، اولین تبلیغ در دسترس نمایش داده میشود.
func show_rewarded_ad(advertisement: Advertisement = null) -> void:
	if not Engine.has_singleton(_singleton_name): return
	if advertisement:
		_singleton.show_ad(advertisement.placement_id)
	else :
		for ad: Advertisement in advertisements:
			if ad.type != Advertisement.Type.REWARDED: continue
			_singleton.show_ad(ad.placement_id)

## نمایش تبلیغ میان صفحه ای 
## [br]
## [b]نکته:[/b] در سیگنال های بارگیری ([code]loaded[/code]) از این دستور استفاده نکنید.
## [br]
## [b]نکته:[/b] درصورت خالی بودن ورودی دستور، اولین تبلیغ در دسترس نمایش داده میشود.
func show_interstitial_ad(advertisement: Advertisement = null) -> void:
	if not Engine.has_singleton(_singleton_name): return
	if advertisement:
		_singleton.show_ad(advertisement.placement_id)
	else :
		for ad: Advertisement in advertisements:
			if ad.type != Advertisement.Type.INTERSTITIAL: continue
			_singleton.show_ad(ad.placement_id)

## نمایش تبلیغ بازشدن اپلیکیشن 
## [br]
## [b]نکته:[/b] در سیگنال های بارگیری ([code]loaded[/code]) از این دستور استفاده نکنید.
func show_app_open_ad(advertisement: Advertisement = null) -> void:
	if not Engine.has_singleton(_singleton_name): return
	if advertisement:
		_singleton.show_app_open_ad(advertisement.placement_id)
	else :
		for ad: Advertisement in advertisements:
			if ad.type != Advertisement.Type.APP_OPEN: continue
			_singleton.show_app_open_ad(ad.placement_id)

## بررسی اینکه تبلیغ گاه بارگیری شده است. 
func is_loaded(advertisement: Advertisement) -> bool:
	if not Engine.has_singleton(_singleton_name): return false
	if advertisement:
		return _singleton.is_loaded(advertisement.placement_id)
	return false

## افزودن تبلیغ گله به نود ادیوری 
func add_advertisement(advertisement: Advertisement) -> void:
	advertisements.append(advertisement)

## افزودن نام کاربری 
func set_user_id(user_id: String) -> void:
	if not Engine.has_singleton(_singleton_name): return
	_singleton.set_user_id(user_id)

func __on_log(placement_id: String, message: String) -> void:
	loged.emit(_get_advertisement(placement_id), message)

func __on_interstitial_ad_loaded(placement_id: String) -> void:
	interstitial_ad_loaded.emit(_get_advertisement(placement_id))

func __on_interstitial_ad_shown(placement_id: String) -> void:
	interstitial_ad_shown.emit(_get_advertisement(placement_id))

func __on_interstitial_ad_clicked(placement_id: String) -> void:
	interstitial_ad_clicked.emit(_get_advertisement(placement_id))

func __on_interstitial_ad_closed(placement_id: String) -> void:
	interstitial_ad_closed.emit(_get_advertisement(placement_id))

func __on_rewarded_ad_loaded(placement_id: String) -> void:
	rewarded_ad_loaded.emit(_get_advertisement(placement_id))

func __on_rewarded_ad_shown(placement_id: String) -> void:
	rewarded_ad_shown.emit(_get_advertisement(placement_id))

func __on_rewarded_ad_clicked(placement_id: String) -> void:
	rewarded_ad_clicked.emit(_get_advertisement(placement_id))

func __on_rewarded_ad_closed(placement_id: String, is_rewarded: bool) -> void:
	rewarded_ad_closed.emit(_get_advertisement(placement_id),is_rewarded)

func __on_app_open_ad_loaded(placement_id: String) -> void:
	app_open_ad_loaded.emit(_get_advertisement(placement_id))

func __on_app_open_ad_closed(placement_id: String) -> void:
	app_open_ad_closed.emit(_get_advertisement(placement_id))

func __on_app_open_ad_clicked(placement_id: String) -> void:
	app_open_ad_clicked.emit(_get_advertisement(placement_id))

func __on_app_open_ad_shown(placement_id: String) -> void:
	app_open_ad_shown.emit(_get_advertisement(placement_id))

func _get_advertisement(placement_id: String) -> Advertisement:
	var advertisement: Advertisement
	for ad: Advertisement in advertisements:
		if ad.placement_id == placement_id:
			ad = advertisement
			break
	return advertisement

func _prepare_all_advertisement(type: Advertisement.Type) -> void:
	for ad in advertisements:
		if ad is AppOpenAdvertisement:
			if not (ad as AppOpenAdvertisement).prepare: continue
		if ad is InterstitialAdvertisement:
			if not (ad as InterstitialAdvertisement).prepare: continue
		if ad is RewardedAdvertisement:
			if not (ad as RewardedAdvertisement).request: continue
		if ad.type != type: continue
		match type:
			Advertisement.Type.APP_OPEN:
				if (ad as AppOpenAdvertisement).placement_id.is_empty():
					(ad as AppOpenAdvertisement).placement_id = AppOpenAdvertisement.DEFAULT_PLACEMENT_ID
				if (ad as AppOpenAdvertisement).show_on_resume:
					_singleton.set_show_on_resume(ad.show_on_resume)
					_singleton.set_i_placement_id(ad.placement_id)
				_singleton.prepare_app_open_ad(ad.placement_id)
			Advertisement.Type.INTERSTITIAL:
				if (ad as InterstitialAdvertisement).placement_id.is_empty():
					(ad as InterstitialAdvertisement).placement_id = InterstitialAdvertisement.DEFAULT_PLACEMENT_ID
				_singleton.prepare_interstitial_ad(ad.placement_id)
			Advertisement.Type.REWARDED:
				if (ad as RewardedAdvertisement).placement_id.is_empty():
					(ad as RewardedAdvertisement).placement_id = RewardedAdvertisement.DEFAULT_PLACEMENT_ID
				_singleton.request_rewarded_ad(ad.placement_id)
	match type:
		Advertisement.Type.APP_OPEN:
			_connect_app_open_signals()
		Advertisement.Type.INTERSTITIAL:
			_connect_interstitial_signals()
		Advertisement.Type.REWARDED:
			_connect_rewarded_signals()

func _connect_app_open_signals() -> void:
	if not _singleton.is_connected("_on_app_open_ad_loaded",__on_app_open_ad_loaded):
		_singleton._on_app_open_ad_loaded.connect(__on_app_open_ad_loaded)
	if not _singleton.is_connected("_on_app_open_ad_closed",__on_app_open_ad_closed):
		_singleton._on_app_open_ad_closed.connect(__on_app_open_ad_closed)
	if not _singleton.is_connected("_on_app_open_ad_clicked",__on_app_open_ad_clicked):
		_singleton._on_app_open_ad_clicked.connect(__on_app_open_ad_clicked)
	if not _singleton.is_connected("_on_app_open_ad_shown",__on_app_open_ad_shown):
		_singleton._on_app_open_ad_shown.connect(__on_app_open_ad_shown)

func _connect_interstitial_signals() -> void:
	if not _singleton.is_connected("_on_interstitial_ad_loaded",__on_interstitial_ad_loaded):
		_singleton._on_interstitial_ad_loaded.connect(__on_interstitial_ad_loaded)
	if not _singleton.is_connected("_on_interstitial_ad_shown",__on_interstitial_ad_shown):
		_singleton._on_interstitial_ad_shown.connect(__on_interstitial_ad_shown)
	if not _singleton.is_connected("_on_interstitial_ad_clicked",__on_interstitial_ad_clicked):
		_singleton._on_interstitial_ad_clicked.connect(__on_interstitial_ad_clicked)
	if not _singleton.is_connected("_on_interstitial_ad_closed",__on_interstitial_ad_closed):
		_singleton._on_interstitial_ad_closed.connect(__on_interstitial_ad_closed)

func _connect_rewarded_signals() -> void:
	if not _singleton.is_connected("_on_rewarded_ad_loaded",__on_rewarded_ad_loaded):
		_singleton._on_rewarded_ad_loaded.connect(__on_rewarded_ad_loaded)
	if not _singleton.is_connected("_on_rewarded_ad_shown",__on_rewarded_ad_shown):
		_singleton._on_rewarded_ad_shown.connect(__on_rewarded_ad_shown)
	if not _singleton.is_connected("_on_rewarded_ad_clicked",__on_rewarded_ad_clicked):
		_singleton._on_rewarded_ad_clicked.connect(__on_rewarded_ad_clicked)
	if not _singleton.is_connected("_on_rewarded_ad_closed",__on_rewarded_ad_closed):
		_singleton._on_rewarded_ad_closed.connect(__on_rewarded_ad_closed)
