import 'package:flutter/material.dart';

class GalleryImagesSection extends StatelessWidget {
  const GalleryImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
        final maxCardWidth = isMobile
            ? constraints.maxWidth - 40 
            : 580.0;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
            vertical: isMobile ? 40 : 80,
          ),
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: [
                _imageCard("assets/images/pic1.png",
                    isMobile ? maxCardWidth : 280, 220),
                _imageCard("assets/images/pic2.png",
                    isMobile ? maxCardWidth : 280, 220),
                _imageCard("assets/images/pic3.png",
                    isMobile ? maxCardWidth : 280, 220),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/dunkyatayserit.png",
                    width: maxCardWidth,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _imageCard(String image, double width, double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        image,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}