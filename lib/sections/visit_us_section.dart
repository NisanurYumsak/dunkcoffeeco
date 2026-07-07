import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class VisitUsSection extends StatelessWidget {
  const VisitUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightBg,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          const Text(
            'BİZİ ZİYARET EDİN',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryRed,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Haftanın her günü taze kahve kokusuyla buradayız.',
            style: TextStyle(color: AppColors.textDark.withOpacity(0.7)),
          ),
        ],
      ),
    );
  }
}