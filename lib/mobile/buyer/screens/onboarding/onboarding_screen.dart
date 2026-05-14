import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  final _pages = [
    _OnboardingPageData(
      icon: Icons.volunteer_activism_rounded,
      emoji: '️',
      title: 'Selamatkan Makanan',
      description:
          'Jangan biarkan makanan terbuang sia-sia. Temukan makanan berlebih dari restoran dan toko di sekitarmu.',
      gradient: [AppColors.primary, const Color(0xFF059669)],
    ),
    _OnboardingPageData(
      icon: Icons.eco_rounded,
      emoji: '',
      title: 'Bantu Lingkungan',
      description:
          'Setiap makanan yang diselamatkan mengurangi limbah dan emisi karbon. Jadilah bagian dari perubahan!',
      gradient: [const Color(0xFF059669), const Color(0xFF047857)],
    ),
    _OnboardingPageData(
      icon: Icons.location_on_rounded,
      emoji: '',
      title: 'Claim Makanan Terdekat',
      description:
          'Temukan dan claim makanan gratis di dekatmu. Ambil di lokasi dan nikmati makanan yang telah diselamatkan.',
      gradient: [const Color(0xFF047857), AppColors.primaryDark],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextButton(
                  onPressed: () => context.go('/login'),
                  child: Text(
                    'Lewati',
                    style: GoogleFonts.poppins(
                      color: AppColors.textTertiary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            // Page view
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Illustration
                        Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: page.gradient,
                                ),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: page.gradient[0].withValues(
                                      alpha: 0.3,
                                    ),
                                    blurRadius: 30,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    page.icon,
                                    size: 64,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    page.emoji,
                                    style: const TextStyle(fontSize: 32),
                                  ),
                                ],
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 500.ms)
                            .scale(
                              begin: const Offset(0.8, 0.8),
                              end: const Offset(1, 1),
                              duration: 500.ms,
                              curve: Curves.easeOutBack,
                            ),
                        const SizedBox(height: 48),
                        Text(
                          page.title,
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
                        const SizedBox(height: 16),
                        Text(
                          page.description,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: AppColors.textSecondary,
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ).animate().fadeIn(delay: 400.ms, duration: 400.ms),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Bottom section
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: _pages.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 4,
                      spacing: 6,
                      activeDotColor: AppColors.primary,
                      dotColor: AppColors.border,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage < _pages.length - 1) {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          context.go('/login');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        _currentPage < _pages.length - 1
                            ? 'Lanjut'
                            : 'Mulai Sekarang',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPageData {
  final IconData icon;
  final String emoji;
  final String title;
  final String description;
  final List<Color> gradient;

  const _OnboardingPageData({
    required this.icon,
    required this.emoji,
    required this.title,
    required this.description,
    required this.gradient,
  });
}
