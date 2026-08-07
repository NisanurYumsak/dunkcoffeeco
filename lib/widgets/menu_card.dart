import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';
import 'package:dunkcoffeeco/models/menu_item.dart';

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    // Mobilde, yatay padding (20+20) dışında kalan alanı aşmasın diye
    // kart genişliğini ekrana göre sınırlıyoruz.
    final cardWidth = screenWidth < 700
        ? (screenWidth - 40).clamp(0, 340).toDouble()
        : 340.0;

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? Colors.white10 : Colors.black12,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black87 : Colors.black12,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // FOTOĞRAF ALANI
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xff111111)
                  : Colors.grey.shade100,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.image_outlined,
                size: 60,
                color: Colors.white30,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A0000),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    item.badge,
                    style: const TextStyle(
                      color: AppColors.primaryRed,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? Colors.white
                        : AppColors.textDark,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  item.description,
                  style: TextStyle(
                    color: isDark
                        ? Colors.white70
                        : Colors.black54,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "İçerik",
                  style: TextStyle(
                    color: isDark
                        ? Colors.white
                        : AppColors.textDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  item.ingredients,
                  style: TextStyle(
                    color: isDark
                        ? Colors.white70
                        : Colors.black87,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  "Alerjen",
                  style: TextStyle(
                    color: isDark
                        ? Colors.white
                        : AppColors.textDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  item.allergens,
                  style: TextStyle(
                    color: isDark
                        ? Colors.white70
                        : Colors.black87,
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.price,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryRed,
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryRed,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}