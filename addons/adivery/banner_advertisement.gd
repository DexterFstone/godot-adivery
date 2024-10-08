@tool
@icon("res://addons/adivery/icon.svg")
class_name BannerAdvertisement
extends Control
## نودی که قابلیت نمایش تبلیغات بنری را درون بازی شما می دهد 
##
## نودی که قابلیت نمایش تبلیغات بنری را درون بازی شما می دهد 
## [br]
## جهت استفاده از تبلیغات بنری، [Adivery] باید تنظیم شده باشد. 
## جهت استفاده از بنر کافی است آن را به سین مد نظر اضافه کرده و مقادیر مد نظر را تنظیم کنید. 
## نود بنر واسط ارتباط با ویو بنر می باشد و یعنی با یک بار لود شدن آن در همه جا قابل دسترس می باشد بنابراین بهترین جا برای فراخوانی آن Autoload می باشد. 
## توجه داشته باشید با اسکرول شدن، تغییر اندازه و چرخش نود تاثیری در نمایش بنر ندارد. 
## [br]
## [b]هشدار:[/b] به هیچ عنوان از یک شناسه تبلیغ گاه برای چندین بنر استفاده نکنید.


## زمانی منتشر میشود که تبلیغ بنری آشکار یا پنهان شود. 
signal shown(visibility: bool)
## زمانی منتشر میشود که تبلیغ نمایش داده شود. 
signal loaded
## زمانی منتشر میشود که تبلیغ با خظایی روبه رو شود. 
signal error(reason: String)
## زمانی منتشر میشود که برروی تبلیغ کلیک شود. 
signal clicked
## زمانی منتشر میشود که تبلیغ بسته شود. 
signal closed

const DEFAULT_PLACEMENT_ID: String = "66e01251-50ac-4068-a05e-2c675e367611"

## انداره تبلیغات بنری 
enum BannerSize {
	## 320 x 50
	BANNER = 1,
	## 320 x 100
	LARGE_BANNER = 2,
	## 300 x 250
	MEDIUM_RECTANGLE = 3,
	SMART_BANNER = 4,
}
## پنهان و یا آشکار سازی تبلیغ 
@export var visibility: bool = true:
	set(value):
		visibility = value
		_set_visibility.call_deferred()
		notify_property_list_changed()
## آماده سازی خودکار تبلیغ 
@export var prepare: bool = false
## تلاش مجدد هنگام خطا 
@export var retry_on_error: bool = false
## انداره تبلیغات بنری 
@export var banner_size: BannerSize = BannerSize.BANNER:
	set(new_size):
		banner_size = new_size
		_set_banner_size.call_deferred()
## شناسه تبلیغ گاه 
@export_placeholder(DEFAULT_PLACEMENT_ID) var placement_id: String

func _validate_property(property: Dictionary) -> void:
	if property.name == "custom_minimum_size" or \
	property.name == "size" or property.name == "rotation" or \
	property.name == "scale" or property.name == "pivot_offset" or \
	property.name == "visible":
		if pivot_offset != Vector2.ZERO:
			pivot_offset = Vector2.ZERO
		if scale != Vector2.ONE:
			scale = Vector2.ONE
		if rotation != 0:
			rotation = 0
		if visible != visibility:
			visible = visibility
		property.usage = PROPERTY_USAGE_READ_ONLY
	if property.name == "layout_mode" or property.name == "anchors_preset":
		layout_mode = 1
		if anchors_preset != PRESET_TOP_LEFT:
			anchors_preset = PRESET_TOP_LEFT
		property.usage = PROPERTY_USAGE_READ_ONLY
	if property.name == "size_flags_horizontal" or property.name == "size_flags_vertical":
		if size_flags_horizontal == SIZE_FILL:
			size_flags_horizontal = SIZE_SHRINK_CENTER
		if size_flags_vertical == SIZE_FILL:
			size_flags_vertical = SIZE_SHRINK_CENTER

func _enter_tree() -> void:
	_set_banner_size()

func _ready() -> void:
	if not Engine.has_singleton(Adivery._singleton_name): return
	if not prepare: return
	await Signal(Adivery._self, "configured")
	prepare_banner_ad()
	set_banner_size()
	load_banner_ad()

