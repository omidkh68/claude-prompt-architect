# Angular Cafe — Telegram Post

## نسخه اصلی

یه ابزار کوچیک ولی خیلی کاربردی که خودم مدتیه برای کار با **Claude / Claude Code** ازش استفاده می‌کنم رو open-source کردم:

**Claude Prompt Architect**

مشکلی که می‌خواستم حل کنم این بود که خیلی وقت‌ها requirement تو ذهنمون کاملاً مشخصه، ولی وقتی همونو مستقیم به Claude می‌دیم، prompt هنوز کلی ابهام داره:

- دقیقاً کدوم بخش repo باید inspect بشه؟
- behavior فعلی و expected behavior چیه؟
- چی باید reuse بشه؟
- scope تغییرات کجاست؟
- Claude باید root cause رو پیدا کنه یا فقط یه workaround بزنه؟
- بعد از تغییر دقیقاً چی باید verify بشه؟

این plugin requirementهای فارسی یا انگلیسی رو می‌گیره و تبدیلشون می‌کنه به یه **implementation-ready prompt** برای Claude Code.

ساختارش بر پایه‌ی مدلیه که اسمش رو گذاشتم:

**GCAO**

`Goal → Contexts → Actions → Outputs`

ولی پشت همین ۴ بخش، مواردی مثل repository preflight، root-cause analysis، scope guard، reuse existing implementation، verification و Definition of Done هم حفظ می‌شن.

چند سناریویی که ساپورت می‌کنه:

- Feature Implementation
- Bug Fix
- Existing Implementation Alignment
- Correction Prompt
- ادامه کار از روی Claude Engineering Report
- Angular / Android / API / Visualization / Security / Performance و ...

یکی از مهم‌ترین اصولش هم اینه که تا چیزی داخل requirement یا repo مشخص نشده، مسیر فایل، service، API contract یا architecture از خودش نسازه و Claude رو مجبور کنه اول implementation واقعی رو inspect کنه.

Repo و کل ساختار skill + referenceها + exampleها اینجاست:

**https://github.com/omidkh68/claude-prompt-architect**

اگه زیاد با Claude Code روی پروژه‌های واقعی کار می‌کنید، احتمالاً این workflow براتون کاربردیه.

---

## نسخه کوتاه

**Claude Prompt Architect** رو open-source کردم.

یه plugin/skill برای ChatGPT که requirementهای فارسی یا انگلیسی رو تبدیل می‌کنه به promptهای implementation-ready برای **Claude / Claude Code**.

ساختارش بر پایه‌ی:

`Goal → Contexts → Actions → Outputs`

و داخل prompt چیزهایی مثل:

- repository inspection
- root-cause analysis
- scope control
- reuse existing implementation
- verification
- engineering report

رو هم enforce می‌کنه.

برای Feature، Bug Fix، Correction Prompt و ادامه کار از روی Claude report هم workflow جدا داره.

Repo:

**https://github.com/omidkh68/claude-prompt-architect**
