import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class MenuSelectionSection extends StatelessWidget {
  const MenuSelectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        final signatureCard = _buildMenuCard(
          context: context,
          title: "SIGNATURE COFFEE",
          titleColor: Colors.white,
          bgColor: AppColors.primaryRed,
          items: [
            {"name": "Espresso", "price": "\$4"},
            {"name": "Cappuccino", "price": "\$5"},
            {"name": "Latte", "price": "\$5"},
            {"name": "Americano", "price": "\$4"},
          ],
        );

        final specialCard = _buildMenuCard(
          context: context,
          title: "SPECIAL DRINKS",
          titleColor: isDark ? AppColors.textLight : AppColors.textDark,
          bgColor: isDark ? AppColors.darkCard : Colors.white,
          items: [
            {"name": "Vanilla Latte", "price": "\$6"},
            {"name": "Caramel Macchiato", "price": "\$6"},
            {"name": "Mocha", "price": "\$5"},
            {"name": "Cold Brew", "price": "\$5"},
          ],
        );

        final imageCard = _buildImageCard(
          context,
          "Fresh Coffee Beans",
          "https://images.unsplash.com/photo-1447933601403-0c6688de566e",
        );

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
            vertical: isMobile ? 40 : 60,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              isMobile
                  ? Column(
                      children: [
                        SizedBox(height: 230, child: signatureCard),
                        const SizedBox(height: 30),
                        SizedBox(height: 260, child: specialCard),
                        const SizedBox(height: 30),
                        SizedBox(height: 245, child: imageCard),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: signatureCard),
                        const SizedBox(width: 30),
                        Expanded(child: specialCard),
                        const SizedBox(width: 30),
                        Expanded(child: imageCard),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required Color titleColor,
    required Color bgColor,
    required List<Map<String, String>> items,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    bool isRedBg = bgColor == AppColors.primaryRed;

    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(8, 8),
          child: Container(
            height: isRedBg ? 230 : 260,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        Container(
          height: isRedBg ? 230 : 260,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isDark ? Colors.white24 : Colors.black,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),

              const SizedBox(height: 10),

              Divider(
                color: isRedBg
                    ? Colors.white30
                    : (isDark ? Colors.white24 : Colors.black12),
              ),

              const SizedBox(height: 15),

              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            items[index]['name']!,
                            style: TextStyle(
                              color: isRedBg
                                  ? Colors.white
                                  : (isDark
                                      ? Colors.white
                                      : AppColors.textDark),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            items[index]['price']!,
                            style: TextStyle(
                              color: isRedBg
                                  ? Colors.white70
                                  : AppColors.primaryRed,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageCard(
      BuildContext context,
      String title,
      String imageUrl,
      ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(8, 8),
          child: Container(
            height: 245,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        Container(
          height: 245,
          decoration: BoxDecoration(
            color:
                isDark ? AppColors.darkCard : Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isDark ? Colors.white24 : Colors.black,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(23),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  title,
                  style: TextStyle(
                    color: isDark
                        ? AppColors.textLight
                        : AppColors.textDark,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}