## آماده سازی تبلیغ بنری 
func prepare_banner_ad(placement_id: String = "", retry_on_error: bool = false) -> void:
	if not Engine.has_singleton(Adivery._singleton_name): return
	if not placement_id.is_empty():
		self.placement_id = placement_id
	if self.placement_id.is_empty():
		self.placement_id = DEFAULT_PLACEMENT_ID
	if retry_on_error:
		self.retry_on_error = retry_on_error
	Adivery._singleton.prepare_banner_ad(self.placement_id, self.retry_on_error)
	if not Adivery._singleton.is_connected("_on_banner_ad_loaded", __on_banner_ad_loaded):
		Adivery._singleton._on_banner_ad_loaded.connect(__on_banner_ad_loaded)
	if not Adivery._singleton.is_connected("_on_banner_ad_error", __on_banner_ad_error):
		Adivery._singleton._on_banner_ad_error.connect(__on_banner_ad_error)
	if not Adivery._singleton.is_connected("_on_banner_ad_clicked", __on_banner_ad_clicked):
		Adivery._singleton._on_banner_ad_clicked.connect(__on_banner_ad_clicked)
	_set_banner_position()

## تنظیم اندازه تبلیغ بنری 
func set_banner_size(banner_size: BannerSize = 0) -> void:
	if not Engine.has_singleton(Adivery._singleton_name): return
	if banner_size != 0:
		self.banner_size = banner_size
	Adivery._singleton.set_banner_size(placement_id, self.banner_size)

## نمایش تبلیغ بنری 
func load_banner_ad() -> void:
	if not Engine.has_singleton(Adivery._singleton_name): return
	Adivery._singleton.load_banner_ad(placement_id)
	_set_visibility()

## بستن تبلیغ بنری 
func close_banner() -> void:
	if not Engine.has_singleton(Adivery._singleton_name): return
	Adivery._singleton.close_banner(placement_id)
	closed.emit()

func _set_visibility() -> void:
	visible = visibility
	if not Engine.has_singleton(Adivery._singleton_name): return
	Adivery._singleton.set_visibility(placement_id, visibility)
	shown.emit(visibility)

func _set_banner_size() -> void:
	var dpi: int = DisplayServer.screen_get_dpi()
	match banner_size:
		BannerSize.BANNER:
			custom_minimum_size.x = 320 * (dpi / 160.0)
			custom_minimum_size.y = 50 * (dpi / 160.0)
		BannerSize.LARGE_BANNER:
			custom_minimum_size.x = 320 * (dpi / 160.0)
			custom_minimum_size.y = 100 * (dpi / 160.0)
		BannerSize.MEDIUM_RECTANGLE:
			custom_minimum_size.x = 300 * (dpi / 160.0)
			custom_minimum_size.y = 250 * (dpi / 160.0)
		BannerSize.SMART_BANNER:
			custom_minimum_size.x = DisplayServer.get_display_safe_area().size.x - (DisplayServer.get_display_safe_area().position.x * 2)
			if DisplayServer.screen_get_orientation() == 0 \
			or DisplayServer.screen_get_orientation() == 2 \
			or DisplayServer.screen_get_orientation() == 4:
				custom_minimum_size.y = 50 * (dpi / 160.0)
			elif DisplayServer.screen_get_orientation() == 1 \
			or DisplayServer.screen_get_orientation() == 3 \
			or DisplayServer.screen_get_orientation() == 5:
				custom_minimum_size.y = 90 * (dpi / 160.0)
	size.x = custom_minimum_size.x
	size.y = custom_minimum_size.y

func _set_banner_position() -> void:
	if not Engine.has_singleton(Adivery._singleton_name): return
	await RenderingServer.frame_post_draw
	Adivery._singleton.set_banner_position(placement_id, global_position.x, global_position.y)

func __on_banner_ad_loaded(placement_id: String) -> void:
	if placement_id != self.placement_id: return
	loaded.emit()

func __on_banner_ad_error(placement_id: String, reason: String) -> void:
	if placement_id != self.placement_id: return
	error.emit(reason)

func __on_banner_ad_clicked(placement_id: String) -> void:
	if placement_id != self.placement_id: return
	clicked.emit()
