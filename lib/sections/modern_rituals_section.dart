import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class ModernRitualsSection extends StatelessWidget {
  const ModernRitualsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      color: AppColors.lightBg,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SOL TARAF: Tasarımdaki ince siyah çerçeveli espresso makinesi şeması kutusu
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.black, width: 1.2), // Sert keskin çerçeve
                ),
                padding: const EdgeInsets.all(30),
                child: Opacity(
                  opacity: 0.8,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?q=80&w=400', // Teknik/minimalist bir çizim havası için geçici şık görsel
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(width: 80),

          // SAĞ TARAF: Başlıklar, Açıklama ve O Özel Kapsüllü Tik Maddeleri
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'KONSEPT',
                  style: TextStyle(
                    color: AppColors.primaryRed, 
                    fontSize: 11, 
                    fontWeight: FontWeight.bold, 
                    letterSpacing: 2
                  ),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 38, 
                      fontWeight: FontWeight.bold, 
                      color: AppColors.textDark, 
                      height: 1.2
                    ),
                    children: [
                      TextSpan(text: 'MODERN RİTÜELLER\n'),
                      TextSpan(text: 'DİNAMİK RUH.', style: TextStyle(color: AppColors.primaryRed)),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Eski kafe kültürünü geride bıraktık. Dunk, Türk kahve zanaatkarlığı ile modern tasarımın yüksek enerjili bir harmanıdır. Sadece bir kahve değil, sonraki büyük fikriniz için ilham verici bir çalışma ve fiziksel yaşam alanıdır.',
                  style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.6),
                ),
                const SizedBox(height: 35),
                _buildCapsuleCheckPoint("Nitelikli Çekirdek Garantisi"),
                _buildCapsuleCheckPoint("Modern ve İzole Çalışma Alanları"),
                _buildCapsuleCheckPoint("Zanaatkar Kavrum Teknikleri"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCapsuleCheckPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: const Icon(
              Icons.check,
              color: AppColors.primaryRed,
              size: 14,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}