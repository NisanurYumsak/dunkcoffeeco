import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class DunkNavbar extends StatelessWidget implements PreferredSizeWidget {
  const DunkNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightBg,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          // 1. SOL TARAF: LOGO
          const Text(
            'DUNK COFFEE',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryRed,
              letterSpacing: 1.5,
            ),
          ),
          
          // 2. ORTA TARAF: MENÜ LİNKLERİ (Yan yana dizildi)
          Row(
            children: [
              _buildNavLink(title: 'Menü', isActive: true),
              _buildNavLink(title: 'Şubeler'),
              _buildNavLink(title: 'Atmosfer'),
              _buildNavLink(title: 'Zanaatımız'),
            ],
          ),
          
          // 3. SAĞ TARAF: AKSİYON BUTONU
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.primaryRed,
              borderRadius: BorderRadius.circular(4), 
            ),
            child: const Text(
              'Karanlık Mod',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildNavLink({required String title, bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          color: isActive ? AppColors.primaryRed : AppColors.textDark,
        ),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(80);
}