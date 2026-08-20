import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';
import 'package:dunkcoffeeco/data/menu_data.dart';
import 'package:dunkcoffeeco/widgets/menu_card.dart';

class FullMenuPage extends StatelessWidget {
  const FullMenuPage({super.key});

  static final GlobalKey _coffeeKey = GlobalKey();
  static final GlobalKey _icedKey = GlobalKey();
  static final GlobalKey _drinkKey = GlobalKey();
  static final GlobalKey _sandwichKey = GlobalKey();
  static final GlobalKey _dessertKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        alignment: 0.05,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final coffees =
        menuItems.where((item) => item.category == "coffee").toList();

    final icedCoffees =
        menuItems.where((item) => item.category == "iced").toList();

    final drinks =
        menuItems.where((item) => item.category == "drink").toList();

    final sandwiches =
        menuItems.where((item) => item.category == "sandwich").toList();

    final desserts =
        menuItems.where((item) => item.category == "dessert").toList();

    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 700;

      return Container(
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 50 : 90,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "MENÜMÜZ",
            style: TextStyle(
              color: AppColors.primaryRed,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            "Her Fincanda Özen,\nHer Lokmada Lezzet",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 30 : 46,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textDark,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 18),

          SizedBox(
            width: isMobile ? double.infinity : 700,
            child: Text(
              "Dunk Coffee'nin özenle hazırlanan kahveleri, "
              "serinleten içecekleri, taptaze sandviçleri "
              "ve enfes tatlılarıyla her anınıza eşlik eden "
              "lezzetleri keşfedin.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isDark ? Colors.white70 : Colors.grey,
                fontSize: 16,
                height: 1.7,
              ),
            ),
          ),

          const SizedBox(height: 55),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 18,
            runSpacing: 18,
            children: [
              _buildCategoryChip(
                context,
                "☕ Kahveler",
                onTap: () => _scrollTo(_coffeeKey),
              ),
              _buildCategoryChip(
                context,
                "🧊 Soğuk Kahveler",
                onTap: () => _scrollTo(_icedKey),
              ),
              _buildCategoryChip(
                context,
                "🍹 Soğuk İçecekler",
                onTap: () => _scrollTo(_drinkKey),
              ),
              _buildCategoryChip(
                context,
                "🥪 Sandviçler",
                onTap: () => _scrollTo(_sandwichKey),
              ),
              _buildCategoryChip(
                context,
                "🍰 Tatlılar",
                onTap: () => _scrollTo(_dessertKey),
              ),
            ],
          ),

          const SizedBox(height: 80),

          _title(context, "☕ Kahveler", key: _coffeeKey),
          _description(context, "Espresso bazlı sıcak kahveler."),
          const SizedBox(height: 35),

          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: coffees.map((item) => MenuCard(item: item)).toList(),
          ),

          const SizedBox(height: 90),

          _title(context, "🧊 Soğuk Kahveler", key: _icedKey),
          _description(context, "Serinleten espresso bazlı kahveler."),
          const SizedBox(height: 35),

          Wrap(
            spacing: 30,
            runSpacing: 30,
            children:
                icedCoffees.map((item) => MenuCard(item: item)).toList(),
          ),

          const SizedBox(height: 90),

          _title(context, "🍹 Soğuk İçecekler", key: _drinkKey),
          _description(context, "Meyveli ve ferahlatıcı içecekler."),
          const SizedBox(height: 35),

          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: drinks.map((item) => MenuCard(item: item)).toList(),
          ),

          const SizedBox(height: 90),

          _title(context, "🥪 Sandviçler", key: _sandwichKey),
          _description(context, "Günlük hazırlanan taptaze sandviçler."),
          const SizedBox(height: 35),

          Wrap(
            spacing: 30,
            runSpacing: 30,
            children:
                sandwiches.map((item) => MenuCard(item: item)).toList(),
          ),

          const SizedBox(height: 90),

          _title(context, "🍰 Tatlılar", key: _dessertKey),
          _description(context, "Kahvenizin yanına tatlı bir eşlikçi."),
          const SizedBox(height: 35),

          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: desserts.map((item) => MenuCard(item: item)).toList(),
          ),
        ],
      ),
    );
    });
  }

  Widget _title(BuildContext context, String text, {Key? key}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      key: key,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : AppColors.textDark,
        ),
      ),
    );
  }

  Widget _description(BuildContext context, String text) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          color: isDark ? Colors.white70 : Colors.grey,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildCategoryChip(
    BuildContext context,
    String text, {
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF1E1E1E)
              : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isDark
                ? Colors.white24
                : Colors.black12,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark
                ? Colors.white
                : AppColors.textDark,
          ),
        ),
      ),
    );
  }
}
