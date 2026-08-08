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

  const DunkMainPage({
    super.key,
    required this.changeTheme,
    required this.themeMode,
  });

  @override
  State<DunkMainPage> createState() => _DunkMainPageState();
}

class _DunkMainPageState extends State<DunkMainPage> {
  int activePageIndex = 0;

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
                        setState(() => activePageIndex = 0);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text("Menü"),
                      onTap: () {
                        setState(() => activePageIndex = 1);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text("Galeri"),
                      onTap: () {
                        setState(() => activePageIndex = 2);
                        Navigator.pop(context);
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
                        setState(() => activePageIndex = 3);
                        Navigator.pop(context);
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
                onTap: () {
                  setState(() {
                    activePageIndex = 0;
                  });
                },
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
                      onPressed: () {
                        setState(() {
                          activePageIndex = 3;
                        });
                      },
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
    onMenuPressed: () {
      setState(() {
        activePageIndex = 1;
      });
    },
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
    onGalleryPressed: () {
      setState(() {
        activePageIndex = 2;
      });
    },

    onHomePressed: () {
      setState(() {
        activePageIndex = 0;
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollTo(heroKey);
      });
    },

   onMenuPressed: () {
  setState(() {
    activePageIndex = 1;
  });
},

    onAboutPressed: () {
      setState(() {
        activePageIndex = 0;
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollTo(aboutKey);
      });
    },

   onContactPressed: () {
  setState(() {
    activePageIndex = 3;
  });
},
  ),
),
                ],
              ),
            )
          : activePageIndex == 1
              ? SingleChildScrollView(
                  child: const FullMenuPage(),
                )
              : activePageIndex == 2
                  ? const SingleChildScrollView(
                      child: SocialGallerySection(),
                    )
                  : const SingleChildScrollView(
                      child: ContactPage(),
                    ),
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
        onTap: () {
          setState(() {
            activePageIndex = index;
          });
        },
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