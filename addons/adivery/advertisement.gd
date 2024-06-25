@tool
class_name Advertisement
extends Resource
## کلاس تبلیغات جهت نگه داری اطلاعات و نمایش آن توسط نود ادیوری
##
## جهت استفاده اطمینان حاصل کنید که مقدار [member placement_id] با [member type] آن مطابقت داشته باشند در غیر این صورت با خطا روبه رو خواهید شد.

## نود تبلیغات
enum Type {
	## باز شدن اپلیکیشن
	APP_OPEN,
	## میان صفحه ای
	INTERSTITIAL,
	## جایزه ای
	REWARDED,
}

## آماده سازی
## [br]
## [b]نکته:[/b] درصورتی که فعال باشد تبلیغ به صورت خودکار به حالت آماده سازی میرود.
@export var prepare: bool
## نود تبلیغات
@export var type: Type:
	set(new_type):
		if type != new_type:
			type = new_type
			notify_property_list_changed()
		
## نام تبلیغ گاه
## [br]
## [b]نکته:[/b] کاملا اختیاری میباشد و میتوان از آن استفاده کرد.
@export var name: String
## شناسه تبلیغ گاه
## [br]
## [b]نکته:[/b] درصورت تست مقدار پیشفرض را تغییر ندهید.
@export var placement_id: String

func _validate_property(property: Dictionary) -> void:
	if property.name == "placement_id":
		if not placement_id.is_empty(): return
		if type == Type.INTERSTITIAL:
			placement_id = "38b301f2-5e0c-4776-b671-c6b04a612311"
		elif type == Type.REWARDED:
			placement_id = "16414bae-368e-4904-b259-c5b89362206d"
		else :
			placement_id = "شناسه تست وجود ندارد"
	if property.name == "name":
		if not name.is_empty(): return
		if type == Type.INTERSTITIAL:
			name = "interstitial"
		elif type == Type.REWARDED:
			name = "rewarded"
		else :
			name = "app open"
