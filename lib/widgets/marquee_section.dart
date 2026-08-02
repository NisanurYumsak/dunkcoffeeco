import 'package:flutter/material.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class MarqueeSection extends StatefulWidget {
  const MarqueeSection({super.key});

  @override
  State<MarqueeSection> createState() => _MarqueeSectionState();
}

class _MarqueeSectionState extends State<MarqueeSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: AppColors.primaryRed,
      child: ClipRect(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                -MediaQuery.of(context).size.width * _controller.value,
                0,
              ),
              child: Row(
                children: [
                  _buildText(),
                  _buildText(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildText() {
    return Row(
      children: List.generate(
        2,
        (_) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: const [
              Icon(Icons.coffee, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                "ÖZENLE HAZIRLANAN KAHVELER",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 30),

              Icon(Icons.bakery_dining, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                "GÜNLÜK TAZE LEZZETLER",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 30),

              Icon(Icons.eco, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                "KALİTELİ ÇEKİRDEKLER",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 30),

              Icon(Icons.favorite_border,
                  color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                "SICAK VE SAMİMİ ATMOSFER",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 16,
                ),
              ),

              SizedBox(width: 100),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}