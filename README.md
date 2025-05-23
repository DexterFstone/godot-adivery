<p align="center"> <img src="https://www.adivery.com/wp-content/uploads/2021/06/logo3.svg" width="256" height="256"> </p>
<h1 align="center"> گودو ادیوری </h1>
<p align="center">  پلاگین ادیوری برای موتور بازی سازی گودو </p>

## فهرست مطالب
- [پیش نیازها](#پیش-نیازها)
- [دریافت ادیوری](#دریافت-ادیوری)
- [نصب ادیوری](#نصب-ادیوری)
	- [روش اول (دریافت از Release)](#روش-اول-دریافت-از-Release)
	- [روش دوم (دریافت از Asset Library)](#روش-دوم-دریافت-از-Asset-Library)
	- [روش سوم (پیشنهادی)](#روش-سوم-پیشنهادی)
- [نحوه استفاده](#نحوه-استفاده)
 	- [روش اول (پیشنهادی)](#روش-اول-پیشنهادی)
  	- [روش دوم](#روش-دوم)
- [پیاده سازی تبلیغات بازشدن اپلیکیشن (بازگشت به برنامه)](#پیاده-سازی-تبلیغات-بازشدن-اپلیکیش-بازگشت-به-برنامه)
	- [روش اول (پیشنهادی)](#روش-اول-پیشنهادی-1)
 	- [روش دوم](#روش-دوم-1)
- [پیاده سازی تبلیغات میان صفحه ای (تمام صفحه میانی)](#پیاده-سازی-تبلیغات-میان-صفحه-ای-تمام-صفحه-میانی)
	- [روش اول (پیشنهادی)](#روش-اول-پیشنهادی-2)
	 - [روش دوم](#روش-دوم-2)
- [پیاده سازی تبلیغات جایزه ای (تمام صفحه جایزه ای)](#پیاده-سازی-تبلیغات-جایزه-ای-تمام-صفحه-جایزه-ای)
	- [روش اول (پیشنهادی)](#روش-اول-پیشنهادی-3)
	- [روش دوم](#روش-دوم-3)
- [پیاده سازی تبلیغات بنری](#پیاده-سازی-تبلیغات-بنری)
	- [روش اول (پیشنهادی)](#روش-اول-پیشنهادی-4)
	- [روش دوم](#روش-دوم-4)
- [پیاده سازی تبلیغات همسان](#پیاده-سازی-تبلیغات-همسان)

## پیش نیازها
- گودو 4.2 و یا بالاتر
- [خروجی اندروید](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html)
- [خروجی اندروید با گریدل](https://docs.godotengine.org/en/stable/tutorials/export/android_gradle_build.html)
 
## دریافت ادیوری
ادیوری را میتوانید از [Asset Library](https://godotengine.org/asset-library/asset/3094) و یا [Release](https://github.com/DexterFstone/godot-adivery/releases) دریافت کنید.

## نصب ادیوری
### روش اول (دریافت از Release)
- پس از دریافت ادیوری از [Release](https://github.com/DexterFstone/godot-adivery/releases) فایل زیپ را استخراج کنید.
- فایل استخراج شده را در محل پروژه خود کپی کنید.
- از منوی `Project` وارد قسمت `Project Settings` و وارد تب `Plugins` شوید.
- در مرحله آخر تیک فعال سازی ادیوری را بزنید.
<p align="center"> <img src="/screenshots/01%20Enabling%20Plugin.PNG" </p>
  
### روش دوم (دریافت از Asset Library)
- پس از دریافت ادیوری از [Asset Library](https://godotengine.org/asset-library/asset/3094) فایل زیپ را استخراج کنید.
- فایل استخراج شده را در محل پروژه خود کپی کنید.
- از منوی `Project` وارد قسمت `Project Settings` و وارد تب `Plugins` شوید.
- در مرحله آخر تیک فعال سازی ادیوری را بزنید.
<p align="center"> <img src="/screenshots/01%20Enabling%20Plugin.PNG" </p>

### روش سوم (پیشنهادی)
- در داخل گودو به تب `AssetLib` بروید.
- در بخش جستوجو به دنبال `Adivery` بگردید و روی آن کلیک کنید.
- در پنجره باز شده روی `Download` کلیک کنید.

<p align="center"> <img src="/screenshots/02%20Download%20Adivery.PNG" </p>
  
- بعد از دانلود شدن روی `Install` کلیک کنید.
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

> [!TIP]
> جهت تست پلاگین پیشنهاد میشود مقدار فیلد را تغییر ندهید. پلاگین به صورت پیشفرض از شناسه تست استفاده میکند.
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

# ساخت تبلیغ بازشدن اپلیکیشن 
@onready var app_open_advertisement:= AppOpenAdvertisement.new()
# ساخت تبلیغ میان صفحه ای 
@onready var interstitial_advertisement:= InterstitialAdvertisement.new()
# ساخت تبلیغ جایزه ای 
@onready var rewarded_advertisement:= RewardedAdvertisement.new()

func _ready() -> void:
	# پیکربندی ادیوری 
	configure("شناسه اپلیکیشن")
	app_open_advertisement.placement_id = "شناسه تبلیغ"
	interstitial_advertisement.placement_id = "شناسه تبلیغ"
	rewarded_advertisement.placement_id = "شناسه تبلیغ"
	# آماده سازی تبلیغ بازشدن اپلیکیشن 
	prepare_app_open_ad(app_open_advertisement)
	# آماده سازی تبلیغ میان صفحه ای 
	prepare_interstitial_ad(interstitial_advertisement)
	# آماده سازی تبلیغ جایزه ای 
	request_rewarded_ad(rewarded_advertisement)
```
> [!TIP]
> درصورت تست پلاگین، شناسه اپلیکیشن و شناسه تبلیغ را خالی قرار دهید. پلاگین به صورت پیشفرض از شناسه تست استفاده میکند.
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

## پیاده سازی تبلیغات بازشدن اپلیکیش (بازگشت به برنامه)
### روش اول (پیشنهادی)
- اطمینان حاصل کنید که ادیوری را به [روش اول](#روش-اول-پیشنهادی) پیکربندی کرده باشید.
- در قدم بعد نیاز می باشد تا اطلاعات تبلیغ را ویرایش کنیم.
<p align="center"> <img src="/screenshots/12%20Update%20Ad%20Info.PNG" </p>
	
- در بخش اول `Prepare` یا آماده سازی خودکار را داریم. درصورت فعال بودن پلاگین به صورت خودکار تبلیغ را آماده سازی می کند. درصورت غیرفعال بودن احتیاج است تا متد `()prepare_app_open_ad` را صدا بزنید.
- در بخش بعد `Show on Resume` یا نمایش در زمان ورود را داریم. زمانی که این گزینه فعال باشد، درصورتی که اپلیکیشن شما به مدت 5 ثانیه یا بیشتر در پس زمینه باشد، بعد از بازگشت کاربر یک تبلیغ به آن نمایش داده می شود که یکی از اصولی ترین روش های نمایش تبلیغ بازشددن اپلیکیشن (بازگشت به برنامه) می باشد.
> [!NOTE]
> نمایش در زمان ورود، فقط و فقط برای یک تبلیغ اتفاق می افتد و الویت با آخرین تبلیغی است که این گزینه را فعال دارد.

- در بخش بعد `Name` یا نام تبلیغ را داریم. این فیلد کاملا اختیاری می باشد و می توان در بخشی از گیم پلی یا جهت دیباگ از آن استفاده کرد.
- در بخش آخر `Placement ID` یا شناسه تبلیغ را داریم. شناسه تبلیغ را میتوان از [داشبورد ادیوری](https://panel.adivery.com/) دریافت کرده و جایگزین کنید تا درآمد تبلیغ برای شما محاسبه شود.

> [!TIP]
> توجه داشته باشید که در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با نام پکیج تعریف شده در [داشبورد ادیوری](https://panel.adivery.com/) شما باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.

> [!TIP]
> درصورت تست پلاگین، مقدار پیشفرض را تغییر ندهید پلاگین به صورت پیشفرض از شناسه تست استفاده می کند.

> [!TIP]
> توجه داشته باشید در صورت تست پلاگین، در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با `org.godotengine.adivery` باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.
> <p align="center"> <img src="/screenshots/13%20Set%20Package%20Name.PNG" </p>
- در آخر می توان با استفاده از دستور `()AdiveryManager.show_app_open_ad` تبلیغ خود را در جای مناسب نمایش دهید.
- جهت اطلاع از وضعیت تبلیغ کافی است سیگنال های آن را در قسمت اینسپکتور متصل کنید.
<p align="center"> <img src="/screenshots/14%20Connect%20Signals.PNG" </p>

```gdscript
...
func _on_app_open_ad_clicked(advertisement: Advertisement) -> void:
	pass # تبلیغ کلیک شد

func _on_app_open_ad_closed(advertisement: Advertisement) -> void:
	pass # تبلیغ بسته شد

func _on_app_open_ad_loaded(advertisement: Advertisement) -> void:
	pass # تبلیغ بارگیری شد

func _on_app_open_ad_shown(advertisement: Advertisement) -> void:
	pass # تبلیغ نمایش داده شد
...
```
### روش دوم
- اطمینان حاصل کنید که ادیوری را به [روش دوم](#روش-دوم-1) پیکربندی کرده باشید.
```gdscript
extends Adivery
# ساخت تبلیغ بازشدن اپلیکیشن 
@onready var app_open_advertisement:= AppOpenAdvertisement.new()

func _ready() -> void:
	# پیکربندی ادیوری
	app_id = "1d0b8063-4971-4310-a7b1-8330ef89f46d"
	configure()
	# آماده سازی تبلیغ بازشدن اپلیکیشن 
	app_open_advertisement.show_on_resume = true
	app_open_advertisement.name = "YOUR ADVERTISEMENT NAME"
	app_open_advertisement.placement_id = "9e994784-7084-473b-8ef5-cf3e8820251a"
	prepare_app_open_ad(app_open_advertisement)
	# اتصال سیگنال ها جهت بررسی وضعیت تبلیغ
	app_open_ad_clicked.connect(_on_app_open_ad_clicked)
	app_open_ad_closed.connect(_on_app_open_ad_closed)
	app_open_ad_loaded.connect(_on_app_open_ad_loaded)
	app_open_ad_shown.connect(_on_app_open_ad_shown)

func _on_app_open_ad_clicked(advertisement: Advertisement) -> void:
	pass # تبلیغ کلیک شد

func _on_app_open_ad_closed(advertisement: Advertisement) -> void:
	pass # تبلیغ بسته شد

func _on_app_open_ad_loaded(advertisement: Advertisement) -> void:
	pass # تبلیغ بارگیری شد

func _on_app_open_ad_shown(advertisement: Advertisement) -> void:
	pass # تبلیغ نمایش داده شد
```
> [!NOTE]
> نمایش در زمان ورود یا `show_on_resume`، فقط و فقط برای یک تبلیغ اتفاق می افتد و الویت با آخرین تبلیغی است که این گزینه را فعال دارد.

> [!TIP]
> توجه داشته باشید که در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با نام پکیج تعریف شده در [داشبورد ادیوری](https://panel.adivery.com/) شما باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.

> [!TIP]
> درصورت تست پلاگین، مقدار پیشفرض `placement_id` , `app_id` را تغییر ندهید پلاگین به صورت پیشفرض از شناسه تست استفاده می کند.

> [!TIP]
> توجه داشته باشید در صورت تست پلاگین، در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با `org.godotengine.adivery` باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.
> <p align="center"> <img src="/screenshots/13%20Set%20Package%20Name.PNG" </p>
- در آخر می توان با استفاده از دستور `(app_open_advertisement)AdiveryManager.show_app_open_ad` تبلیغ خود را در جای مناسب نمایش دهید.
> [!TIP]
> درصورتی که متد `()AdiveryManager.show_app_open_ad` بدون پارامتر صدا زده شده باشد هیچ تبلیغی نمایش داده نمی شود و قبل از آن باید با متد `(app_open_advertisement)add_advertisement`، تبلیغ خود را به ادیوری اضافه کرده باشید.
```gdscript
...
	configure()
	# آماده سازی تبلیغ بازشدن اپلیکیشن 
	app_open_advertisement.show_on_resume = true
	app_open_advertisement.name = "YOUR ADVERTISEMENT NAME"
	app_open_advertisement.placement_id = "9e994784-7084-473b-8ef5-cf3e8820251a"
	add_advertisement(app_open_advertisement)
	prepare_app_open_ad()
...

...
	AdiveryManager.show_app_open_ad()
...
```
## پیاده سازی تبلیغات میان صفحه ای (تمام صفحه میانی)
## روش اول (پیشنهادی)
- اطمینان حاصل کنید که ادیوری را به [روش اول](#روش-اول-پیشنهادی) پیکربندی کرده باشید.
- در قدم بعد نیاز می باشد تا اطلاعات تبلیغ را ویرایش کنیم.
<p align="center"> <img src="/screenshots/15%20Update%20Ad%20Info.PNG" </p>
	
- در بخش اول `Prepar` یا آماده سازی خودکار را داریم. درصورت فعال بودن پلاگین به صورت خودکار تبلیغ را آماده سازی می کند. درصورت غیرفعال بودن احتیاج است تا متد `()prepare_interstitial_ad` را صدا بزنید.
- در بخش بعد `Name` یا نام تبلیغ را داریم. این فیلد کاملا اختیاری می باشد و می توان در بخشی از گیم پلی یا جهت دیباگ از آن استفاده کرد.
- در بخش آخر `Placement ID` یا شناسه تبلیغ را داریم. شناسه تبلیغ را میتوان از [داشبورد ادیوری](https://panel.adivery.com/) دریافت کرده و جایگزین کنید تا درآمد تبلیغ برای شما محاسبه شود.

> [!TIP]
> توجه داشته باشید که در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با نام پکیج تعریف شده در [داشبورد ادیوری](https://panel.adivery.com/) شما باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.

> [!TIP]
> درصورت تست پلاگین، مقدار پیشفرض را تغییر ندهید پلاگین به صورت پیشفرض از شناسه تست استفاده می کند.

> [!TIP]
> توجه داشته باشید در صورت تست پلاگین، در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با `org.godotengine.adivery` باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.
> <p align="center"> <img src="/screenshots/13%20Set%20Package%20Name.PNG" </p>
- در آخر می توان با استفاده از دستور `()AdiveryManager.show_interstitial_ad` تبلیغ خود را در جای مناسب نمایش دهید.
- جهت اطلاع از وضعیت تبلیغ کافی است سیگنال های آن را در قسمت اینسپکتور متصل کنید.
<p align="center"> <img src="/screenshots/16%20Connect%20Signals.PNG" </p>
	
```gdscript
...
func _on_interstitial_ad_clicked(advertisement: Advertisement) -> void:
	pass # تبلیغ کلیک شد 

func _on_interstitial_ad_closed(advertisement: Advertisement) -> void:
	pass # تبلیغ بسته شد 

func _on_interstitial_ad_loaded(advertisement: Advertisement) -> void:
	pass # تبلیغ بارگیری شد 

func _on_interstitial_ad_shown(advertisement: Advertisement) -> void:
	pass # تبلیغ نمایش داده شد 
...
```
### روش دوم
- اطمینان حاصل کنید که ادیوری را به [روش دوم](#روش-دوم-1) پیکربندی کرده باشید.
```gdscript
extends Adivery
# ساخت تبلیغ میان صفحه ای 
@onready var interstitial_advertisement:= InterstitialAdvertisement.new()

func _ready() -> void:
	# پیکربندی ادیوری
	app_id = "1d0b8063-4971-4310-a7b1-8330ef89f46d"
	configure()
	# آماده سازی تبلیغ میان صفحه ای 
	interstitial_advertisement.name = "YOUR ADVERTISEMENT NAME"
	interstitial_advertisement.placement_id = "142f7ca3-ce20-474b-a974-aaf9442b4c14"
	prepare_interstitial_ad(interstitial_advertisement)
	# اتصال سیگنال ها جهت بررسی وضعیت تبلیغ 
	interstitial_ad_clicked.connect(_on_interstitial_ad_clicked)
	interstitial_ad_closed.connect(_on_interstitial_ad_closed)
	interstitial_ad_loaded.connect(_on_interstitial_ad_loaded)
	interstitial_ad_shown.connect(_on_interstitial_ad_shown)

func _on_interstitial_ad_clicked(advertisement: Advertisement) -> void:
	pass # تبلیغ کلیک شد

func _on_interstitial_ad_closed(advertisement: Advertisement) -> void:
	pass # تبلیغ بسته شد

func _on_interstitial_ad_loaded(advertisement: Advertisement) -> void:
	pass # تبلیغ بارگیری شد

func _on_interstitial_ad_shown(advertisement: Advertisement) -> void:
	pass # تبلیغ نمایش داده شد

```
> [!TIP]
> توجه داشته باشید که در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با نام پکیج تعریف شده در [داشبورد ادیوری](https://panel.adivery.com/) شما باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.

> [!TIP]
> درصورت تست پلاگین، مقدار پیشفرض `placement_id` , `app_id` را تغییر ندهید پلاگین به صورت پیشفرض از شناسه تست استفاده می کند.

> [!TIP]
> توجه داشته باشید در صورت تست پلاگین، در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با `org.godotengine.adivery` باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.
> <p align="center"> <img src="/screenshots/13%20Set%20Package%20Name.PNG" </p>
- در آخر می توان با استفاده از دستور `(interstitial_advertisement)AdiveryManager.show_interstitial_ad` تبلیغ خود را در جای مناسب نمایش دهید.
> [!TIP]
> درصورتی که متد `()AdiveryManager.show_interstitial_ad` بدون پارامتر صدا زده شده باشد هیچ تبلیغی نمایش داده نمی شود و قبل از آن باید با متد `(interstitial_advertisement)add_advertisement`، تبلیغ خود را به ادیوری اضافه کرده باشید.
```gdscript
...
	configure()
	# آماده سازی تبلیغ میان صفحه ای
	interstitial_advertisement.name = "YOUR ADVERTISEMENT NAME"
	interstitial_advertisement.placement_id = "142f7ca3-ce20-474b-a974-aaf9442b4c14"
	add_advertisement(interstitial_advertisement)
	prepare_interstitial_ad()
...

...
	AdiveryManager.show_interstitial_ad()
...
```
## پیاده سازی تبلیغات جایزه ای (تمام صفحه جایزه ای)
## روش اول (پیشنهادی)
- اطمینان حاصل کنید که ادیوری را به [روش اول](#روش-اول-پیشنهادی) پیکربندی کرده باشید.
- در قدم بعد نیاز می باشد تا اطلاعات تبلیغ را ویرایش کنیم.
<p align="center"> <img src="/screenshots/17%20Update%20Ad%20Info.PNG" </p>
	
- در بخش اول `Request` یا آماده سازی خودکار را داریم. درصورت فعال بودن پلاگین به صورت خودکار تبلیغ را آماده سازی می کند. درصورت غیرفعال بودن احتیاج است تا متد `()request_rewarded_ad` را صدا بزنید.
- در بخش بعد `Name` یا نام تبلیغ را داریم. این فیلد کاملا اختیاری می باشد و می توان در بخشی از گیم پلی یا جهت دیباگ از آن استفاده کرد.
- در بخش آخر `Placement ID` یا شناسه تبلیغ را داریم. شناسه تبلیغ را میتوان از [داشبورد ادیوری](https://panel.adivery.com/) دریافت کرده و جایگزین کنید تا درآمد تبلیغ برای شما محاسبه شود.

> [!TIP]
> توجه داشته باشید که در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با نام پکیج تعریف شده در [داشبورد ادیوری](https://panel.adivery.com/) شما باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.

> [!TIP]
> درصورت تست پلاگین، مقدار پیشفرض را تغییر ندهید پلاگین به صورت پیشفرض از شناسه تست استفاده می کند.

> [!TIP]
> توجه داشته باشید در صورت تست پلاگین، در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با `org.godotengine.adivery` باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.
> <p align="center"> <img src="/screenshots/13%20Set%20Package%20Name.PNG" </p>
- در آخر می توان با استفاده از دستور `()AdiveryManager.show_rewarded_ad` تبلیغ خود را در جای مناسب نمایش دهید.
- جهت اطلاع از وضعیت تبلیغ کافی است سیگنال های آن را در قسمت اینسپکتور متصل کنید.
<p align="center"> <img src="/screenshots/18%20Connect%20Signals.PNG" </p>
	
```gdscript
...
func _on_rewarded_ad_clicked(advertisement: Advertisement) -> void:
	pass # تبلیغ کلیک شد 

func _on_rewarded_ad_closed(advertisement: Advertisement, is_rewarded: bool) -> void:
	pass # تبلیغ بسته شد 

func _on_rewarded_ad_loaded(advertisement: Advertisement) -> void:
	pass # تبلیغ بارگیری شد 

func _on_rewarded_ad_shown(advertisement: Advertisement) -> void:
	pass # تبلیغ نمایش داده شد 
...
```
> [!TIP]
> جهت جایزه دادن به کاربر از سیگنال `()on_rewarded_ad_closed_` استفاده کنید و با بررسی مقدار `is_rewarded` جایزه را بدهید.
```gdscript
func _on_rewarded_ad_closed(advertisement: Advertisement, is_rewarded: bool) -> void:
	if is_rewarded:
		pass # دستورات دادن جایزه
```
### روش دوم
- اطمینان حاصل کنید که ادیوری را به [روش دوم](#روش-دوم-1) پیکربندی کرده باشید.
```gdscript
extends Adivery
# ساخت تبلیغ جایزه ای 
@onready var rewarded_advertisement:= RewardedAdvertisement.new()

func _ready() -> void:
	# پیکربندی ادیوری
	app_id = "1d0b8063-4971-4310-a7b1-8330ef89f46d"
	configure()
	# آماده سازی تبلیغ جایزه ای 
	rewarded_advertisement.name = "YOUR ADVERTISEMENT NAME"
	rewarded_advertisement.placement_id = "39108e60-55bb-4f35-b903-810b844c72fe"
	request_rewarded_ad(rewarded_advertisement)
	# اتصال سیگنال ها جهت بررسی وضعیت تبلیغ 
	rewarded_ad_clicked.connect(_on_rewarded_ad_clicked)
	rewarded_ad_closed.connect(_on_rewarded_ad_closed)
	rewarded_ad_loaded.connect(_on_rewarded_ad_loaded)
	rewarded_ad_shown.connect(_on_rewarded_ad_shown)

func _on_rewarded_ad_clicked(advertisement: Advertisement) -> void:
	pass # تبلیغ کلیک شد 

func _on_rewarded_ad_closed(advertisement: Advertisement, is_rewarded: bool) -> void:
	if is_rewarded:
		pass # دستورات دادن جایزه 
	pass # تبلیغ بسته شد 

func _on_rewarded_ad_loaded(advertisement: Advertisement) -> void:
	pass # تبلیغ بارگیری شد 

func _on_rewarded_ad_shown(advertisement: Advertisement) -> void:
	pass # تبلیغ نمایش داده شد 

```
> [!TIP]
> توجه داشته باشید که در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با نام پکیج تعریف شده در [داشبورد ادیوری](https://panel.adivery.com/) شما باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.

> [!TIP]
> درصورت تست پلاگین، مقدار پیشفرض `placement_id` , `app_id` را تغییر ندهید پلاگین به صورت پیشفرض از شناسه تست استفاده می کند.

> [!TIP]
> توجه داشته باشید در صورت تست پلاگین، در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با `org.godotengine.adivery` باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.
> <p align="center"> <img src="/screenshots/13%20Set%20Package%20Name.PNG" </p>
- در آخر می توان با استفاده از دستور `(rewarded_advertisement)AdiveryManager.show_rewarded_ad` تبلیغ خود را در جای مناسب نمایش دهید.
> [!TIP]
> درصورتی که متد `()AdiveryManager.show_rewarded_ad` بدون پارامتر صدا زده شده باشد هیچ تبلیغی نمایش داده نمی شود و قبل از آن باید با متد `(rewarded_advertisement)add_advertisement`، تبلیغ خود را به ادیوری اضافه کرده باشید.
```gdscript
...
	configure()
	# آماده سازی تبلیغ میان صفحه ای
	rewarded_advertisement.name = "YOUR ADVERTISEMENT NAME"
	rewarded_advertisement.placement_id = "142f7ca3-ce20-474b-a974-aaf9442b4c14"
	add_advertisement(rewarded_advertisement)
	request_rewarded_ad()
...

...
	AdiveryManager.show_rewarded_ad()
...
```
## پیاده سازی تبلیغات بنری
## روش اول (پیشنهادی)
- اطمینان حاصل کنید که ادیوری را به [روش اول](#روش-اول-پیشنهادی) پیکربندی کرده باشید.
- یک نود از نوع `BannerAdvertisement` به سین خود اضافه کرده.
<p align="center"> <img src="/screenshots/19%20Add%20Banner%20To%20Scene.PNG" </p>
- در اینسپکتور تنظیمات بنر به این ترتیب می باشد.
<p align="center"> <img src="/screenshots/20%20Update%20Ad%20Info.PNG" </p>

- در بخش اول `Visibility` یا نمایان بودن بنر را داریم، با فعال و غیر فعال کردن این گزینه میتوانید بنر را پنهان یا آشکار کنید.
- در بخش بعد `Prepar` یا آماده سازی خودکار را داریم. درصورت فعال بودن پلاگین به صورت خودکار تبلیغ را آماده سازی می کند. درصورت غیرفعال بودن احتیاج است تا متد `()prepare_banner_ad` را صدا بزنید.
- در بخدش بعد `Retry on Error` یا تلاش مجدد هنگام خطا را داریم، درصورت فعال بودن، زمانی که تبلیغ با خطا روبه رو شد (برای مثال اینترنت قطع و وصل شد.)، مجدد اقدام به بارگیری تبلیغ میکند.
- در بخش بعد `Banner Size` یا انداز بنر را داریم که به این ترتیب می باشد.
	- سایز بنر یا `Banner` که 320 در 50 می باشد.
	- سایز بنر بزرگ یا `Large Banner` که 320 در 100 می باشد.
	- سایز بنر مستطیل متوسط یا `Medium Rectangle` که 300 در 250 می باشد.
	- سایز بنر هوشمند یا `Smart Banner` که تمام طول در 50 یا 90 می باشد.
- در بخش آخر `Placement ID` یا شناسه تبلیغ را داریم. شناسه تبلیغ را میتوان از [داشبورد ادیوری](https://panel.adivery.com/) دریافت کرده و جایگزین کنید تا درآمد تبلیغ برای شما محاسبه شود.
> [!CAUTION]
> به هیچ عنوان از شناسه تبلیغ یکسان برای چندین بنر استفاده نکنید که دچار ارور خواهید شد.

> [!TIP]
> توجه داشته باشید که در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با نام پکیج تعریف شده در [داشبورد ادیوری](https://panel.adivery.com/) شما باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.

> [!TIP]
> درصورت تست پلاگین، مقدار پیشفرض را تغییر ندهید پلاگین به صورت پیشفرض از شناسه تست استفاده می کند.

> [!TIP]
> توجه داشته باشید در صورت تست پلاگین، در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با `org.godotengine.adivery` باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.
> <p align="center"> <img src="/screenshots/13%20Set%20Package%20Name.PNG" </p>

> [!TIP]
> برای تنظیم موقعیت بنر از نودهای `Control` کمک بگیرید.
- در آخر درصورت فعال بودن آماده سازی خودکار، تبلیغ به صورت خودکار نمایش داده میشود.
- جهت اطلاع از وضعیت تبلیغ کافی است سیگنال های آن را در قسمت اینسپکتور متصل کنید.
<p align="center"> <img src="/screenshots/21%20Connect%20Signals.PNG" </p>

```gdscript
...
func _on_banner_advertisement_clicked() -> void:
	pass # تبلیغ کلیک شد 

func _on_banner_advertisement_closed() -> void:
	pass # تبلیغ بسته شد 

func _on_banner_advertisement_error(reason: String) -> void:
	pass # خطا دریافت شد 

func _on_banner_advertisement_loaded() -> void:
	pass # تبلیغ بارگیری شد 

func _on_banner_advertisement_shown(visibility: bool) -> void:
	pass # تبلیغ آشکار یا پنهان شد 
...
```
> [!NOTE]
> توجه داشته باشید که بنر در همه جا نمایش داده میشود و جهت پنهان سازی آن کافی است مقدار `visibility` را برابر با `false` قرار دهید یا از متد `()close_banner` بنر را بصورت کامل ببندید.
### روش دوم
- اطمینان حاصل کنید که ادیوری را به [روش دوم](#روش-دوم-1) پیکربندی کرده باشید.
```gdscript
extends Adivery

# ساخت تبلیغ بنری 
@onready var banner_advertisement: = BannerAdvertisement.new()

func _ready() -> void:
	# پیکربندی ادیوری 
	app_id = "1d0b8063-4971-4310-a7b1-8330ef89f46d"
	configure()
	# آماده سازی تبلیغ جایزه ای 
	banner_advertisement.placement_id = "66e01251-50ac-4068-a05e-2c675e367611"
	banner_advertisement.prepare_banner_ad()
	banner_advertisement.set_banner_size(BannerAdvertisement.BannerSize.BANNER)
	add_child(banner_advertisement)
	# نمایش بنر 
	banner_advertisement.load_banner_ad()
	# اتصال سیگنال ها جهت بررسی وضعیت تبلیغ 
	banner_advertisement.clicked.connect(_on_banner_advertisement_clicked)
	banner_advertisement.closed.connect(_on_banner_advertisement_closed)
	banner_advertisement.error.connect(_on_banner_advertisement_error)
	banner_advertisement.loaded.connect(_on_banner_advertisement_loaded)

func _on_banner_advertisement_clicked() -> void:
	pass # تبلیغ کلیک شد 

func _on_banner_advertisement_closed() -> void:
	pass # تبلیغ بسته شد 

func _on_banner_advertisement_error(reason: String) -> void:
	pass # خطا دریافت شد 

func _on_banner_advertisement_loaded() -> void:
	pass # تبلیغ بارگیری شد 

func _on_banner_advertisement_shown(visibility: bool) -> void:
	pass # تبلیغ آشکار یا پنهان شد 

```
> [!CAUTION]
> به هیچ عنوان از شناسه تبلیغ یکسان برای چندین بنر استفاده نکنید که دچار ارور خواهید شد.

> [!TIP]
> توجه داشته باشید که در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با نام پکیج تعریف شده در [داشبورد ادیوری](https://panel.adivery.com/) شما باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.

> [!TIP]
> درصورت تست پلاگین، مقدار پیشفرض را تغییر ندهید پلاگین به صورت پیشفرض از شناسه تست استفاده می کند.

> [!TIP]
> توجه داشته باشید در صورت تست پلاگین، در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با `org.godotengine.adivery` باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.
> <p align="center"> <img src="/screenshots/13%20Set%20Package%20Name.PNG" </p>

> [!TIP]
> برای تنظیم موقعیت بنر از نودهای `Control` کمک بگیرید.

> [!NOTE]
> توجه داشته باشید که بنر در همه جا نمایش داده میشود و جهت پنهان سازی آن کافی است مقدار `visibility` را برابر با `false` قرار دهید یا از متد `()close_banner` بنر را بصورت کامل ببندید.
## پیاده سازی تبلیغات همسان
- برای پیاده سازی تبلیغات همسان، اطمینان حاصل کنید که ادیوری را به [روش اول](#روش-اول-پیشنهادی) و یا [روش دوم](#روش-دوم-1) پیکربندی کرده باشید.
- حال نود `NativeAdvertisement` را به سین مورد نظر اضافه کنید.
<p align="center"> <img src="/screenshots/22%20Add%20Native%20To%20Scene.PNG" </p>
	
- در اینسپکتور تنظیمات همسان به این ترتیب می باشد.
<p align="center"> <img src="/screenshots/23%20Update%20Ad%20Info.PNG" </p>
	
- در بخش اول `Request` یا درخواست تبلیغ، با فعال کردن این گزینه تبلیغ به صورت خودکار دریافت شده و بارگیری میشود. درصورت غیرفعال بودن باید از متد `()request_native_ad` استفاده کنید.
- در بخش بعد `Placement ID` یا شناسه تبلیغ را داریم. شناسه تبلیغ را میتوان از [داشبورد ادیوری](https://panel.adivery.com/) دریافت کرده و جایگزین کنید تا درآمد تبلیغ برای شما محاسبه شود.
> [!CAUTION]
> به هیچ عنوان از شناسه تبلیغ یکسان برای چندین بنر استفاده نکنید که دچار ارور خواهید شد.

> [!TIP]
> توجه داشته باشید که در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با نام پکیج تعریف شده در [داشبورد ادیوری](https://panel.adivery.com/) شما باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.

> [!TIP]
> درصورت تست پلاگین، مقدار پیشفرض را تغییر ندهید پلاگین به صورت پیشفرض از شناسه تست استفاده می کند.

> [!TIP]
> توجه داشته باشید در صورت تست پلاگین، در هنگام خروجی اندروید مقدار `package/unique_name` باید برابر با `org.godotengine.adivery` باشد در غیر اینصورت تبلیغی نمایش داده نمی شود.
> <p align="center"> <img src="/screenshots/13%20Set%20Package%20Name.PNG" </p>

- در بخش `Details` یا جزئیات، 6 گزینه جهت فعال سازی وجود دارد که دو مورد از آنها اجباری می باشد.
	- عنوان تبلیغ یا `Has Head Line` که اجباری می باشد و نود `HeadLine` که یک `Label` می باشد را به فرزند نود تبلیغ همسان اضافه میکند.
	- دکمه ی فراخوان تبلیغ یا `Has Call to Action` که اجباری می باشد و نود `CallToAction` که یک دکمه می باشد را به فرزند نود تبلیغ همسان اضافه میکند.
	- نام برند یا `Has Advertiser` که نود `Advertiser` که یک `Label` می باشد را به فرزند نود تبلیغ همسان اضافه میکند.
	- توضیحات تبلیغ یا `Has Description` که نود `Description` که یک `Label` می باشد را به فرزند نود تبلیغ همسان اضافه میکند.
	- آیکون برند یا `Has Icon` که نود `Icon` که یک `TextureRec` می باشد را به فرزند نود تبلیغ همسان اضافه میکند. این عکس در ابعاد کوچک و به شکل مربع خواهد بود. همچنین ممکن است بخش‌هایی از عکس transparent باشد.
	- عکس بزرگ تبلیغ یا `Has Image` که نود `Image` که یک `TextureRec` می باشد را به فرزند نود تبلیغ همسان اضافه میکند. نسبت ابعاد 16:9 و جهت افقی.
> [!NOTE]
> تمامی نودهای اضافه شده را با توجه به ظاهر بازی خود میتوانید ویرایش کنید.
- در آخر درصورت فعال بودن آماده سازی خودکار، تبلیغ به صورت خودکار نمایش داده میشود.
- جهت اطلاع از وضعیت تبلیغ کافی است سیگنال های آن را در قسمت اینسپکتور متصل کنید.
<p align="center"> <img src="/screenshots/24%20Connect%20Signals.PNG" </p>
	
```gdscript
...
func _on_native_ad_clicked() -> void:
	pass # تبلیغ کلیک شد 

func _on_native_ad_load_failed() -> void:
	pass # بارگیری تبلیغ با مشکل مواجه شد 

func _on_native_ad_loaded() -> void:
	pass # تبلیغ بارگیری شد 

func _on_native_ad_shown() -> void:
	pass # تبلیغ نمایش داده شد 

func _on_native_ad_shown_failed() -> void:
	pass # نمایش تبلیغ با مشکل مواجه شد 
...
```
