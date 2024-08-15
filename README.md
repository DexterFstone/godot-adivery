<p align="center"> <img src="https://www.adivery.com/wp-content/uploads/2021/06/logo3.svg" </p>
<h1 align="center"> گودو ادیوری </h1>
<p align="center">  پلاگین ادیوری برای موتور بازی سازی گودو </p>

## فهرست مطالب
- [پیش نیازها](#پیش-نیازها)
- [دریافت ادیوری](#دریافت-ادیوری)
- [نصب ادیوری](#نصب-ادیوری)
	- [روش اول (دریافت از Release)](#روش-اول)
	- [روش دوم (دریافت از Asset Library)](#روش-دوم)
	- [روش سوم (پیشنهادی)](#روش-سوم)
 - درحال تکمیل...

## پیش نیازها
- گودو 4.2 و یا بالاتر
- [خروجی اندروید](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html)
- [خروجی اندروید با گریدل](https://docs.godotengine.org/en/stable/tutorials/export/android_gradle_build.html)
 
## دریافت ادیوری
ادیوری را میتوانید از [Asset Library](https://godotengine.org/asset-library/asset/3094) و یا [Release](https://github.com/DexterFstone/godot-adivery/releases) دریافت کنید.

## نصب ادیوری
### روش اول
- پس از دریافت ادیوری از [Release](https://github.com/DexterFstone/godot-adivery/releases) فایل زیپ را استخراج کنید.
- فایل استخراج شده را در محل پروژه خود کپی کنید.
- از منوی `Project` وارد قسمت `Project Settings` و وارد تب `Plugins` شوید.
- در مرحله آخر تیک فعال سازی ادیوری را بزنید.
<p align="center"> <img src="/screenshots/01%20Enabling%20Plugin.PNG" </p>
  
### روش دوم
- پس از دریافت ادیوری از [Asset Library](https://godotengine.org/asset-library/asset/3094) فایل زیپ را استخراج کنید.
- فایل استخراج شده را در محل پروژه خود کپی کنید.
- از منوی `Project` وارد قسمت `Project Settings` و وارد تب `Plugins` شوید.
- در مرحله آخر تیک فعال سازی ادیوری را بزنید.
<p align="center"> <img src="/screenshots/01%20Enabling%20Plugin.PNG" </p>

### روش سوم
- در داخل گودو به تب `AssetLib` بروید.
- در بخش جستوجو به دنبال `Adivery` بگردید و روی آن کلیک کنید.
- در پنجره باز شده روی `Download` کلیک کنید.

<p align="center"> <img src="/screenshots/02%20Download%20Adivery.PNG" </p>
  
- بعد زا دانلود شدن روی `Install` کلیک کنید.
- از منوی Project وارد قسمت `Project Settings` و وارد تب `Plugins` شوید.
- در مرحله آخر تیک فعال سازی ادیوری را بزنید.
<p align="center"> <img src="/screenshots/01%20Enabling%20Plugin.PNG" </p>

## نحوه استفاده
### روش اول (پیشنهادی)
- یک سین جدید ساخته و نود ادیوری به آن اضافه کنید.
<p align="center"> <img src="/screenshots/03%20Add%20Adivery%20To%20Scene.PNG" </p>

- جهت استفاده از سیگنال ها، نود ادیوری را انتخاب کرده، در اینسپکتور و در قسمت اسکریپت بر روی فلش اسکریپت کلیک کرده و روی `Extend Script` کلیک میکنیم.
<p align="center"> <img src="/screenshots/11%20Extend%20Script.PNG" </p>
<p align="center"> <img src="/screenshots/08%20Add%20New%20Script%20To%20Adivery.PNG" </p>

- در اینسپکتور در بخش `App Id` شناسته اپلیکیشن خود را از [داشبورد ادیوری](https://panel.adivery.com/) دریافت کرده و جایگزین کنید.

> [!NOTE]
> جهت تست پلاگین پیشنهاد میشود مقدار فیلد را تغییر ندهید. پلاگین به صورت پیشفرض از شناسه تست درج شده در [سایت ادیوری](https://docs.adivery.com/testing) استفاده میکند.
<p align="center"> <img src="/screenshots/04%20Update%20App%20ID.PNG" </p>

- در قدم بعد و در بخش `Advertisements` کلیک کرده و یک آیتم جدید اضافه کنید.
- تبلیغ های قابل پیاده سازی به ترتیب، باز شدن اپلیکیشن (بازشگت به برنامه)، میان صفحه ای (تمام صفحه میانی) و جایزه ای (تمام صفحه جایزه ای) می باشد.
> [!WARNING]
> به هیچ عنوان از نوع `advertisement` استفاده نکنید. `advertisement` کلاس پایه برای تبلیغات می باشد و قابلیت استفاده مستقیم ندارد.
<p align="center"> <img src="/screenshots/05%20Add%20Advertisement%20To%20Adivery.png" </p>

> [!NOTE]
> به هر تعداد تبلیغ که نیاز داشتید می توانید اضافه کنید و محدودیتی ندارید.

- در اینجا ما از هر تبلیغ یک نمونه ایجاد میکنیم.
<p align="center"> <img src="/screenshots/06%20Add%20Advertisements%20To%20Adivery.png" </p>

- درآخر سین را ذخیره کردن و در قسمت تنظیمات پروژه به [اتولود](https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html) رفته و سین را اضافه میکنیم. حال میتوان از پلاگین استفاده کرد و همه جا قابلیت دسترسی دارد.
<p align="center"> <img src="/screenshots/07%20Add%20To%20Autoload.PNG" </p>

> [!WARNING]
> توجه داشته باشید که نام نود را در قسمت اتولود تغییر دهید و امکان استفاده از نام `Adivery` نمی باشد. برای مثال ما در اینجا `AdiveryManager` قرار داده ایم و تا انتهای آموزش از آن استفاده میکنیم.

### روش دوم
- یک اسکریپت ساخته و نوع آن را `Adivery` قرار میدهیم.
<p align="center"> <img src="/screenshots/09%20Create%20New%20Script.PNG" </p>

- در قسمت تنظیمات پروژه به [اتولود](https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html) رفته و اسکریپت را اضافه میکنیم. حال میتوان از پلاگین استفاده کرد و همه جا قابلیت دسترسی دارد.
<p align="center"> <img src="/screenshots/10%20Add%20To%20Autoload.PNG" </p>

> [!WARNING]
> توجه داشته باشید که نام نود را در قسمت اتولود تغییر دهید و امکان استفاده از نام `Adivery` نمی باشد. برای مثال ما در اینجا `AdiveryManager` قرار داده ایم و تا انتهای آموزش از آن استفاده میکنیم.

- حال در اسکریپت دستورات زیر را می نویسیم.
```gdscript
extends Adivery

func _ready() -> void:
	# پیکربندی ادیوری 
	configure("شناسه اپلیکیشن")
	# ساخت تبلیغ بازشدن اپلیکیشن 
	var app_open_advertisement:= AppOpenAdvertisement.new()
	app_open_advertisement.placement_id = "شناسه تبلیغ"
	# ساخت تبلیغ میان صفحه ای 
	var interstitial_advertisement:= InterstitialAdvertisement.new()
	interstitial_advertisement.placement_id = "شناسه تبلیغ"
	# ساخت تبلیغ جایزه ای 
	var rewarded_advertisement:= RewardedAdvertisement.new()
	rewarded_advertisement.placement_id = "شناسه تبلیغ"
	# آماده سازی تبلیغ بازشدن اپلیکیشن 
	prepare_app_open_ad(app_open_advertisement)
	# آماده سازی تبلیغ میان صفحه ای 
	prepare_interstitial_ad(interstitial_advertisement)
	# آماده سازی تبلیغ جایزه ای 
	request_rewarded_ad(rewarded_advertisement)
```
> [!WARNING]
> درصورت تست پلاگین، شناسه اپلیکیشن و شناسه تبلیغ را خالی قرار دهید. پلاگین به صورت پیشفرض از شناسه تست درج شده در [سایت ادیوری](https://docs.adivery.com/testing) استفاده میکند.
```gdscript
extends Adivery

# ساخت تبلیغ بازشدن اپلیکیشن 
@onready var app_open_advertisement:= AppOpenAdvertisement.new()
# ساخت تبلیغ میان صفحه ای 
@onready var interstitial_advertisement:= InterstitialAdvertisement.new()
# ساخت تبلیغ جایزه ای 
@onready var rewarded_advertisement:= RewardedAdvertisement.new()

func _ready() -> void:
	# پیکربندی ادیوری 
	configure()
	# آماده سازی تبلیغ بازشدن اپلیکیشن 
	prepare_app_open_ad(app_open_advertisement)
	# آماده سازی تبلیغ میان صفحه ای 
	prepare_interstitial_ad(interstitial_advertisement)
	# آماده سازی تبلیغ جایزه ای 
	request_rewarded_ad(rewarded_advertisement)

```
> [!NOTE]
> به هر تعداد تبلیغ که نیاز داشتید می توانید اضافه کنید و محدودیتی ندارید.


