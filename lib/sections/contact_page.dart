import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dunkcoffeeco/constants/colors.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  static const String _phoneNumber = "05079922106";
  static const String _address =
      "Hacıhalil, 1212. Sk. No:5, 41400 Gebze/Kocaeli";
  static const String _hours = "Her Gün 09:00 - 00:00";

  static final Uri _mapsUri = Uri.parse(
    "https://www.google.com/maps/search/?api=1&query=40.79728814304412,29.435331540585548",
  );

  // Google'da doğrudan "yorum yaz" ekranını açan link.
  // YOUR_PLACE_ID kısmını işletmenizin gerçek Google Place ID'siyle
  // değiştirin. Place ID'yi şuradan bulabilirsiniz:
  // https://developers.google.com/maps/documentation/places/web-service/place-id
  static final Uri _reviewUri = Uri.parse(
    "https://search.google.com/local/writereview?placeid=ChIJR05Q_nQhyxQRnlKU-UoxCmE",
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHero(context, isMobile),
            _buildFeatureStrip(context, isMobile),
            _buildTestimonials(context, isMobile),
            _buildContactSection(context, isMobile),
          ],
        );
      },
    );
  }

  // ============================================================
  // HERO — koyu bordo zemin, solda başlık/CTA, sağda kemer
  // (arch) şeklinde çerçevede fotoğraf.
  // Fotoğrafı değiştirmek için sadece asset yolunu güncelleyin:
  // assets/images/dunkbahce.png
  // ============================================================
  Widget _buildHero(BuildContext context, bool isMobile) {
    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.mail_outline, color: Color(0xFFF3D9C9), size: 16),
            const SizedBox(width: 8),
            const Text(
              "BİZİMLE İLETİŞİME GEÇİN",
              style: TextStyle(
                color: Color(0xFFF3D9C9),
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Text(
          "Bize Ulaşmaktan\nÇekinmeyin",
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 34 : 48,
            fontWeight: FontWeight.w800,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          width: isMobile ? double.infinity : 420,
          child: const Text(
            "Her türlü soru, öneri veya iş birliği talepleriniz için "
            "bizimle iletişime geçmekten çekinmeyin. Size en kısa "
            "sürede dönüş yapacağız.",
            style: TextStyle(
              color: Color(0xFFE9D6CC),
              fontSize: 15,
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                await launchUrl(_mapsUri, mode: LaunchMode.externalApplication);
              },
              icon: const Icon(Icons.map_outlined, size: 16),
              label: const Text(
                "Haritada Gör",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primaryRed,
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () async {
                await launchUrl(_reviewUri, mode: LaunchMode.externalApplication);
              },
              icon: const Icon(Icons.star_border, size: 16, color: Colors.white),
              label: const Text(
                "Bizi Puanlayın",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white54, width: 1.5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          ],
        ),
      ],
    );

    // Kemer (arch) şeklinde foto çerçevesi.
    final archPhoto = Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isMobile ? 160 : 220),
            topRight: Radius.circular(isMobile ? 160 : 220),
            bottomLeft: const Radius.circular(20),
            bottomRight: const Radius.circular(20),
          ),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isMobile ? 150 : 210),
                topRight: Radius.circular(isMobile ? 150 : 210),
                bottomLeft: const Radius.circular(12),
                bottomRight: const Radius.circular(12),
              ),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Image.asset(
                  "assets/images/dunkbahce.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        // Dekoratif rozet.
        Positioned(
          top: 18,
          right: -14,
          child: Container(
            width: 78,
            height: 78,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.primaryRed,
              shape: BoxShape.circle,
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.local_cafe, color: Colors.white, size: 18),
                SizedBox(height: 2),
                Text(
                  "Taze\nKahve",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF3A0A0A),
            Color(0xFF5C1010),
            Color(0xFF8A1C1C),
          ],
        ),
      ),
      padding: EdgeInsets.fromLTRB(
        isMobile ? 20 : 80,
        isMobile ? 48 : 72,
        isMobile ? 20 : 80,
        0,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textColumn,
                const SizedBox(height: 40),
                SizedBox(width: 240, child: archPhoto),
                const SizedBox(height: 30),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 6, child: textColumn),
                const SizedBox(width: 40),
                Expanded(
                  flex: 4,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 320),
                    child: archPhoto,
                  ),
                ),
              ],
            ),
    );
  }
  Widget _buildFeatureStrip(BuildContext context, bool isMobile) {
    final items = const [
      (Icons.bolt, "Hızlı Dönüş", "Mesajlarınıza kısa sürede yanıt veriyoruz."),
      (Icons.coffee_maker, "Kahve Dostu Destek", "Tutkuyla hazırlanmış öneriler."),
      (Icons.favorite_border, "Sıcak Karşılama", "Her zaman kapımız açık."),
      (Icons.pets, "Evcil Hayvan Dostu", "Patili dostlarınızla gelebilirsiniz."),
    ];

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 28 : 36,
      ),
      child: isMobile
          ? Column(
              children: [
                for (final item in items) ...[
                  _featureItem(context, item.$1, item.$2, item.$3),
                  const SizedBox(height: 20),
                ],
              ],
            )
          : Row(
              children: [
                for (final item in items)
                  Expanded(
                    child: _featureItem(context, item.$1, item.$2, item.$3),
                  ),
              ],
            ),
    );
  }

  Widget _featureItem(
    BuildContext context,
    IconData icon,
    String title,
    String desc,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primaryRed, size: 26),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: isDark ? Colors.white : AppColors.textDark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 12.5,
                  color: isDark ? Colors.white54 : Colors.grey,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // Müşteri yorumları — 3 kart, gerçek kullanıcı yorumları.
  // ============================================================
  Widget _buildTestimonials(BuildContext context, bool isMobile) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final testimonials = const [
      (
        "Kahve ve diğer tüm içecekleri çok başarılı. Servis ve "
            "hizmetinden oldukça memnunuz. Tatlı menüsünün de zamanla "
            "güncellenmesi ve zenginleştirilmesi de çok yerinde bir "
            "hamle oluyor.",
        "Cemre K.",
        "Müşteri",
      ),
      (
        "Hem ortamı, hem hizmeti, hem kahvesi hem de tatlıları güzel, "
            "çalışan arkadaşlar güler yüzlü, bi deneyin derim.",
        "Ahmet Ethem Y.",
        "Müşteri",
      ),
      (
        "Gebze'de gidilebilecek ve tavsiye edebileceğim nadir "
            "cafelerden. Benim için en önemlisi hayvan dostu bir cafe "
            "olması. Cafenin her köşesinde patili dostlarımızı "
            "düşünerek su kapları konmuş. Bir köpeğim var ve maalesef "
            "her yer kabul etmiyor. Burası evcil hayvanımla "
            "gidebileceğim, arkadaşlarımla kaliteli vakitler "
            "geçirebileceğim nezih bir mekan. Ayrıca sandviçleri "
            "gerçekten mükemmel. Kahvelerine zaten diyecek bir şey "
            "bulamıyorum efsane.",
        "Kumru A.",
        "Müşteri",
      ),
    ];

    Widget card((String, String, String) t) {
      return _TestimonialCard(text: t.$1, name: t.$2, role: t.$3);
    }

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 64,
      ),
      child: Column(
        children: [
          const Text(
            "MÜŞTERİLERİMİZ NE DİYOR",
            style: TextStyle(
              color: AppColors.primaryRed,
              fontWeight: FontWeight.bold,
              fontSize: 13,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Mutlu Müşterilerimiz",
            style: TextStyle(
              fontSize: isMobile ? 26 : 32,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textDark,
            ),
          ),
          const SizedBox(height: 36),
          isMobile
              ? Column(
                  children: [
                    for (final t in testimonials) ...[
                      card(t),
                      const SizedBox(height: 20),
                    ],
                  ],
                )
              : IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (final t in testimonials) ...[
                        Expanded(child: card(t)),
                        if (t != testimonials.last) const SizedBox(width: 20),
                      ],
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  // ============================================================
  // İletişim bilgileri + harita.
  // ============================================================
  Widget _buildContactSection(BuildContext context, bool isMobile) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final infoList = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildContactRow(
          context,
          icon: Icons.location_on,
          title: "Adres",
          value: _address,
          onTap: () async {
            await launchUrl(_mapsUri, mode: LaunchMode.externalApplication);
          },
        ),
        const SizedBox(height: 24),
        _buildContactRow(
          context,
          icon: Icons.phone,
          title: "Telefon",
          value: "0507 992 21 06",
          onTap: () async {
            final uri = Uri.parse("tel:$_phoneNumber");
            await launchUrl(uri);
          },
        ),
        const SizedBox(height: 24),
        _buildContactRow(
          context,
          icon: Icons.access_time,
          title: "Çalışma Saatleri",
          value: _hours,
        ),
      ],
    );

    final map = InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () async {
        await launchUrl(_mapsUri, mode: LaunchMode.externalApplication);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: isMobile ? 260 : 320,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset("assets/images/location.png", fit: BoxFit.cover),
              Positioned(
                bottom: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryRed,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.map, color: Colors.white, size: 16),
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
      ),
    );

    return Container(
      color: isDark ? Colors.black.withOpacity(0.15) : const Color(0xFFF7F3EE),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 64,
      ),
      child: isMobile
          ? Column(
              children: [
                infoList,
                const SizedBox(height: 28),
                map,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: infoList),
                const SizedBox(width: 40),
                Expanded(flex: 7, child: map),
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white54 : Colors.grey,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : AppColors.textDark,
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
}

