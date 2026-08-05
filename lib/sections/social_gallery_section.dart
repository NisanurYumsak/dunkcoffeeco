import 'package:flutter/material.dart';

class SocialGallerySection extends StatelessWidget {
  const SocialGallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final images = List.generate(
      18,
      (index) => "assets/images/galeri${index + 1}.png",
    );

    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 3;

    if (screenWidth < 700) {
      crossAxisCount = 1;
    } else if (screenWidth < 1100) {
      crossAxisCount = 2;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 80,
        vertical: 80,
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Text(
            "GALERİMİZ",
            style: TextStyle(
              color: Colors.red.shade700,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            "Dunk Coffee'den Kareler",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),

          const SizedBox(height: 18),

          SizedBox(
            width: 650,
            child: Text(
              "Dunk Coffee'de hazırlanan her fincanın arkasında sıcak bir hikâye var. İşte en güzel anlarımız.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: isDark
                    ? Colors.white70
                    : Colors.black54,
                height: 1.7,
              ),
            ),
          ),

          const SizedBox(height: 50),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: images.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              images[index],
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Image.asset(
        images[index],
        fit: BoxFit.cover,
      ),
    ),
  );
},
          ),
        ],
      ),
    );
  }
}