import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class WhyDunkSection extends StatelessWidget {
  const WhyDunkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 80,
        vertical: 90,
      ),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            "Neden Dunk Coffee?",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "Kaliteli çekirdekler, özenli hazırlık ve sıcak bir kahve deneyimi için buradayız.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCard(
                icon: Icons.coffee,
                title: "Özel Çekirdekler",
                text: "Dünyanın farklı bölgelerinden seçilen kaliteli kahve çekirdekleri.",
              ),

              const SizedBox(width: 30),

              _buildCard(
                icon: Icons.local_fire_department,
                title: "Taze Kavrum",
                text: "Her fincanda taze ve dengeli bir kahve aroması.",
              ),

              const SizedBox(width: 30),

              _buildCard(
                icon: Icons.favorite,
                title: "Özenli Hizmet",
                text: "Kahveyi sadece içecek değil, deneyim olarak görüyoruz.",
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildCard({
    required IconData icon,
    required String title,
    required String text,
  }) {
    return Container(
      width: 280,
      height: 250,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.lightBg,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: AppColors.primaryRed,
          ),

          const SizedBox(height: 25),

          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}