---
lang: 'fa'
dir: 'rtl'
title: 'نگاهی دوباره به آینده جاوا و اسکالا'
keywords: [جاوا,java,jvm,scala,اسکالا]
---

<!--
نگاهی دوباره به آینده جاوا و اسکالا
-->

از انتشار جاوا ۹ به بعد، زبان جاوا بر اساس [زمان‌بندی جدید][1] [منتشر][3] می‌شود.
به طور خلاصه، تقریبا هر شش ماه یک بار می‌توان انتظار نسخه‌ی جدیدی از جاوا داشت.
با این سرعت، ویژگی‌هایی که در زبان تغییر می‌کنند یا به آن اضافه می‌شوند، مورد توجه بیشتری قرار می‌گیرند.
یکی از مهم‌ترین سؤال‌هایی که در مقابل زبان جاوا در مقایسه با زبان‌های مدرن‌تر مانند اسکالا مطرح بوده، توانایی در  برابری و معادل‌سازی ویژگی‌های زبانی بوده‌ است.
برخی از این ویژگی‌ها از ابتدا با اسکالا بوده‌اند که محوری برای استدلال برای ترک یا قدیمی‌شدن زبانی مثل جاوا بوده‌اند.
در جدول زیر خلاصه‌ای از ویژگی‌های مدرن و کلیدی زبان جاوا و [اسکالا][2] در نسخه‌های مختلف کنار هم قرار گرفته‌اند:


+-----------------------------------------------+----------------+------------------+
| Feature                                       | Java           | Scala          |
+===============================================+================+==================+
| Case Classes                                  | [JEP-305][9]   | 2.0 — Mar 2006   |
+-----------------------------------------------+----------------+------------------+
| Pattern Matching                              | [12][4]        | 2.0 — Mar 2006   |
+-----------------------------------------------+----------------+------------------+
| Multi-line Strings                            | [JEP-326][5]   | 2.1.7 — Jul 2006 |
+-----------------------------------------------+----------------+------------------+
| Pattern Matching - Deconstructors / Extractors| [JEP-305][9]   | 2.3.2 — Jan 2007 |
+-----------------------------------------------+----------------+------------------+
| Tuples                                        | [JPE-169][6]   | 2.3.2 — Jan 2007 |
+-----------------------------------------------+----------------+------------------+
| For Comprehensions                            | ?              | 2.5 — May 2007   |
+-----------------------------------------------+----------------+------------------+
| Continuations                                 | [Loom][7]      | 2.8 — Jul 2010   |
+-----------------------------------------------+----------------+------------------+
| Concurrent Collections                        | [1.5][8]       | 2.9 — May 2011   |
+-----------------------------------------------+----------------+------------------+
| Pattern Matching Rewrite                      | n.a.           | 2.10 — ?         | 
+-----------------------------------------------+----------------+------------------+

با توجه به این [اسکالا ۳][10] حدود سال ۲۰۲۰ قرار است منتشر شود و با سرعتی که جاوا در پیش گرفته‌است به نظر شما کدام زبان در آینده موفقیت
بیشتری در ارائه ویژگی‌های مدرن زبان‌های برنامه‌نویسی خواهد داشت؟

[1]: http://mail.openjdk.java.net/pipermail/discuss/2017-September/004281.html
[2]: https://www.scala-lang.org/download/changelog.html
[3]: http://openjdk.java.net/jeps/322
[4]: http://openjdk.java.net/jeps/325
[5]: http://openjdk.java.net/jeps/326
[6]: http://openjdk.java.net/jeps/169
[7]: http://openjdk.java.net/projects/loom/
[8]: https://en.wikipedia.org/wiki/Java_version_history#J2SE_5.0
[9]: http://openjdk.java.net/jeps/305
[10]: https://www.scala-lang.org/blog/2018/04/19/scala-3.html
