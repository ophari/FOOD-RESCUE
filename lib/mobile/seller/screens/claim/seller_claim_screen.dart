import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/data/dummy/seller_dummy_data.dart';
import 'package:flutter_application_1/data/models.dart';

class SellerClaimScreen extends StatefulWidget {
  const SellerClaimScreen({super.key});
  @override
  State<SellerClaimScreen> createState() => _SellerClaimScreenState();
}

class _SellerClaimScreenState extends State<SellerClaimScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Claim Masuk'),
        backgroundColor: AppColors.surface,
        surfaceTintColor: Colors.transparent,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textTertiary,
          indicatorColor: AppColors.primary,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: const [
            Tab(text: 'Pending'),
            Tab(text: 'Dikonfirmasi'),
            Tab(text: 'Selesai'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _ClaimList(
            claims: SellerDummyData.sellerClaims
                .where((c) => c.status == SellerClaimStatus.pending)
                .toList(),
          ),
          _ClaimList(
            claims: SellerDummyData.sellerClaims
                .where((c) => c.status == SellerClaimStatus.confirmed)
                .toList(),
          ),
          _ClaimList(
            claims: SellerDummyData.sellerClaims
                .where(
                  (c) =>
                      c.status == SellerClaimStatus.pickedUp ||
                      c.status == SellerClaimStatus.noShow,
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ClaimList extends StatelessWidget {
  final List<SellerClaimItem> claims;
  const _ClaimList({required this.claims});

  @override
  Widget build(BuildContext context) {
    if (claims.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inbox_rounded, size: 48, color: AppColors.textTertiary),
            const SizedBox(height: 12),
            Text(
              'Belum ada claim',
              style: TextStyle(color: AppColors.textTertiary),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: claims.length,
      itemBuilder: (context, index) {
        final claim = claims[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _SellerClaimCard(claim: claim),
        ).animate().fadeIn(duration: 400.ms, delay: (index * 80).ms);
      },
    );
  }
}

class _SellerClaimCard extends StatelessWidget {
  final SellerClaimItem claim;
  const _SellerClaimCard({required this.claim});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  claim.foodImage,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 56,
                    height: 56,
                    color: AppColors.shimmerBase,
                    child: const Icon(
                      Icons.restaurant,
                      color: AppColors.textTertiary,
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
                      claim.buyerName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      claim.foodName,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${claim.portions} porsi - Pickup: ${claim.pickupTime}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primarySurface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.qr_code_rounded,
                      size: 14,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      claim.claimCode,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              if (claim.status == SellerClaimStatus.pending) ...[
                SizedBox(
                  height: 34,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      side: const BorderSide(color: AppColors.error),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Tolak', style: TextStyle(fontSize: 12)),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 34,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Konfirmasi',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
              if (claim.status == SellerClaimStatus.confirmed)
                SizedBox(
                  height: 34,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.qr_code_scanner_rounded, size: 16),
                    label: const Text(
                      'Validasi QR',
                      style: TextStyle(fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
