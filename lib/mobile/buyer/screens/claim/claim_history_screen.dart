import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/data/dummy/dummy_data.dart';
import 'package:flutter_application_1/data/models.dart';

class ClaimHistoryScreen extends StatelessWidget {
  const ClaimHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allClaims = [...DummyData.activeClaims, ...DummyData.completedClaims];
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          'Riwayat Claim',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: allClaims.length,
        itemBuilder: (context, index) {
          final claim = allClaims[index];
          return _HistoryCard(claim: claim).animate().fadeIn(
            delay: Duration(milliseconds: index * 100),
            duration: 400.ms,
          );
        },
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final ClaimItem claim;
  const _HistoryCard({required this.claim});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline dot
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: claim.status == ClaimStatus.completed
                      ? AppColors.success
                      : claim.status == ClaimStatus.active
                      ? AppColors.primary
                      : AppColors.error,
                  shape: BoxShape.circle,
                ),
              ),
              Container(width: 2, height: 80, color: AppColors.border),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    claim.food.name,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    claim.food.storeName,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textTertiary,
                    ),
                  ),
                  if (claim.review != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      '"${claim.review}"',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                  if (claim.rating != null) ...[
                    const SizedBox(height: 6),
                    Row(
                      children: List.generate(
                        5,
                        (i) => Icon(
                          i < claim.rating!.round()
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          size: 16,
                          color: AppColors.warning,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
