@tool
@icon("res://addons/adivery/icon.svg")
class_name NativeAdvertisement
extends Control
## نودی که قابلیت نمایش تبلیغات همسان را درون بازی شما می دهد
##
## نودی که قابلیت نمایش تبلیغات همسان را درون بازی شما می دهد
## [br]
## جهت استفاده از تبلیغات همسان، [Adivery] باید تنظیم شده باشد. 
## جهت استفاده از تبلیغات همسان کافی است آن را به سین مد نظر اضافه کرده و مقادیر مد نظر را تنظیم کنید. 
## [br]
## [b]هشدار:[/b] به هیچ عنوان از یک شناسه تبلیغ گاه برای چندین بنر استفاده نکنید.

## زمانی منتشر می شود که تبلیغ بارگیری شود. 
signal loaded
## زمانی منتشر می شود که تبلیغ نمایش داده شود. 
signal shown
## زمانی منتشر می شود که مشکلی در نمایش تبلیغ وجود داشته باشد. 
signal shown_failed
## زمانی منتشر می شود که برروی دکمه تبلیغ کلیک شود. 
signal clicked
## زمانی منتشر می شود که مشکلی در بارگیری تبلیغ وجود داشته باشد. 
signal load_failed

const DEFAULT_PLACEMENT_ID: String = "4c76642f-b2c6-4b42-9a28-c54d09c6ec02"

## درخواست خودکار تبلیغ 
@export var request: bool = false
## شناسه تبلیغ گاه 
@export_placeholder(DEFAULT_PLACEMENT_ID) var placement_id: String
@export_group("Details")
## داشتن عنوان تبلیغ 
## [br]
## [b]هشدار:[/b] به هیچ عنوان تغییری در این مقدار ندهید و از حذف نود عنوان خودداری کنید.
@export var has_head_line: bool = false
## داشتن دکمه عملیات 
## [br]
## [b]هشدار:[/b] به هیچ عنوان تغییری در این مقدار ندهید و از حذف نود عنوان خودداری کنید.
@export var has_call_to_action: bool = false
## داشتن نام برند و یا اپلیکیشن 
@export var has_advertiser: bool = false:
	set(value):
		has_advertiser = value
		if has_advertiser:
			_add_advertiser()
		else :
			_advertiser.queue_free()
			_advertiser = null
## داشتن توضیحات 
@export var has_description: bool = false:
	set(value):
		has_description = value
		if has_description:
			_add_description()
		else :
			_description.queue_free()
			_description = null
## داشتن آیکون که نسبت آن 1:1 است 
@export var has_icon: bool = false:
	set(value):
		has_icon = value
		if has_icon:
			_add_icon()
		else :
			_icon.queue_free()
			_icon = null
## داشتن تصویر که نسبت آن 16:9 است 
@export var has_image: bool = false:
	set(value):
		has_image = value
		if has_image:
			_add_image()
		else :
			_image.queue_free()
			_image = null

var _data: NativeData
var _action: Callable = func ():
		Adivery._singleton.record_click(placement_id)

@onready var _head_line: Label = get_node_or_null(get_path_to(%HeadLine, true)) if has_head_line else null
@onready var _advertiser: Label = get_node_or_null(get_path_to(%Advertiser, true)) if has_advertiser else null
@onready var _description: Label = get_node_or_null(get_path_to(%Description, true)) if has_description else null
@onready var _icon: TextureRect = get_node_or_null(get_path_to(%Icon, true)) if has_icon else null
@onready var _image: TextureRect = get_node_or_null(get_path_to(%Image, true)) if has_image else null
@onready var _call_to_action: Button = get_node_or_null(get_path_to(%CallToAction, true)) if has_call_to_action else null

func _ready() -> void:
	_add_head_line()
	_add_call_to_action()
	if Engine.is_editor_hint(): return
	if not Engine.has_singleton(Adivery._singleton_name): return
	if not request: return
	#await Signal(Adivery._self, "configured")
	request_native_ad()

## درخواست تبلیغات همسان 
## [br]
## درصورت تست تبلیغات مقدار پیشفرض را تغییر ندهید و یا مقداری وارد نکنید. 
func request_native_ad(placement_id: String = "") -> void:
	if not Engine.has_singleton(Adivery._singleton_name): return
	if not placement_id.is_empty():
		self.placement_id = placement_id
	if self.placement_id.is_empty():
		self.placement_id = DEFAULT_PLACEMENT_ID
	Adivery._singleton.request_native_ad(self.placement_id)
	if not Adivery._singleton.is_connected("_on_native_ad_loaded", __on_native_ad_loaded):
		Adivery._singleton._on_native_ad_loaded.connect(__on_native_ad_loaded)
	if not Adivery._singleton.is_connected("_on_native_ad_shown", __on_native_ad_shown):
		Adivery._singleton._on_native_ad_shown.connect(__on_native_ad_shown)
	if not Adivery._singleton.is_connected("_on_native_ad_shown_failed", __on_native_ad_shown_failed):
		Adivery._singleton._on_native_ad_shown_failed.connect(__on_native_ad_shown_failed)
	if not Adivery._singleton.is_connected("_on_native_ad_clicked", __on_native_ad_clicked):
		Adivery._singleton._on_native_ad_clicked.connect(__on_native_ad_clicked)
	if not Adivery._singleton.is_connected("_on_native_ad_load_failed", __on_native_ad_load_failed):
		Adivery._singleton._on_native_ad_load_failed.connect(__on_native_ad_load_failed)
	if not _call_to_action: return
	if not _call_to_action.is_connected("pressed", _action):
		_call_to_action.pressed.connect(_action)

