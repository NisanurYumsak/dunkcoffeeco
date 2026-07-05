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
                        'Türk kahve kültürünü modern tasarımla yükseltiyoruz. Kahve bir yakıt, mekan bir sığınaktır.',
                        style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.5),
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
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('KEŞFET', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
                    const SizedBox(height: 20),
                    _buildFooterLink('Kafe Menü'),
                    _buildFooterLink('Tasarımımız'),
                    _buildFooterLink('Etkinlikler'),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('HAKKIMIZDA', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
                    const SizedBox(height: 20),
                    _buildFooterLink('Hikayemiz'),
                    _buildFooterLink('Kavrum Evi'),
                    _buildFooterLink('Lokasyonlar'),
                  ],
                ),
              ),

              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('BÜLTEN', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
                    const SizedBox(height: 15),
                    const Text('Gelişmelerden ve özel kavrumlardan haberdar olun.', style: TextStyle(color: Colors.grey, fontSize: 13)),
                    const SizedBox(height: 20),
                    
                    Container(
                      width: double.infinity,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black, width: 1.2),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'E-posta adresiniz',
                          hintStyle: TextStyle(color: Colors.black26, fontSize: 13),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Stack(
                      children: [
                        Transform.translate(
                          offset: const Offset(3, 3),
                          child: Container(
                            width: 140,
                            height: 42,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Container(
                          width: 140,
                          height: 42,
                          decoration: BoxDecoration(
                            color: AppColors.primaryRed,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black, width: 1.2),
                          ),
                          child: const Center(
                            child: Text(
                              'KAYIT OL',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          const Divider(color: Colors.black12, thickness: 1),
          const SizedBox(height: 20),
          const Text(
            '© 2026 DUNK COFFEE ROASTERS. TÜM HAKLARI SAKLIDIR.',
            style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5),
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
        border: Border.all(color: Colors.black, width: 1.2),
        color: Colors.white,
      ),
      child: Icon(icon, size: 16, color: AppColors.textDark),
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        text,
        style: const TextStyle(color: AppColors.textDark, fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }
}