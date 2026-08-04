import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';
import 'package:dunkcoffeeco/data/menu_data.dart';
import 'package:dunkcoffeeco/widgets/menu_card.dart';

class FullMenuPage extends StatelessWidget {
  const FullMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Container(
      width: double.infinity,
      color: AppColors.lightBg,
      padding: const EdgeInsets.symmetric(
        horizontal: 80,
        vertical: 90,
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

          const Text(
            "Her Fincanda Özen,\nHer Lokmada Lezzet",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 18),

          const SizedBox(
            width: 700,
            child: Text(
              "Dunk Coffee'nin özenle hazırlanan kahveleri, "
              "serinleten içecekleri, taptaze sandviçleri "
              "ve enfes tatlılarıyla her anınıza eşlik eden "
              "lezzetleri keşfedin.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
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
              _buildCategoryChip("☕ Kahveler"),
              _buildCategoryChip("🧊 Soğuk Kahveler"),
              _buildCategoryChip("🍹 Soğuk İçecekler"),
              _buildCategoryChip("🥪 Sandviçler"),
              _buildCategoryChip("🍰 Tatlılar"),
            ],
          ),

          const SizedBox(height: 80),


          // ☕ KAHVELER

          _title("☕ Kahveler"),

          _description(
            "Espresso bazlı sıcak kahvelerimiz.",
          ),

          const SizedBox(height: 35),

          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: coffees
                .map((item) => MenuCard(item: item))
                .toList(),
          ),


          const SizedBox(height: 90),


          // 🧊 SOĞUK KAHVELER

          _title("🧊 Soğuk Kahveler"),

          _description(
            "Serinleten espresso bazlı kahveler.",
          ),

          const SizedBox(height: 35),

          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: icedCoffees
                .map((item) => MenuCard(item: item))
                .toList(),
          ),


          const SizedBox(height: 90),


          // 🍹 SOĞUK İÇECEKLER

          _title("🍹 Soğuk İçecekler"),

          _description(
            "Meyveli ve ferahlatıcı içecekler.",
          ),

          const SizedBox(height: 35),

          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: drinks
                .map((item) => MenuCard(item: item))
                .toList(),
          ),


          const SizedBox(height: 90),


          // 🥪 SANDVİÇLER

          _title("🥪 Sandviçler"),

          _description(
            "Günlük hazırlanan taptaze sandviçler.",
          ),

          const SizedBox(height: 35),

          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: sandwiches
                .map((item) => MenuCard(item: item))
                .toList(),
          ),


          const SizedBox(height: 90),


          // 🍰 TATLILAR

          _title("🍰 Tatlılar"),

          _description(
            "Kahvenizin yanına tatlı bir eşlikçi.",
          ),

          const SizedBox(height: 35),

          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: desserts
                .map((item) => MenuCard(item: item))
                .toList(),
          ),
        ],
      ),
    );
  }


  Widget _title(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
      ),
    );
  }


  Widget _description(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),
    );
  }


  Widget _buildCategoryChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
      ),
    );
  }
}