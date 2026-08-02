import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';
import 'package:dunkcoffeeco/sections/hero_section.dart';
import 'package:dunkcoffeeco/sections/menu_selection_section.dart';
import 'package:dunkcoffeeco/sections/modern_rituals_section.dart';
import 'package:dunkcoffeeco/sections/precision_demanding_section.dart';
import 'package:dunkcoffeeco/sections/visit_us_section.dart'; 
import 'package:dunkcoffeeco/sections/social_gallery_section.dart';
import 'package:dunkcoffeeco/sections/footer_section.dart'; 
import 'package:dunkcoffeeco/sections/why_dunk_section.dart';
import 'package:dunkcoffeeco/sections/full_menu_page.dart';
import 'package:dunkcoffeeco/widgets/marquee_section.dart';

void main() {
  runApp(const DunkCoffeeApp());
}

class DunkCoffeeApp extends StatelessWidget {
  const DunkCoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dunk Coffee Roasters',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.lightBg,
      ),
      home: const DunkMainPage(),
    );
  }
}

class DunkMainPage extends StatefulWidget {
  const DunkMainPage({super.key});

  @override
  State<DunkMainPage> createState() => _DunkMainPageState();
}

class _DunkMainPageState extends State<DunkMainPage> {
  int activePageIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          color: AppColors.lightBg,
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => setState(() => activePageIndex = 0),
                child: const Text(
                  'DUNK COFFEE',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primaryRed, letterSpacing: 1.5),
                ),
              ),
              Row(
                children: [
                  _buildNavButton(title: 'Ana Sayfa', index: 0),
                  _buildNavButton(title: 'Menü', index: 1),
                ],
              ),
              ElevatedButton(
                onPressed: () => setState(() => activePageIndex = 1),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryRed, elevation: 0),
                child: const Text('ŞİMDİ SİPARİŞ VER', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            ],
          ),
        ),
      ),
     body: SingleChildScrollView(
  child: activePageIndex == 0
      ? Column(
        children: const [
  HeroSection(),
  MenuSelectionSection(),
  ModernRitualsSection(),
  PrecisionDemandingSection(),
  VisitUsSection(),
  SocialGallerySection(),
  FooterSection(),
],  
        )
      : const FullMenuPage(),
),
    );
  }

  Widget _buildNavButton({required String title, required int index}) {
    bool isSelected = activePageIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () => setState(() => activePageIndex = index),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? AppColors.primaryRed : AppColors.textDark,
          ),
        ),
      ),
    );
  }
}