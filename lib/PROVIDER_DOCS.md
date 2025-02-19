# Flutterda Provider bilan State Boshqaruvi

## ChangeNotifier

ChangeNotifier bu Flutter'ning state boshqarish uchun ishlatiladigan maxsus sinfi. Bu sinf orqali
biror state (holat) o'zgarganda, kuzatayotgan barcha widgetlarga xabar beriladi.

### Muhim metod:

- `notifyListeners()` - bu metod chaqirilganda, ChangeNotifier'ga ulangan barcha widgetlar qayta
  chiziladi (rebuild bo'ladi).

### Foydalanish misoli (Counter):

```dart
class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
```

## Provider.of vs. context.watch vs. context.read

### Provider.of

- `Provider.of<CounterProvider>(context)` - bu provider'dan qiymat oladi.
- Agar `listen: true` bo'lsa, state o'zgarganda widget qayta chiziladi.
- Agar `listen: false` bo'lsa, state o'zgarsa ham widget qayta chizilmaydi.

### context.watch

- `context.watch<CounterProvider>()` - bu ham state o'zgarganda widget qayta chizilishini ta'
  minlaydi.

### context.read

- `context.read<CounterProvider>()` - bu state o'qish uchun ishlatiladi, lekin o'zgarganda widget
  qayta chizilmaydi.

## MultiProvider

Bu bir nechta provider'larni bir joyda birlashtirib ishlatish uchun ishlatiladi.

### Foydalanish misoli:

```flutter
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => CounterProvider()),
    ChangeNotifierProvider(create: (_) => ProductProvider()),
  ],
  child: MyApp(),
)
```

## ProxyProvider

Bir provider ikkinchi provider'ga bog'liq bo'lsa, ProxyProvider ishlatiladi.

### Misol:

```flutter
ProxyProvider<ApiService, ProductRepository>(
  update: (_, apiService, previous) => ProductRepository(apiService),
)
```

## Selector

Bu provider'dagi faqat muayyan maydonni kuzatib, boshqa maydonlar o'zgarsa widget qayta
chizilmasligi uchun ishlatiladi.

### Misol:

```flutter
Selector<CounterProvider, int>(
  selector: (_, provider) => provider.count,
  builder: (_, count, __) {
    return Text('$count');
  },
)
```

## ValueNotifier
Kichik state uchun, masalan, bitta son, string yoki boolean uchun ChangeNotifier ishlatib yurish 
ortiqcha bo‘ladi. ValueNotifier esa bitta qiymatga o‘ralgan notifier.
Qiymat o‘zgarsa – u ham listenerlarga xabar beradi.
```flutter
final ValueNotifier<int> counter = ValueNotifier<int>(0);

// Qiymatni o'zgartirish
counter.value++;

// Qiymatni olish
print(counter.value);

```

```flutter
ValueListenableBuilder<int>(
  valueListenable: counter,
  builder: (context, value, child) {
    return Text(
      '$value',
      style: const TextStyle(fontSize: 24),
    );
  },
);

```

### Misol:

```flutter
ValueNotifier<int> counter = ValueNotifier<int>(0);

ValueListenableBuilder<int>(
  valueListenable: counter,
  builder: (context, value, child) {
    return Text('$value');
  },
)
```

## Scoped Providers

Ba'zan faqat bitta widget daraxtining ichida state kerak bo'ladi. Shunda Scoped Providers
ishlatiladi.

### Misol:

```flutter
Provider(
  create: (_) => CounterProvider(),
  child: CounterScreen(),
)
```

## Misollar

### ChangeNotifier yordamida oddiy counter misoli

```dart
class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
```

### MultiProvider orqali bir nechta provider ishlatish

```flutter
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => CounterProvider()),
    ChangeNotifierProvider(create: (_) => ProductProvider()),
  ],
  child: MyApp(),
)
```

### ProxyProvider orqali providerlar o'rtasida bog'liqlik

```flutter
ProxyProvider<ApiService, ProductRepository>(
  update: (_, apiService, previous) => ProductRepository(apiService),
)
```

### Selector yordamida keraksiz widget rebuild'larni oldini olish

```flutter
Selector<CounterProvider, int>(
  selector: (_, provider) => provider.count,
  builder: (_, count, __) {
    return Text('$count');
  },
)
```

### Scoped Provider orqali faqat ma'lum widget bo'lagi uchun state berish

```flutter
Provider(
  create: (_) => CounterProvider(),
  child: CounterScreen(),
)
```