// ============================================================
// Tek bir müşteri yorumu kartı. Metin belirli bir uzunluğu
// aşarsa kısaltılıp sonuna "…devamını gör" eklenir; tıklanınca
// yorumun tamamı açılır.
// ============================================================
class _TestimonialCard extends StatefulWidget {
  const _TestimonialCard({
    required this.text,
    required this.name,
    required this.role,
  });

  final String text;
  final String name;
  final String role;

  static const int _collapsedLength = 160;

  @override
  State<_TestimonialCard> createState() => _TestimonialCardState();
}

class _TestimonialCardState extends State<_TestimonialCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = MediaQuery.of(context).size.width < 700;

    final bool needsTruncation =
        widget.text.length > _TestimonialCard._collapsedLength;
    final String displayText = (!_expanded && needsTruncation)
        ? "${widget.text.substring(0, _TestimonialCard._collapsedLength).trimRight()}..."
        : widget.text;

    return Container(
      width: isMobile ? double.infinity : null,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black54 : Colors.black12,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.format_quote,
            color: AppColors.primaryRed,
            size: 28,
          ),
          const SizedBox(height: 12),
          Text(
            displayText,
            style: TextStyle(
              fontSize: 14,
              height: 1.6,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
          if (needsTruncation)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: InkWell(
                onTap: () => setState(() => _expanded = !_expanded),
                child: Text(
                  _expanded ? "gizle" : "devamını gör",
                  style: const TextStyle(
                    color: AppColors.primaryRed,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 20),
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primaryRed,
                child: Text(
                  widget.name.substring(0, 1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: isDark ? Colors.white : AppColors.textDark,
                    ),
                  ),
                  Text(
                    widget.role,
                    style: TextStyle(
                      fontSize: 11.5,
                      color: isDark ? Colors.white54 : Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
