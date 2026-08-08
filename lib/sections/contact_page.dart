import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
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
                "BİZE ULAŞIN",
                style: TextStyle(
                  color: AppColors.primaryRed,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 18),

              Text(
                "Sizi Aramızda\nGörmek İsteriz",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 30 : 46,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.textDark,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 55),

              isMobile
                  ? Column(
                      children: [
                        _buildInfoCard(context, isMobile),
                        const SizedBox(height: 24),
                        _buildMapCard(context, isMobile),
                      ],
                    )
                  : IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 5,
                            child: _buildInfoCard(
                              context,
                              isMobile,
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            flex: 7,
                            child: _buildMapCard(
                              context,
                              isMobile,
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoCard(
    BuildContext context,
    bool isMobile,
  ) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkCard
            : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black54
                : Colors.black12,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildContactRow(
            context,
            icon: Icons.location_on,
            title: "Adres",
            value:
                "Hacıhalil, 1212. Sk. No:5, 41400 Gebze/Kocaeli",
            onTap: () async {
              final uri = Uri.parse(
                "https://www.google.com/maps/search/?api=1&query=Dunk+Coffee+Gebze",
              );

              await launchUrl(
                uri,
                mode: LaunchMode.externalApplication,
              );
            },
          ),

          const SizedBox(height: 24),

          _buildContactRow(
            context,
            icon: Icons.phone,
            title: "Telefon",
            value: "0507 992 21 06",
            onTap: () async {
              final uri =
                  Uri.parse("tel:05079922106");

              await launchUrl(uri);
            },
          ),

          const SizedBox(height: 24),

          _buildContactRow(
            context,
            icon: Icons.access_time,
            title: "Çalışma Saatleri",
            value: "Her Gün 09:00 - 00:00",
          ),
        ],
      ),
    );
  }

  Widget _buildContactRow(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    VoidCallback? onTap,
  }) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final content = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: AppColors.primaryRed,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? Colors.white54
                      : Colors.grey,
                  letterSpacing: 0.5,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                value,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? Colors.white
                      : AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    if (onTap == null) {
      return content;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: content,
    );
  }

  Widget _buildMapCard(
    BuildContext context,
    bool isMobile,
  ) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () async {
        final uri = Uri.parse(
          "https://www.google.com/maps/search/?api=1&query=Dunk+Coffee+Gebze",
        );

        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      },
      child: Container(
        height: isMobile ? 260 : null,
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.darkCard
              : Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black54
                  : Colors.black12,
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/map.png",
              fit: BoxFit.cover,
            ),

            Positioned(
              bottom: 16,
              right: 16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryRed,
                  borderRadius:
                      BorderRadius.circular(30),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.map,
                      color: Colors.white,
                      size: 16,
                    ),

                    SizedBox(width: 8),

                    Text(
                      "Google Maps'te Aç",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}