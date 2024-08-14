<p align="center"> <img src="https://www.adivery.com/wp-content/uploads/2021/06/logo3.svg" </p>
<h1 align="center"> گودو ادیوری </h1>
<p align="center">  پلاگین ادیوری برای موتور بازی سازی گودو </p>
 
## دریافت ادیوری
ادیوری را میتوانید از [Asset Library](https://godotengine.org/asset-library/asset/3094) و یا [Release](https://github.com/DexterFstone/godot-adivery/releases) دریافت کنید.

## نصب ادیوری
### روش اول (دریافت از Release)
- پس از دریافت ادیوری از [Release](https://github.com/DexterFstone/godot-adivery/releases) فایل زیپ را استخراج کنید.
- فایل استخراج شده را در محل پروژه خود کپی کنید.
- از منوی Project وارد قسمت Project Settings و وارد تب Plugins شوید.
- در مرحله آخر تیک فعال سازی ادیوری را بزنید.
<p align="center"> <img src="/screenshots/01%20Enabling%20Plugin.PNG" </p>
  
### روش دوم (دریافت از Asset Library)
- پس از دریافت ادیوری از [Asset Library](https://godotengine.org/asset-library/asset/3094) فایل زیپ را استخراج کنید.
- فایل استخراج شده را در محل پروژه خود کپی کنید.
- از منوی Project وارد قسمت Project Settings و وارد تب Plugins شوید.
- در مرحله آخر تیک فعال سازی ادیوری را بزنید.
<p align="center"> <img src="/screenshots/01%20Enabling%20Plugin.PNG" </p>

### روش سوم (پیشنهادی)
- در داخل گودو به تب AssetLib بروید.
- در بخش جستوجو به دنبال Adivery بگردید و روی آن کلیک کنید.
- در پنجره باز شده روی Download کلیک کنید.

<p align="center"> <img src="/screenshots/02%20Download%20Adivery.PNG" </p>
  
- بعد زا دانلود شدن روی Install کلیک کنید.
- از منوی Project وارد قسمت Project Settings و وارد تب Plugins شوید.
- در مرحله آخر تیک فعال سازی ادیوری را بزنید.
<p align="center"> <img src="/screenshots/01%20Enabling%20Plugin.PNG" </p>

## نحوه استفاده
### روش اول (پیشنهادی)
- یک سین جدید ساخته و نود ادیوری به آن اضافه کنید.
<p align="center"> <img src="/screenshots/03%20Add%20Adivery%20To%20Scene.PNG" </p>

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
