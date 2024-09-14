class_name AppOpenAdvertisement
extends Advertisement
## کلاس تبلیغات باز شدن اپلیکیشن جهت نگه داری اطلاعات و نمایش آن توسط نود ادیوری 
##
## کلاس تبلیغات باز شدن اپلیکیشن جهت نگه داری اطلاعات و نمایش آن توسط نود ادیوری 
## [br]
## جهت استفاده اطمینان حاصل کنید که مقدار [member placement_id] با [member type] آن مطابقت داشته باشند در غیر این صورت با خطا روبه رو خواهید شد. 

const DEFAULT_NAME: String = "AppOpen"
const DEFAULT_PLACEMENT_ID: String = "9e994784-7084-473b-8ef5-cf3e8820251a"

## آماده سازی 
## [br]
## [b]نکته:[/b] درصورتی که فعال باشد تبلیغ به صورت خودکار به حالت آماده سازی میرود.
@export var prepare: bool = true
## نمایش هنگام از سرگیری 
## هنگامی که بازی در بکگراند می رود بعد از گذشت 5 ثانیه پس از بازگشت به بازی یک تبلیغ نمایش می دهد. 
@export var show_on_resume: bool
## نام تبلیغ گاه 
## [br]
## [b]نکته:[/b] کاملا اختیاری میباشد و میتوان از آن استفاده کرد.
@export_placeholder(DEFAULT_NAME) var name: String
## شناسه تبلیغ گاه 
## [br]
## [b]نکته:[/b] درصورت تست مقدار پیشفرض را تغییر ندهید.
@export_placeholder(DEFAULT_PLACEMENT_ID) var placement_id: String

func _init() -> void:
	type = Type.APP_OPEN
	if not placement_id.is_empty(): return
	placement_id = DEFAULT_PLACEMENT_ID
