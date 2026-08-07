import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class PrecisionDemandingSection extends StatelessWidget {
  const PrecisionDemandingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        final textColumn = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'KAFEİN MÜHENDİSLİĞİ',
              style: TextStyle(
                color: AppColors.primaryRed,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'HER DAMLADA\nHASSASİYET.',
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 30 : 42,
                fontWeight: FontWeight.bold,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: isMobile ? double.infinity : 450,
              child: const Text(
                'Espresso makineleri sadece basınç yapmaz; onlar bilimsel birer sanatçıdır ve lezzet profilini kilitleyebilirler. Her bir ısı ve mililitre oynaması, her kadeh basımını tekrar sayılamaz kalitede tanımlayabilir.',
                style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.6),
              ),
            ),
            const SizedBox(height: 45),
            _buildRowDetail(
              icon: Icons.flash_on,
              iconBg: AppColors.primaryRed,
              iconColor: Colors.white,
              title: 'AKILLI BASINÇ SİSTEMLERİ',
              desc:
                  '9 bar sabit basınç optimizasyonu ile çekirdeğin en derin gövdesini fincana aktarır.',
              isMobile: isMobile,
            ),
            const SizedBox(height: 25),
            _buildRowDetail(
              icon: Icons.water_drop,
              iconBg: Colors.white,
              iconColor: Colors.black,
              title: 'MİKRO ISI KONTROLÜ',
              desc:
                  '0.1 derecelik hassas su sıcaklığı takibiyle yanık tatları tamamen engeller.',
              isMobile: isMobile,
            ),
          ],
        );

        final imageStack = Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: isMobile ? double.infinity : 400,
                height: isMobile ? 280 : 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/kafeinmuh.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: -20,
                right: 20,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4)),
                    ],
                  ),
                  child: const Icon(Icons.coffee,
                      color: AppColors.primaryRed, size: 22),
                ),
              ),
            ],
          ),
        );

        return Column(
          children: [
            Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 80,
                vertical: isMobile ? 60 : 100,
              ),
              width: double.infinity,
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textColumn,
                        const SizedBox(height: 40),
                        imageStack,
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 12, child: textColumn),
                        const SizedBox(width: 40),
                        Expanded(flex: 10, child: imageStack),
                      ],
                    ),
            ),

            // KAFEİN MÜHENDİSLİĞİ ALTINDAKİ 3'LÜ FOTO SATIRI
            Container(
              color: Colors.black,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                isMobile ? 20 : 80,
                0,
                isMobile ? 20 : 80,
                40,
              ),
              child: isMobile
                  ? Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            "assets/images/pic1.png",
                            height: 260,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            "assets/images/pic2.png",
                            height: 260,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            "assets/images/pic3.png",
                            height: 260,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              "assets/images/pic1.png",
                              height: 480,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              "assets/images/pic2.png",
                              height: 480,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              "assets/images/pic3.png",
                              height: 480,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),

            // KAFEİN MÜHENDİSLİĞİ ALTINDAKİ 4'LÜ FOTO ŞERİDİ
            Image.asset(
              "assets/images/dunkyatayserit.png",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        );
      },
    );
  }

  Widget _buildRowDetail({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String desc,
    required bool isMobile,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: isMobile ? double.infinity : 380,
                child: Text(desc,
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 13, height: 1.5)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
