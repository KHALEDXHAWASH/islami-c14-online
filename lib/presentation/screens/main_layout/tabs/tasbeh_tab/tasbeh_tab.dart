import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int _counter = 0;
  double _angle = 0;
  int _currentAskarIndex = 0;

  final List<String> _askar = [
    'سُبْحَانَ ٱللَّٰه',
    'ٱلْحَمْدُ لِلَّٰه',
    'ٱللَّٰهُ أَكْبَر'
  ];

  void _tapOnSebha() {
    setState(() {
      _angle -= 0.2;
      _counter++;
      if (_counter == 30) {
        _counter = 0;
        _currentAskarIndex = (_currentAskarIndex + 1) % _askar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/Background.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Image.asset(
                'assets/tlogo.png',
                height: size.height * 0.14,
              ),
              const SizedBox(height: 40),
              Text(
                'سَبِّحِ ٱسْمَ رَبِّكَ ٱلْأَعْلَىٰ',
                style: GoogleFonts.tajawal(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              GestureDetector(
                onTap: _tapOnSebha,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: _angle,
                      child: Image.asset(
                        "assets/Sebha.png",
                        width: size.width * 0.8,
                        height: size.height * 0.4,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _askar[_currentAskarIndex],
                          style: GoogleFonts.tajawal(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$_counter',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color(0xFF1B191A),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