func _on_visibility_changed() -> void:
	if not Engine.has_singleton(Adivery._singleton_name): return
	if not is_visible(): return
	if not _head_line or not _call_to_action:
		shown_failed.emit()
		return
	if not _data: return
	Adivery._singleton.record_impression(placement_id)

func _add_head_line() -> void:
	if not is_inside_tree(): return
	if _head_line != null: return
	has_head_line = true
	_head_line = Label.new()
	add_child(_head_line)
	_head_line.name = "HeadLine"
	_head_line.owner = get_parent()
	_head_line.unique_name_in_owner = true

func _add_call_to_action() -> void:
	if not is_inside_tree(): return
	if _call_to_action != null: return
	has_call_to_action = true
	_call_to_action = Button.new()
	add_child(_call_to_action)
	_call_to_action.name = "CallToAction"
	_call_to_action.owner = get_parent()
	_call_to_action.unique_name_in_owner = true

func _add_advertiser() -> void:
	if not is_inside_tree(): return
	if _advertiser != null: return
	if not has_advertiser: return
	_advertiser = Label.new()
	add_child(_advertiser)
	_advertiser.name = "Advertiser"
	_advertiser.owner = get_parent()
	_advertiser.unique_name_in_owner = true

func _add_description() -> void:
	if not is_inside_tree(): return
	if _description != null: return
	if not has_description: return
	_description = Label.new()
	add_child(_description)
	_description.name = "Description"
	_description.owner = get_parent()
	_description.unique_name_in_owner = true

func _add_icon() -> void:
	if not is_inside_tree(): return
	if _icon != null: return
	if not has_icon: return
	_icon = TextureRect.new()
	add_child(_icon)
	_icon.name = "Icon"
	_icon.owner = get_parent()
	_icon.unique_name_in_owner = true

func _add_image() -> void:
	if not is_inside_tree(): return
	if _image != null: return
	if not has_image: return
	_image = TextureRect.new()
	add_child(_image)
	_image.name = "Image"
	_image.owner = get_parent()
	_image.unique_name_in_owner = true

func __on_native_ad_loaded(placement_id: String, result: Dictionary) -> void:
	if placement_id != self.placement_id: return
	_data = NativeData.new(result)
	if _head_line:
		_head_line.text = _data.head_line 
	if _advertiser:
		_advertiser.text = _data.advertiser 
	if _description:
		_description.text = _data.description 
	if _icon:
		_icon.texture = NativeData.image_to_texture(_data.icon) 
	if _image:
		_image.texture = NativeData.image_to_texture(_data.image) 
	if _call_to_action:
		_call_to_action.text = _data.call_to_action 
	loaded.emit()

func __on_native_ad_shown(placement_id: String) -> void:
	if placement_id != self.placement_id: return
	shown.emit()

func __on_native_ad_shown_failed(placement_id: String) -> void:
	if placement_id != self.placement_id: return
	shown_failed.emit()

func __on_native_ad_clicked(placement_id: String) -> void:
	if placement_id != self.placement_id: return
	clicked.emit()

func __on_native_ad_load_failed(placement_id: String) -> void:
	if placement_id != self.placement_id: return
	load_failed.emit()

class NativeData extends RefCounted:

	var head_line: String
	var advertiser: String
	var description: String
	var icon: Image
	var image: Image
	var call_to_action: String

	func _init(data: Dictionary = {}) -> void:
		if data.is_empty(): return
		head_line = data["head_line"]
		advertiser = data["advertiser"]
		description = data["description"]
		icon = base64_to_image(data["icon"])
		image = base64_to_image(data["image"])
		call_to_action = data["call_to_action"]

	static func base64_to_image(base64_str: String) -> Image:
		var buffer: PackedByteArray = Marshalls.base64_to_raw(base64_str)
		var image = Image.new()
		image.load_png_from_buffer(buffer)
		return image

	static func image_to_texture(image: Image) -> ImageTexture:
		var image_texture = ImageTexture.create_from_image(image)
		return image_texture
