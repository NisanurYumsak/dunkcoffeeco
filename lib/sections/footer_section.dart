import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dunkcoffeeco/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatelessWidget {
  final VoidCallback onGalleryPressed;
  final VoidCallback onHomePressed;
  final VoidCallback onMenuPressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onContactPressed;

  const FooterSection({
    super.key,
    required this.onGalleryPressed,
    required this.onHomePressed,
    required this.onMenuPressed,
    required this.onAboutPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        final brandColumn = Column(
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
              width: isMobile ? double.infinity : 260,
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

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSocialRow(
                  context,
                  icon: FontAwesomeIcons.instagram,
                  name: "dunkcoffee.co",
                  url: "https://www.instagram.com/dunkcoffee.co/",
                ),

                const SizedBox(height: 14),

                _buildSocialRow(
                  context,
                  icon: FontAwesomeIcons.tiktok,
                  name: "dunkcoffeeco",
                  url: "https://www.tiktok.com/@dunkcoffeeco",
                ),
              ],
            ),
          ],
        );

        final exploreColumn = Column(
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

            _buildFooterLink(
              context,
              'Ana Sayfa',
              onHomePressed,
            ),

            _buildFooterLink(
              context,
              'Menü',
              onMenuPressed,
            ),

            _buildFooterLink(
              context,
              'Hakkımızda',
              onAboutPressed,
            ),

            _buildFooterLink(
              context,
              'Bize Ulaşın',
              onContactPressed,
            ),
          ],
        );

        final contactColumn = Column(
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
                color: isDark
                    ? Colors.white
                    : AppColors.textDark,
                fontSize: 13,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              '📞 0507 992 21 06',
              style: TextStyle(
                color: isDark
                    ? Colors.white
                    : AppColors.textDark,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              '🕒 Her Gün 09:00 - 00:00',
              style: TextStyle(
                color: isDark
                    ? Colors.white
                    : AppColors.textDark,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 20),

            InkWell(
              borderRadius: BorderRadius.circular(16),
             onTap: () async {
  final uri = Uri.parse(
    "https://www.google.com/maps/search/?api=1&query=40.79728814304412,29.435331540585548",
  );

  await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  );
},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/location.png",
                  width: isMobile ? double.infinity : 260,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        );

        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
            vertical: isMobile ? 50 : 80,
          ),
          width: double.infinity,
          child: Column(
            children: [
              isMobile
                  ? Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        brandColumn,
                        const SizedBox(height: 40),
                        exploreColumn,
                        const SizedBox(height: 40),
                        contactColumn,
                      ],
                    )
                  : Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: brandColumn,
                        ),
                        Expanded(
                          flex: 2,
                          child: exploreColumn,
                        ),
                        Expanded(
                          flex: 4,
                          child: contactColumn,
                        ),
                      ],
                    ),

              const SizedBox(height: 60),

              Divider(
                color: isDark
                    ? Colors.white24
                    : Colors.black12,
              ),

              const SizedBox(height: 20),

              Text(
                '© 2026 DUNK COFFEE. TÜM HAKLARI SAKLIDIR.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isDark
                      ? Colors.white54
                      : Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSocialIcon(
    BuildContext context,
    FaIconData icon,
  ) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDark
            ? AppColors.darkCard
            : Colors.white,
        border: Border.all(
          color: isDark
              ? Colors.white24
              : Colors.black12,
        ),
      ),
      child: Center(
        child: FaIcon(
          icon,
          size: 20,
          color: isDark
              ? Colors.white
              : AppColors.textDark,
        ),
      ),
    );
  }

  Widget _buildSocialRow(
    BuildContext context, {
    required FaIconData icon,
    required String name,
    required String url,
  }) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);

        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      },
      borderRadius: BorderRadius.circular(30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSocialIcon(
            context,
            icon,
          ),

          const SizedBox(width: 12),

          Text(
            name,
            style: TextStyle(
              color: isDark
                  ? Colors.white
                  : AppColors.textDark,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(
    BuildContext context,
    String text,
    VoidCallback onTap,
  ) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: isDark
                ? Colors.white
                : AppColors.textDark,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}