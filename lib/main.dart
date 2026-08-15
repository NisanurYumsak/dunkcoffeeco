import 'package:flutter/material.dart';

import 'package:dunkcoffeeco/constants/colors.dart';
import 'package:dunkcoffeeco/sections/hero_section.dart';
import 'package:dunkcoffeeco/sections/why_dunk_section.dart';
import 'package:dunkcoffeeco/sections/precision_demanding_section.dart';
import 'package:dunkcoffeeco/sections/social_gallery_section.dart';
import 'package:dunkcoffeeco/sections/footer_section.dart';
import 'package:dunkcoffeeco/sections/full_menu_page.dart';
import 'package:dunkcoffeeco/sections/cold_dessert_section.dart';
import 'package:dunkcoffeeco/sections/contact_page.dart';

void main() {
  runApp(const DunkCoffeeApp());
}

class DunkCoffeeApp extends StatefulWidget {
  const DunkCoffeeApp({super.key});

  @override
  State<DunkCoffeeApp> createState() => _DunkCoffeeAppState();
}

class _DunkCoffeeAppState extends State<DunkCoffeeApp> {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dunk Coffee Roasters",
      themeMode: themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBg,
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.lightBg,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff121212),
        cardColor: AppColors.darkCard,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff121212),
          elevation: 0,
        ),
      ),
      home: DunkMainPage(
        changeTheme: changeTheme,
        themeMode: themeMode,
      ),
    );
  }
}

class DunkMainPage extends StatefulWidget {
  final VoidCallback changeTheme;
  final ThemeMode themeMode;
  // Bu sayfa Navigator.push ile açıldığında hangi sekmeyle
  // başlayacağını belirler (0: Ana Sayfa, 1: Menü, 2: Galeri, 3: Bize Ulaşın).
  final int initialIndex;

  const DunkMainPage({
    super.key,
    required this.changeTheme,
    required this.themeMode,
    this.initialIndex = 0,
  });

  @override
  State<DunkMainPage> createState() => _DunkMainPageState();
}

class _DunkMainPageState extends State<DunkMainPage> {
  late int activePageIndex = widget.initialIndex;

  final ScrollController _scrollController = ScrollController();
  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey menuKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  // ============================================================
  // Gezinme yardımcıları — gerçek Navigator push/pop kullanır,
  // böylece hem telefonda hem webde geri tuşu/tarayıcı geri
  // butonu doğru şekilde bir önceki sekmeye döner.
  // ============================================================

  // Ana Sayfa'ya dönmek: yeni bir sayfa açmak yerine, geçmişte
  // zaten var olan ilk (kök) sayfaya geri dön. Böylece "Ana
  // Sayfa" geçmişte tekrar tekrar birikmez.
  void _goHome() {
    if (activePageIndex == 0) return;
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  // Menü / Galeri / Bize Ulaşın gibi diğer sekmelere geçmek:
  // yeni bir sayfa (route) push et, böylece geri tuşu/tarayıcı
  // geri butonu bir önceki sekmeye dönebilir.
  void _openPage(int index) {
    if (index == 0) {
      _goHome();
      return;
    }
    if (index == activePageIndex) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DunkMainPage(
          changeTheme: widget.changeTheme,
          themeMode: widget.themeMode,
          initialIndex: index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, outerConstraints) {
      final isMobile = outerConstraints.maxWidth < 700;

      return Scaffold(
        drawer: isMobile
            ? Drawer(
                child: SafeArea(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "DUNK COFFEE",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryRed,
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text("Ana Sayfa"),
                        onTap: () {
                          Navigator.pop(context);
                          _openPage(0);
                        },
                      ),
                      ListTile(
                        title: const Text("Menü"),
                        onTap: () {
                          Navigator.pop(context);
                          _openPage(1);
                        },
                      ),
                      ListTile(
                        title: const Text("Galeri"),
                        onTap: () {
                          Navigator.pop(context);
                          _openPage(2);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          widget.themeMode == ThemeMode.light
                              ? Icons.dark_mode
                              : Icons.light_mode,
                          color: AppColors.primaryRed,
                        ),
                        title: const Text("Karanlık Mod"),
                        onTap: () {
                          widget.changeTheme();
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text(
                          "BİZE ULAŞIN",
                          style: TextStyle(
                            color: AppColors.primaryRed,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          _openPage(3);
                        },
                      ),
                    ],
                  ),
                ),
              )
            : null,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 80,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => _openPage(0),
                  child: const Text(
                    "DUNK COFFEE",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryRed,
                    ),
                  ),
                ),
                if (isMobile)
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: AppColors.primaryRed),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  )
                else
                  Row(
                    children: [
                      _buildNavButton(
                        title: "Ana Sayfa",
                        index: 0,
                      ),
                      _buildNavButton(
                        title: "Menü",
                        index: 1,
                      ),
                      _buildNavButton(
                        title: "Galeri",
                        index: 2,
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: widget.changeTheme,
                        icon: Icon(
                          widget.themeMode == ThemeMode.light
                              ? Icons.dark_mode
                              : Icons.light_mode,
                          color: AppColors.primaryRed,
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () => _openPage(3),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryRed,
                        ),
                        child: const Text(
                          "BİZE ULAŞIN",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        body: activePageIndex == 0
            ? SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Container(
                      key: heroKey,
                      child: HeroSection(
                        onMenuPressed: () => _openPage(1),
                      ),
                    ),
                    Container(
                      key: aboutKey,
                      child: WhyDunkSection(),
                    ),
                    Container(
                      key: menuKey,
                      child: ColdDessertSection(),
                    ),
                    PrecisionDemandingSection(),
                    Container(
                      key: contactKey,
                      child: FooterSection(
                        onGalleryPressed: () => _openPage(2),
                        onHomePressed: () {
                          // Zaten Ana Sayfa'dayız (footer sadece
                          // Ana Sayfa'da gösteriliyor), bu yüzden
                          // sayfa değiştirmeye gerek yok — sadece
                          // hero bölümüne kaydır.
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            scrollTo(heroKey);
                          });
                        },
                        onMenuPressed: () => _openPage(1),
                        onAboutPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            scrollTo(aboutKey);
                          });
                        },
                        onContactPressed: () => _openPage(3),
                      ),
                    ),
                  ],
                ),
              )
            : activePageIndex == 1
                ? SingleChildScrollView(
                    controller: _scrollController,
                    child: const FullMenuPage(),
                  )
                : activePageIndex == 2
                    ? const SingleChildScrollView(
                        child: SocialGallerySection(),
                      )
                    : const SingleChildScrollView(
                        child: ContactPage(),
                      ),
        floatingActionButton: activePageIndex == 1
            ? FloatingActionButton(
                backgroundColor: AppColors.primaryRed,
                onPressed: () {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Icon(Icons.arrow_upward, color: Colors.white),
              )
            : null,
      );
    });
  }

  Widget _buildNavButton({
    required String title,
    required int index,
  }) {
    bool selected = activePageIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: InkWell(
        onTap: () => _openPage(index),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: selected ? FontWeight.bold : FontWeight.w500,
            color: selected
                ? AppColors.primaryRed
                : Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ),
    );
  }
}
