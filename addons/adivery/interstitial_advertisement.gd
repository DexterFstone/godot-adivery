class_name InterstitialAdvertisement
extends Advertisement
## کلاس تبلیغات میان صفحه ای جهت نگه داری اطلاعات و نمایش آن توسط نود ادیوری 
##
## کلاس تبلیغات میان صفحه ای جهت نگه داری اطلاعات و نمایش آن توسط نود ادیوری 
## [br]
## جهت استفاده اطمینان حاصل کنید که مقدار [member placement_id] با [member type] آن مطابقت داشته باشند در غیر این صورت با خطا روبه رو خواهید شد. 

const DEFAULT_NAME: String = "Interstitial"
const DEFAULT_PLACEMENT_ID: String = "142f7ca3-ce20-474b-a974-aaf9442b4c14"

## آماده سازی 
## [br]
## [b]نکته:[/b] درصورتی که فعال باشد تبلیغ به صورت خودکار به حالت آماده سازی میرود.
@export var prepare: bool = true
## نام تبلیغ گاه 
## [br]
## [b]نکته:[/b] کاملا اختیاری میباشد و میتوان از آن استفاده کرد.
@export_placeholder(DEFAULT_NAME) var name: String
## شناسه تبلیغ گاه 
## [br]
## [b]نکته:[/b] درصورت تست مقدار پیشفرض را تغییر ندهید.
@export_placeholder(DEFAULT_PLACEMENT_ID) var placement_id: String

func _init() -> void:
	type = Type.INTERSTITIAL
	if not placement_id.is_empty(): return
	placement_id = DEFAULT_PLACEMENT_ID
