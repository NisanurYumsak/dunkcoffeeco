import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightBg,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SOL TARAF
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DUNK COFFEE',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryRed,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                      width: 260,
                      child: Text(
                        'Kahve kültürünü modern dokunuşlarla buluşturuyor, her tadımda sıcak ve samimi bir deneyim sunuyoruz.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          height: 1.6,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        _buildSocialIcon(Icons.camera_alt),
                        const SizedBox(width: 12),
                        _buildSocialIcon(Icons.language),
                        const SizedBox(width: 12),
                        _buildSocialIcon(Icons.alternate_email),
                      ],
                    ),
                  ],
                ),
              ),

              // KEŞFET
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'KEŞFET',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildFooterLink('Ana Sayfa'),
                    _buildFooterLink('Menü'),
                    _buildFooterLink('Hakkımızda'),
                    _buildFooterLink('Bize Ulaşın'),
                  ],
                ),
              ),

              // İLETİŞİM
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'İLETİŞİM',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      '📍 Hacıhalil, 1212. Sk. No:5, 41400 Gebze/Kocaeli',
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontSize: 13,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      '📞 0507 992 21 06',
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      '🕒 Her Gün 09:00 - 00:00',
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 20),
                                        ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "assets/images/map.png",
                        width: 260,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 60),

          const Divider(
            color: Colors.black12,
            thickness: 1,
          ),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              '© 2026 DUNK COFFEE. TÜM HAKLARI SAKLIDIR.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Icon(
        icon,
        size: 18,
        color: AppColors.textDark,
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.textDark,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}