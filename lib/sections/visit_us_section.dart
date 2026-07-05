import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class MenuSelectionSection extends StatelessWidget {
  const MenuSelectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      color: AppColors.lightBg,
      child: Column(
        children: [
          const Text(
            'ZANAAT & TAT',
            style: TextStyle(color: AppColors.primaryRed, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
          const SizedBox(height: 10),
          const Text(
            'DUNK SEÇKİSİ',
            style: TextStyle(color: AppColors.textDark, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _buildMenuCard(
                      title: 'SICAK SERİSİ',
                      titleColor: AppColors.primaryRed,
                      bgColor: Colors.white,
                      items: [
                        {'name': 'FİLTRE KAHVE', 'price': '₺85'},
                        {'name': 'TÜRK KAHVESİ', 'price': '₺80'},
                        {'name': 'CORTADO', 'price': '₺95'},
                        {'name': 'LATTE', 'price': '₺100'},
                      ],
                    ),
                    const SizedBox(height: 30),
                    _buildMenuCard(
                      title: 'SOĞUK VE TAZE',
                      titleColor: Colors.white,
                      bgColor: AppColors.primaryRed,
                      items: [
                        {'name': 'NITRO SOĞUK DEMLEME', 'price': '₺110'},
                        {'name': 'HIBISCUS TEA', 'price': '₺95'},
                        {'name': 'FROZEN ESPRESSO', 'price': '₺120'},
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _buildImageCard('KAVRUMLARIMIZ', 'https://images.unsplash.com/photo-1447933601403-0c6688de566e?q=80&w=500'),
                    const SizedBox(height: 30),
                    _buildImageCard('GÜNLÜK LEZZETLER', 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?q=80&w=500'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({required String title, required Color titleColor, required Color bgColor, required List<Map<String, String>> items}) {
    bool isRedBg = bgColor == AppColors.primaryRed;
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(8, 8),
          child: Container(
            height: isRedBg ? 230 : 260,
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(24)),
          ),
        ),
        Container(
          height: isRedBg ? 230 : 260,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: titleColor, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
              const SizedBox(height: 10),
              Divider(color: isRedBg ? Colors.white30 : Colors.black12, thickness: 1),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(items[index]['name']!, style: TextStyle(color: isRedBg ? Colors.white : AppColors.textDark, fontSize: 14, fontWeight: FontWeight.bold)),
                          Text(items[index]['price']!, style: TextStyle(color: isRedBg ? Colors.white70 : AppColors.primaryRed, fontSize: 14, fontWeight: FontWeight.bold)),
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

  Widget _buildImageCard(String title, String imageUrl) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(8, 8),
          child: Container(
            height: 245,
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(24)),
          ),
        ),
        Container(
          height: 245,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(23)),
                    image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(title, style: const TextStyle(color: AppColors.textDark, fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}