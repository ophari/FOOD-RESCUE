import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../data/dummy/dummy_data.dart';
import '../../widgets/food_card.dart';
import '../../widgets/common_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: _buildHeader().animate().fadeIn(duration: 400.ms),
            ),
            // Search bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SearchBarWidget(
                  readOnly: true,
                  onTap: () => context.go('/explore'),
                ),
              ).animate().fadeIn(delay: 100.ms, duration: 400.ms),
            ),
            // Map preview
            SliverToBoxAdapter(
              child: _buildMapPreview().animate().fadeIn(
                delay: 200.ms,
                duration: 400.ms,
              ),
            ),
            // Categories
            SliverToBoxAdapter(
              child: _buildCategories().animate().fadeIn(
                delay: 300.ms,
                duration: 400.ms,
              ),
            ),
            // Nearby foods
            SliverToBoxAdapter(
              child: _buildSectionTitle(
                'Makanan Terdekat ',
                'Lihat Semua',
              ).animate().fadeIn(delay: 400.ms, duration: 400.ms),
            ),
            SliverToBoxAdapter(
              child: _buildFoodCarousel().animate().fadeIn(
                delay: 500.ms,
                duration: 400.ms,
              ),
            ),
            // Recommended
            SliverToBoxAdapter(
              child: _buildSectionTitle(
                'Rekomendasi Untukmu ',
                'Lihat Semua',
              ).animate().fadeIn(delay: 600.ms, duration: 400.ms),
            ),
            SliverToBoxAdapter(
              child: _buildRecommendedList().animate().fadeIn(
                delay: 700.ms,
                duration: 400.ms,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDark],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                AppConstants.dummyUserName[0],
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, ${AppConstants.dummyUserName}! ',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      size: 14,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      AppConstants.dummyLocation,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Notification bell
          GestureDetector(
            onTap: () => context.go('/notifications'),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(
                    Icons.notifications_outlined,
                    color: AppColors.textPrimary,
                    size: 22,
                  ),
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
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

  Widget _buildMapPreview() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: GestureDetector(
        onTap: () => context.go('/explore'),
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primarySurface,
                AppColors.primary.withValues(alpha: 0.15),
              ],
            ),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
          ),
          child: Stack(
            children: [
              // Map-like pattern
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(19),
                  child: CustomPaint(painter: _MapPatternPainter()),
                ),
              ),
              // Food markers
              Positioned(top: 40, left: 60, child: _buildMapMarker('', true)),
              Positioned(
                top: 60,
                right: 80,
                child: _buildMapMarker('', false),
              ),
              Positioned(
                bottom: 50,
                left: 120,
                child: _buildMapMarker('', false),
              ),
              Positioned(
                top: 80,
                left: 180,
                child: _buildMapMarker('', true),
              ),
              // Center pin (user)
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.person_pin_circle_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              // Bottom label
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.95),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.map_rounded,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${DummyData.foods.length} makanan tersedia di sekitarmu',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.chevron_right_rounded,
                        size: 18,
                        color: AppColors.textTertiary,
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
  }

  Widget _buildMapMarker(String emoji, bool isPulsing) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Text(emoji, style: const TextStyle(fontSize: 16)),
    );
  }

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
      child: SizedBox(
        height: 48,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: DummyData.categories.length,
          itemBuilder: (context, index) {
            return CategoryChip(
              label: DummyData.categories[index],
              emoji: DummyData.categoryIcons[index],
              isSelected: _selectedCategory == index,
              onTap: () => setState(() => _selectedCategory = index),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, String action) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          GestureDetector(
            onTap: () => context.go('/explore'),
            child: Text(
              action,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodCarousel() {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: DummyData.foods.length,
        itemBuilder: (context, index) {
          final food = DummyData.foods[index];
          return FoodCard(
            food: food,
            onTap: () => context.push('/food/${food.id}', extra: food),
          );
        },
      ),
    );
  }

  Widget _buildRecommendedList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: DummyData.foods.take(3).map((food) {
          return FoodCard(
            food: food,
            isCompact: true,
            onTap: () => context.push('/food/${food.id}', extra: food),
          );
        }).toList(),
      ),
    );
  }
}

class _MapPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.06)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    // Draw grid lines
    for (double i = 0; i < size.width; i += 30) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += 30) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    // Draw some "roads"
    final roadPaint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawLine(
      Offset(0, size.height * 0.4),
      Offset(size.width, size.height * 0.5),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.3, 0),
      Offset(size.width * 0.4, size.height),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.7, 0),
      Offset(size.width * 0.6, size.height),
      roadPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
