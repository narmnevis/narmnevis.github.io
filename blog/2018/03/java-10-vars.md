---
lang: 'fa'
dir: 'rtl'
title: 'جاوا ۱۰ --- استنتاج نوع متغیر‌های محلی 
(Local-Variable Type Inference)
'
...

<!--
جاوا ۱۰ - استنتاج نوع متغیر‌های محلی 
(Local-Variable Type Inference)
-->

در جاوا برای تعریف یک متغیر، لازم است تا نوع متغیر در تعریف مشخص باشد:

```java
List<String> list = new ArrayList<>();
Stream<String> stream = list.stream();
```

در جاوا ۱۰، یک متغیر می‌تواند به صورتی تعریف شود که نوع آن به شکل خودکار توسط کامپایلر جاوا استنتاج 
(Infer)
گردد. این کار با به کار گرفتن 
`var`
ممکن است:

```java
var list = new ArrayList<String>();     // list: Class<List<String>>
var stream = list.stream();             // stream: Class<Stream<String>>
```

چند نکته در مورد 
`var`
:

* کلمه کلیدی جاوا نیست.
* در صورت عدم استفاده از انتساب (Assignment) باعث خاطای کامپایل می‌شود. 
* نمی‌تواند `null` باشد.
