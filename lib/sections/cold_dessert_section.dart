import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class ColdDessertSection extends StatelessWidget {
  const ColdDessertSection({super.key});

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
                "Sadece Kahve Değil, Daha Fazlası",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 28 : 42,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.textDark,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                "Dunk Coffee deneyimini soğuk içeceklerimiz ve özenle hazırlanan tatlılarımızla tamamlıyoruz.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: isDark ? Colors.white70 : Colors.grey,
                  height: 1.6,
                ),
              ),

              SizedBox(height: isMobile ? 30 : 60),

              isMobile
                  ? Column(
                      children: [
                        _buildExperienceCard(
                          context: context,
                          image: "assets/images/sogukicecek.png",
                          title: "Serinleten Lezzetler",
                          description:
                              "Sıcak günlerde ferahlatan soğuk içeceklerimizle kahve keyfini farklı bir deneyime dönüştürüyoruz.",
                          icon: Icons.local_drink,
                          isMobile: true,
                        ),
                        const SizedBox(height: 30),
                        _buildExperienceCard(
                          context: context,
                          image: "assets/images/tatli.png",
                          title: "Tatlı Molaları",
                          description:
                              "Kahvenize eşlik eden taze tatlılarımızla her anınıza küçük ve özel bir mutluluk katıyoruz.",
                          icon: Icons.cake,
                          isMobile: true,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildExperienceCard(
                          context: context,
                          image: "assets/images/sogukicecek.png",
                          title: "Serinleten Lezzetler",
                          description:
                              "Sıcak günlerde ferahlatan soğuk içeceklerimizle kahve keyfini farklı bir deneyime dönüştürüyoruz.",
                          icon: Icons.local_drink,
                          isMobile: false,
                        ),
                        const SizedBox(width: 40),
                        _buildExperienceCard(
                          context: context,
                          image: "assets/images/tatli.png",
                          title: "Tatlı Molaları",
                          description:
                              "Kahvenize eşlik eden taze tatlılarımızla her anınıza küçük ve özel bir mutluluk katıyoruz.",
                          icon: Icons.cake,
                          isMobile: false,
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExperienceCard({
    required BuildContext context,
    required String image,
    required String title,
    required String description,
    required IconData icon,
    required bool isMobile,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: isMobile ? double.infinity : 500,
      height: isMobile ? null : 700,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black54 : Colors.black12,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: double.infinity,
              height: isMobile ? 280 : 420,
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
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textDark,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: isDark ? Colors.white70 : Colors.grey,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
