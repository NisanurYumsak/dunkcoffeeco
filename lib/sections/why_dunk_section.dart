import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class WhyDunkSection extends StatelessWidget {
  const WhyDunkSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
            vertical: isMobile ? 50 : 90,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Text(
                "Neden Dunk Coffee?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 28 : 42,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.textDark,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                "Kaliteli çekirdekler, özenli hazırlık ve sıcak bir kahve deneyimi için buradayız.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isDark ? Colors.white70 : Colors.grey,
                  fontSize: 15,
                  height: 1.6,
                ),
              ),

              SizedBox(height: isMobile ? 30 : 60),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 30,
                runSpacing: 30,
                children: [
                  _buildCard(
                    context: context,
                    image: "assets/images/cekirdek.png",
                    icon: Icons.coffee,
                    title: "Özel Çekirdekler",
                    text:
                        "Dünyanın farklı bölgelerinden seçilen kaliteli kahve çekirdekleri.",
                  ),
                  _buildCard(
                    context: context,
                    image: "assets/images/tazekavrum.png",
                    icon: Icons.local_fire_department,
                    title: "Taze Kavrum",
                    text: "Her fincanda taze ve dengeli bir kahve aroması.",
                  ),
                  _buildCard(
                    context: context,
                    image: "assets/images/ozenliservis.png",
                    icon: Icons.favorite,
                    title: "Özenli Servis",
                    text:
                        "Kahveyi sadece içecek değil, deneyim olarak görüyoruz.",
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required String image,
    required IconData icon,
    required String title,
    required String text,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 280,
      height: 310,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.lightBg,
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
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textDark,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: isDark ? Colors.white70 : Colors.grey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}