import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      width: double.infinity,
      color: AppColors.lightBg,
      child: Stack(
        children: [
          Positioned(
  top: 0,
  left: 0,
  right: 0,
  child: Container(
    height: 42,
    color: Colors.black,
    child: const Center(
      child: Text(
        'SPECIALTY COFFEE • FRESHLY BAKED • PREMIUM BEANS • EST. 2026 •',
        style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    ),
  ),
),
          Positioned(
            bottom: -50,
            left: 100,
            right: 100,
            child: Opacity(
              opacity: 0.05,
              child: Image.network(
                'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?q=80&w=600',
                fit: BoxFit.contain,
                height: 450,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 80,
              right:80,
              top: 40,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        color: AppColors.primaryRed,
                        child: const Text(
                          'ÖZENLE HAZIRLANAN HER FİNCAN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 52,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark,
                            height: 1.1,
                            letterSpacing: -0.5,
                          ),
                          children: [
                            TextSpan(text: 'Kahvenin\n'),
                            TextSpan(
                              text: 'En İyi Hali.',
                              style: TextStyle(
                                color: AppColors.primaryRed,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      const SizedBox(
                        width: 430,
                        child: Text(
                          'Dunk Coffee’de her fincan; özenle seçilmiş çekirdekler, taze lezzetler ve samimi bir atmosferle buluşur. Güne güzel bir başlangıç yapmak ya da keyifli bir mola vermek için doğru adres.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            height: 1.7,
                          ),
                        ),
                      ),

                      const SizedBox(height: 45),

                      Row(
                        children: [
                          _buildShadowedButton(
                            "MENÜYÜ İNCELE",
                            isRed: true,
                          ),
                          const SizedBox(width: 25),
                          _buildShadowedButton(
                            "ŞUBELERİMİZ",
                            isRed: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 40),

                Expanded(
                  flex: 10,
                  child: Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Transform.translate(
                          offset: const Offset(16, 16),
                          child: Container(
                            width: 380,
                            height: 420,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                        ),
                        Container(
                          width: 380,
                          height: 420,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(32),
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/coffee.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShadowedButton(
    String label, {
      required bool isRed,
    }) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(4, 4),
          child: Container(
            width: 180,
            height: 54,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
                Container(
          width: 180,
          height: 54,
          decoration: BoxDecoration(
            color: isRed ? AppColors.primaryRed : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: isRed
                ? null
                : Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ),
          ),
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isRed
                    ? Colors.white
                    : AppColors.textDark,
                fontWeight: FontWeight.bold,
                fontSize: 11,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}