# Provider Advanced Concepts Example Project

Bu loyiha Flutter dasturlash muhitida Provider state management package'dan foydalanib, advanced tushunchalarni o'rganish uchun yaratilgan kichik test ilova hisoblanadi.

## Project Overview
Loyihaning asosiy maqsadi quyidagi advanced Provider tushunchalarini o'z ichiga olgan holda amaliyot qilish:

- **ChangeNotifier** – State boshqaruvi va `notifyListeners()` ishlatish.
- **Provider.of vs. context.watch vs. context.read** – Farqlari va qachon qaysi biri ishlatilishi.
- **MultiProvider** – Bir nechta provider'larni birlashtirish.
- **ProxyProvider** – Boshqa provider'ga bog'liq provider yaratish.
- **Selector** – Widget rebuild jarayonlarini optimallashtirish.
- **ValueNotifier** – Engil state boshqaruvi uchun ishlatiladi.
- **Scoped Providers** – Muayyan widget daraxtiga state berish.

## Features
- ChangeNotifier yordamida oddiy counter misoli.
- MultiProvider orqali bir nechta provider'lar ishlatish.
- ProxyProvider orqali provider'lar o'rtasida bog'liqlik.
- Selector yordamida keraksiz widget rebuild'larni oldini olish.
- Scoped Provider orqali faqat ma'lum widget bo'lagi uchun state berish.

## Folder Structure
