import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class PrecisionDemandingSection extends StatelessWidget {
  const PrecisionDemandingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, 
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SOL TARAF: Yazılar ve İkonlu Maddeler
          Expanded(
            flex: 12,
            child: Column(
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
                const Text(
                  'HER DAMLADA\nHASSASİYET.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 25),
                const SizedBox(
                  width: 450,
                  child: Text(
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
                  desc: '9 bar sabit basınç optimizasyonu ile çekirdeğin en derin gövdesini fincana aktarır.',
                ),
                const SizedBox(height: 25),
                
                _buildRowDetail(
                  icon: Icons.water_drop,
                  iconBg: Colors.white,
                  iconColor: Colors.black,
                  title: 'MİKRO ISI KONTROLÜ',
                  desc: '0.1 derecelik hassas su sıcaklığı takibiyle yanık tatları tamamen engeller.',
                ),
              ],
            ),
          ),

          const SizedBox(width: 40),

          // SAĞ TARAF: Yumuşak köşeli Demleme Ekipmanı Görseli
          Expanded(
            flex: 10,
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Ana Büyük Görsel (Tartı, Dripper ve Kettle olan o şık alan)
                  Container(
                    width: 400,
                    height: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      image: const DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?q=80&w=500'), 
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
                          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
                        ],
                      ),
                      child: const Icon(Icons.coffee, color: AppColors.primaryRed, size: 22),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowDetail({
    required IconData icon, 
    required Color iconBg, 
    required Color iconColor, 
    required String title, 
    required String desc
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
                style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 0.5),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 380,
                child: Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 13, height: 1.5)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}