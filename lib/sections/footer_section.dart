import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class FooterSection extends StatelessWidget {
  final VoidCallback onGalleryPressed;

  const FooterSection({
    super.key,
    required this.onGalleryPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
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
                    SizedBox(
                      width: 260,
                      child: Text(
                        'Kahve kültürünü modern dokunuşlarla buluşturuyor, her tadımda sıcak ve samimi bir deneyim sunuyoruz.',
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.grey,
                          fontSize: 13,
                          height: 1.6,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    Row(
                      children: [
                        _buildSocialIcon(
                          context,
                          Icons.camera_alt,
                          onTap: onGalleryPressed,
                        ),
                        const SizedBox(width: 12),
                        _buildSocialIcon(
                          context,
                          Icons.language,
                        ),
                        const SizedBox(width: 12),
                        _buildSocialIcon(
                          context,
                          Icons.alternate_email,
                        ),
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
                    _buildFooterLink(context, 'Ana Sayfa'),
                    _buildFooterLink(context, 'Menü'),
                    _buildFooterLink(context, 'Hakkımızda'),
                    _buildFooterLink(context, 'Bize Ulaşın'),
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

                    Text(
                      '📍 Hacıhalil, 1212. Sk. No:5, 41400 Gebze/Kocaeli',
                      style: TextStyle(
                        color: isDark ? Colors.white : AppColors.textDark,
                        fontSize: 13,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      '📞 0507 992 21 06',
                      style: TextStyle(
                        color: isDark ? Colors.white : AppColors.textDark,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      '🕒 Her Gün 09:00 - 00:00',
                      style: TextStyle(
                        color: isDark ? Colors.white : AppColors.textDark,
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

          Divider(
            color: isDark ? Colors.white24 : Colors.black12,
          ),

          const SizedBox(height: 20),

          Text(
            '© 2026 DUNK COFFEE. TÜM HAKLARI SAKLIDIR.',
            style: TextStyle(
              color: isDark ? Colors.white54 : Colors.grey,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(
    BuildContext context,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark ? AppColors.darkCard : Colors.white,
          border: Border.all(
            color: isDark ? Colors.white24 : Colors.black12,
          ),
        ),
        child: Icon(
          icon,
          size: 18,
          color: isDark ? Colors.white : AppColors.textDark,
        ),
      ),
    );
  }

  Widget _buildFooterLink(BuildContext context, String text) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(
          color: isDark ? Colors.white : AppColors.textDark,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}