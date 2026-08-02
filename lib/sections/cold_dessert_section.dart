import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class ColdDessertSection extends StatelessWidget {
  const ColdDessertSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 80,
        vertical: 90,
      ),
      color: AppColors.lightBg,
      child: Column(
        children: [
          const Text(
            "Sadece Kahve Değil, Daha Fazlası",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "Dunk Coffee deneyimini soğuk içeceklerimiz ve özenle hazırlanan tatlılarımızla tamamlıyoruz.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildExperienceCard(
                image: "assets/images/sogukicecek.png",
                title: "Serinleten Lezzetler",
                description:
                    "Sıcak günlerde ferahlatan soğuk içeceklerimizle kahve keyfini farklı bir deneyime dönüştürüyoruz.",
                icon: Icons.local_drink,
              ),

              const SizedBox(width: 40),

              _buildExperienceCard(
                image: "assets/images/tatli.png",
                title: "Tatlı Molaları",
                description:
                    "Kahvenize eşlik eden taze tatlılarımızla her anınıza küçük ve özel bir mutluluk katıyoruz.",
                icon: Icons.cake,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard({
    required String image,
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Container(
      width: 500,
      height: 700,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: double.infinity,
              height: 420,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 25),

          Icon(
            icon,
            size: 36,
            color: AppColors.primaryRed,
          ),

          const SizedBox(height: 15),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}