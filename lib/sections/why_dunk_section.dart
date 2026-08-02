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
                image: "assets/images/cekirdek.png",
                icon: Icons.coffee,
                title: "Özel Çekirdekler",
                text: "Dünyanın farklı bölgelerinden seçilen kaliteli kahve çekirdekleri.",
              ),

              const SizedBox(width: 30),

              _buildCard(
                image: "assets/images/tazekavrum.png",
                icon: Icons.local_fire_department,
                title: "Taze Kavrum",
                text: "Her fincanda taze ve dengeli bir kahve aroması.",
              ),

              const SizedBox(width: 30),

              _buildCard(
                image: "assets/images/ozenliservis.png",
                icon: Icons.favorite,
                title: "Özenli Servis",
                text: "Kahveyi sadece içecek değil, deneyim olarak görüyoruz.",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String image,
    required IconData icon,
    required String title,
    required String text,
  }) {
    return Container(
      width: 280,
      height: 310,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.lightBg,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              image,
              height: 105,
              width: 105,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 15),

          Icon(
            icon,
            size: 32,
            color: AppColors.primaryRed,
          ),

          const SizedBox(height: 15),

          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 12),

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