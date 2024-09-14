class_name RewardedAdvertisement
extends Advertisement
## کلاس تبلیغات جایزه ای جهت نگه داری اطلاعات و نمایش آن توسط نود ادیوری 
##
## کلاس تبلیغات جایزه ای جهت نگه داری اطلاعات و نمایش آن توسط نود ادیوری 
## [br]
## جهت استفاده اطمینان حاصل کنید که مقدار [member placement_id] با [member type] آن مطابقت داشته باشند در غیر این صورت با خطا روبه رو خواهید شد. 

const DEFAULT_NAME: String = "Rewarded"
const DEFAULT_PLACEMENT_ID: String = "39108e60-55bb-4f35-b903-810b844c72fe"

## درخواست 
## [br]
## [b]نکته:[/b] درصورتی که فعال باشد تبلیغ به صورت خودکار به حالت آماده سازی میرود.
@export var request: bool = true
## نام تبلیغ گاه 
## [br]
## [b]نکته:[/b] کاملا اختیاری میباشد و میتوان از آن استفاده کرد.
@export_placeholder(DEFAULT_NAME) var name: String
## شناسه تبلیغ گاه 
## [br]
## [b]نکته:[/b] درصورت تست مقدار پیشفرض را تغییر ندهید.
@export_placeholder(DEFAULT_PLACEMENT_ID) var placement_id: String

func _init() -> void:
	type = Type.REWARDED
	if not placement_id.is_empty(): return
	placement_id = DEFAULT_PLACEMENT_ID
