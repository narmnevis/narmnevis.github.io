---
lang: 'fa'
dir: 'rtl'
title: 'جاوا ۹ - الحاق رشته‌ها'
keywords: [java, java9, string, concatenation, جاوا]
...

<!--
جاوا ۹ - الحاق رشته‌ها
(String Concatenation)

https://bugs.openjdk.java.net/browse/JDK-8200118
-->

مراقب باگ جاوا ۹ در الحاق رشته‌ها باشید.

تکه کد زیر را در نظر بگیرید:

```java
public class ConcatString {
  private final List<String> versions = 
    Arrays.asList("1.3", "1.4", "1.5", 
                  "1.6", "1.7", "8", 
                  "9", "10", "11");
  private int index = 0;

  @Override
  public String toString() {
    String s = versions.get(index);
    index = (index + 1) % versions.size();
    return s;
  }
}
```

کد بالا یک مثال از نحوه پیاده کردن متد `toString‍` در جاواست که خیلی مواقع برای تبدیل یک شی به یک رشته استفاده می‌شود.

یک پیش‌فرض خیلی قدیمی در جاوا این هست که این متد *بهتر* است که بی‌اثر (Idempotent) باشد؛ به این معنی که بهتر است اجرای این متد تغییری در شی ایجاد نکند. با این که خیلی از مواقع این اصل نانوشته رعایت می‌شود، اما مرجع نیست و به عنوان مثال در بالا این موضوع رعایت نشده است.

اما چه مشکلی پیش می‌آید؟ کد زیر را در نظر بگیرید:

```java
ConcatString cs = new ConcatString();
System.out.println("Which version?");
System.out.println(cs + " or " + cs + " or " + cs);
```

تکه کد بالا در جاوا ۸ و جاوا ۹ *ترتیب متفاوتی* از اجرای `toString` ایجاد می‌کند. 

در جاوا ۸:

```bash
Which Java version do you like more?
1.3 or 1.4 or 1.5
```

و در جاوا ۹:

```bash
Which Java version do you like more?
1.5 or 1.4 or 1.3
```

کد کامل در [ConcatString.java][1] هست. یادتان باشد با هر نسخه جاوا اول کامپایل کنید و بعد اجرا.

این باگ در جاوا ۱۱ (و شاید جاوا ۱۰) برطرف می‌شود.

[1]: ./ConcatString.java

