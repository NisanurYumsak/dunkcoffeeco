import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class FullMenuPage extends StatelessWidget {
  const FullMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightBg,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'KAVRUM MENÜSÜ',
            style: TextStyle(
              color: AppColors.primaryRed,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'ÖZENLE SEÇİLMİŞ, TİTİZLİKLE KAVRULMUŞ.',
            style: TextStyle(
              color: AppColors.textDark,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Haftalık olarak güncellenen seçkimizle, kökenine ve işleme sürecine sadık kaldığımız çekirdekler.',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildMenuCard(
                  title: 'Dunk Blend №1',
                  origin: 'Etiyopya & Kolombiya',
                  roastLevel: 'Medium Roast',
                  notes: 'Çikolata, narenciye ve tatlı karamel notaları.',
                  price: '₺320',
                  badgeColor: AppColors.primaryRed,
                  textColor: Colors.white,
                ),
              ),
              const SizedBox(width: 25),
              Expanded(
                child: _buildMenuCard(
                  title: 'Guatemala Huehuetenango',
                  origin: 'Tek Köken (Single Origin)',
                  roastLevel: 'Light/Medium Roast',
                  notes: 'Yeşil elma, esmer şeker ve dengeli asidite.',
                  price: '₺380',
                  badgeColor: Colors.black,
                  textColor: Colors.white,
                ),
              ),
              const SizedBox(width: 25),

              Expanded(
                child: _buildMenuCard(
                  title: 'Ethiopia Yirgacheffe Kochere',
                  origin: 'Natürel İşlem',
                  roastLevel: 'Light Roast',
                  notes: 'Yasemin aroması, bergamot ve canlı şeftali tonları.',
                  price: '₺440',
                  badgeColor: const Color(0xFFE2DDD9),
                  textColor: AppColors.textDark,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 80),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black, width: 1.5),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: AppColors.primaryRed, size: 28),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Toptan Alım ve Çekirdek Aboneliği',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textDark),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Ofisiniz veya işletmeniz için özel kavrum profilleri ve toplu sipariş avantajları hakkında bilgi almak için bizimle iletişime geçebilirsiniz.',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required String title,
    required String origin,
    required String roastLevel,
    required String notes,
    required String price,
    required Color badgeColor,
    required Color textColor,
  }) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(6, 6),
          child: Container(
            height: 340,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        Container(
          height: 340,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Text(
                      roastLevel,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Kahve İsmi
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    origin,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.primaryRed,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    notes,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_sharp,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}