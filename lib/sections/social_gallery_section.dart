import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class SocialGallerySection extends StatelessWidget {
  const SocialGallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 90),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: AppColors.primaryRed,
              ),
              label: Text(
                '@dunkcoffeeco',
                style: TextStyle(
                  color: isDark
                      ? AppColors.textLight
                      : AppColors.textDark,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: _buildGalleryCard(
                  context: context,
                  height: 420,
                  color: const Color(0xFFE2DDD9),
                  child: Image.asset(
                    "assets/images/pic1.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 20),

              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildGalleryCard(
                            context: context,
                            height: 400,
                            color: const Color(0xFFDFE4E2),
                            child: Image.asset(
                              "assets/images/pic2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(width: 20),

                        Expanded(
                          child: _buildGalleryCard(
                            context: context,
                            height: 400,
                            color: const Color(0xFFE7E2DD),
                            child: Image.asset(
                              "assets/images/pic3.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    _buildGalleryCard(
                      context: context,
                      height: 200,
                      color: const Color(0xFFDCDFE2),
                      child: Image.asset(
                        "assets/images/dunkyatayserit.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryCard({
    required BuildContext context,
    required double height,
    required Color color,
    required Widget child,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? Colors.white24 : Colors.transparent,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: child,
      ),
    );
  }
}