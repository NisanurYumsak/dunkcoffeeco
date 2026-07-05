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
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Row(
              children: [
                Expanded(
                  flex: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        color: AppColors.primaryRed,
                        child: const Text(
                          'EMEK, SEVGİ, TUTKU...',
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
                            TextSpan(text: 'Günlük Ritüeliniz,\n'),
                            TextSpan(text: 'YÜKSELDİ.', style: TextStyle(color: AppColors.primaryRed)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(
                        width: 420,
                        child: Text(
                          'Odaklanmış, akışkan ve en kaliteli kahve çekirdekleriyle tasarlanmış yüksek voltajlı bir sığınak. Meraklılar için üretilen kadim hoş geldiniz — zanaatın coşkuyla buluştuğu yer.',
                          style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.6),
                        ),
                      ),
                      const SizedBox(height: 45),
                      Row(
                        children: [
                          _buildShadowedButton("HEMEN SİPARİŞ VER", isRed: true),
                          const SizedBox(width: 25),
                          _buildShadowedButton("BİZİ ZİYARET EDİN", isRed: false),
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
                              image: NetworkImage('https://images.unsplash.com/photo-1554118811-1e0d58224f24?q=80&w=600'), 
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
  Widget _buildShadowedButton(String label, {required bool isRed}) {
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
            border: isRed ? null : Border.all(color: Colors.black, width: 1.5),
          ),
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isRed ? Colors.white : AppColors.textDark,
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