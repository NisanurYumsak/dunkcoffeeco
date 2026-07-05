import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class SocialGallerySection extends StatelessWidget {
  const SocialGallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightBg,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 90),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'TOPLULUĞUMUZ',
                    style: TextStyle(
                      color: AppColors.primaryRed,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'BİZİMLE BAĞLANTI KURUN.',
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt_outlined, color: AppColors.primaryRed),
                label: const Text(
                  '@dunkcoffee',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: _buildGalleryCard(
                  height: 420,
                  color: const Color(0xFFE2DDD9),
                  child: const Center(
                    child: Icon(Icons.coffee, size: 48, color: Colors.black26),
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
                            height: 200,
                            color: const Color(0xFFDFE4E2),
                            child: const Center(
                              child: Icon(Icons.auto_awesome, size: 32, color: Colors.black26),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _buildGalleryCard(
                            height: 200,
                            color: const Color(0xFFE7E2DD),
                            child: const Center(
                              child: Icon(Icons.storefront, size: 32, color: Colors.black26),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildGalleryCard(
                      height: 200,
                      color: const Color(0xFFDCDFE2),
                      child: const Center(
                        child: Icon(Icons.coffee, size: 36, color: Colors.black26),
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

  Widget _buildGalleryCard({required double height, required Color color, required Widget child}) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 1.2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: child,
      ),
    );
  }
}