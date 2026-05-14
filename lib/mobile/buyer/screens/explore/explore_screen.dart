import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/data/dummy/dummy_data.dart';
import 'package:flutter_application_1/shared/widgets/food_card.dart';
import 'package:flutter_application_1/shared/widgets/common_widgets.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedCategory = 0;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredFoods = DummyData.foods.where((food) {
      final matchesCategory =
          _selectedCategory == 0 ||
          food.category == DummyData.categories[_selectedCategory];
      final matchesSearch =
          _searchQuery.isEmpty ||
          food.name.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                children: [
                  Text(
                    'Explore ',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: 400.ms),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchBarWidget(
                onChanged: (v) => setState(() => _searchQuery = v),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: DummyData.categories.length,
                itemBuilder: (context, index) => CategoryChip(
                  label: DummyData.categories[index],
                  emoji: DummyData.categoryIcons[index],
                  isSelected: _selectedCategory == index,
                  onTap: () => setState(() => _selectedCategory = index),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  Text(
                    '${filteredFoods.length} makanan ditemukan',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: filteredFoods.isEmpty
                  ? const EmptyStateWidget(
                      icon: Icons.search_off_rounded,
                      title: 'Tidak Ada Hasil',
                      subtitle: 'Coba kata kunci lain atau ubah filter',
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: filteredFoods.length,
                      itemBuilder: (context, index) {
                        final food = filteredFoods[index];
                        return FoodCard(
                          food: food,
                          isCompact: true,
                          onTap: () =>
                              context.push('/food/${food.id}', extra: food),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
