import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/data/dummy/admin_dummy_data.dart';
import 'package:flutter_application_1/data/models.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dashboard Overview',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Ringkasan aktivitas platform SISA 1',
            style: TextStyle(fontSize: 14, color: AppColors.textTertiary),
          ),
          const SizedBox(height: 24),
          _buildStatsGrid(),
          const SizedBox(height: 28),
          _buildRecentActivity(),
          const SizedBox(height: 28),
          _buildModerationSummary(),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    final stats = AdminDummyData.stats;
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children:
          [
                _AdminStatCard(
                  icon: Icons.people_rounded,
                  label: 'Total Users',
                  value: '${stats.totalUsers}',
                  change: '+12%',
                  color: AppColors.info,
                ),
                _AdminStatCard(
                  icon: Icons.store_rounded,
                  label: 'Total Sellers',
                  value: '${stats.totalSellers}',
                  change: '+5%',
                  color: AppColors.primary,
                ),
                _AdminStatCard(
                  icon: Icons.restaurant_rounded,
                  label: 'Food Rescued',
                  value: '${stats.totalFoodRescued}',
                  change: '+23%',
                  color: AppColors.success,
                ),
                _AdminStatCard(
                  icon: Icons.receipt_long_rounded,
                  label: 'Active Claims',
                  value: '${stats.activeClaims}',
                  change: '-3%',
                  color: AppColors.warning,
                ),
                _AdminStatCard(
                  icon: Icons.pending_actions_rounded,
                  label: 'Pending Moderation',
                  value: '${stats.pendingModeration}',
                  change: '',
                  color: AppColors.error,
                ),
                _AdminStatCard(
                  icon: Icons.eco_rounded,
                  label: 'Waste Reduced (kg)',
                  value: '${stats.wasteReduction}',
                  change: '+18%',
                  color: Color(0xFF10B981),
                ),
              ]
              .asMap()
              .entries
              .map(
                (e) => e.value.animate().fadeIn(
                  duration: 400.ms,
                  delay: (e.key * 80).ms,
                ),
              )
              .toList(),
    );
  }

  Widget _buildRecentActivity() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Activity',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...AdminDummyData.activityLogs.map(
            (log) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _actionColor(log.action).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      _actionIcon(log.action),
                      color: _actionColor(log.action),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          log.description,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          _timeAgo(log.timestamp),
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: _roleColor(log.userRole).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      log.userRole.name,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: _roleColor(log.userRole),
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

  Widget _buildModerationSummary() {
    final pending = AdminDummyData.moderationItems
        .where((m) => m.status == ModerationStatus.pending)
        .toList();
    return Container(
      padding: const EdgeInsets.all(20),
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
              const Icon(
                Icons.warning_amber_rounded,
                color: AppColors.warning,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Pending Moderation',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${pending.length} items',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.warning,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...pending.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item.imageUrl,
                      width: 44,
                      height: 44,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 44,
                        height: 44,
                        color: AppColors.shimmerBase,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.foodName,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          'by ${item.sellerName}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.check_circle_rounded,
                          color: AppColors.success,
                          size: 22,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.cancel_rounded,
                          color: AppColors.error,
                          size: 22,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _actionIcon(String action) => switch (action) {
    'CLAIM' => Icons.shopping_bag_rounded,
    'POST_FOOD' => Icons.restaurant_rounded,
    'PICKUP' => Icons.local_shipping_rounded,
    'REGISTER' => Icons.person_add_rounded,
    'MODERATION' => Icons.verified_rounded,
    'SUSPEND' => Icons.block_rounded,
    _ => Icons.info_rounded,
  };

  Color _actionColor(String action) => switch (action) {
    'CLAIM' => AppColors.primary,
    'POST_FOOD' => AppColors.info,
    'PICKUP' => AppColors.success,
    'REGISTER' => AppColors.warning,
    'MODERATION' => AppColors.primary,
    'SUSPEND' => AppColors.error,
    _ => AppColors.textTertiary,
  };

  Color _roleColor(UserRole role) => switch (role) {
    UserRole.buyer => AppColors.info,
    UserRole.seller => AppColors.primary,
    UserRole.admin => AppColors.warning,
  };

  String _timeAgo(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}

class _AdminStatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String change;
  final Color color;
  const _AdminStatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.change,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                if (change.isNotEmpty)
                  Text(
                    change,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: change.startsWith('+')
                          ? AppColors.success
                          : AppColors.error,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
