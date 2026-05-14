import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/data/dummy/admin_dummy_data.dart';
import 'package:flutter_application_1/data/models.dart';

class FoodModerationScreen extends StatefulWidget {
  const FoodModerationScreen({super.key});
  @override
  State<FoodModerationScreen> createState() => _FoodModerationScreenState();
}

class _FoodModerationScreenState extends State<FoodModerationScreen> {
  String _filter = 'all';

  List<ModerationItem> get _filtered {
    if (_filter == 'all') return AdminDummyData.moderationItems;
    final statusMap = {
      'pending': ModerationStatus.pending,
      'approved': ModerationStatus.approved,
      'rejected': ModerationStatus.rejected,
      'flagged': ModerationStatus.flagged,
    };
    return AdminDummyData.moderationItems
        .where((m) => m.status == statusMap[_filter])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Food Moderation',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Review dan moderasi postingan makanan',
            style: TextStyle(fontSize: 14, color: AppColors.textTertiary),
          ),
          const SizedBox(height: 20),

          // Filters
          Wrap(
            spacing: 8,
            children: [
              for (final f in [
                'all',
                'pending',
                'approved',
                'rejected',
                'flagged',
              ])
                ChoiceChip(
                  label: Text(
                    f == 'all' ? 'All' : f[0].toUpperCase() + f.substring(1),
                  ),
                  selected: _filter == f,
                  onSelected: (_) => setState(() => _filter = f),
                  selectedColor: AppColors.primary,
                  labelStyle: TextStyle(
                    color: _filter == f
                        ? Colors.white
                        : AppColors.textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  backgroundColor: AppColors.surface,
                  side: BorderSide(
                    color: _filter == f ? AppColors.primary : AppColors.border,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),

          // Cards
          ..._filtered.asMap().entries.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _ModerationCard(
                item: e.value,
              ).animate().fadeIn(duration: 400.ms, delay: (e.key * 80).ms),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModerationCard extends StatelessWidget {
  final ModerationItem item;
  const _ModerationCard({required this.item});

  Color get _statusColor => switch (item.status) {
    ModerationStatus.pending => AppColors.warning,
    ModerationStatus.approved => AppColors.success,
    ModerationStatus.rejected => AppColors.error,
    ModerationStatus.flagged => Colors.deepOrange,
  };

  String get _statusLabel => switch (item.status) {
    ModerationStatus.pending => 'Pending',
    ModerationStatus.approved => 'Approved',
    ModerationStatus.rejected => 'Rejected',
    ModerationStatus.flagged => 'Flagged',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              item.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 80,
                height: 80,
                color: AppColors.shimmerBase,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.foodName,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _statusColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        _statusLabel,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: _statusColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'by ${item.sellerName}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                if (item.reason != null) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          size: 14,
                          color: AppColors.error,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            item.reason!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.error,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (item.status == ModerationStatus.pending) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      SizedBox(
                        height: 34,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.check, size: 16),
                          label: const Text(
                            'Approve',
                            style: TextStyle(fontSize: 12),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 34,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.close, size: 16),
                          label: const Text(
                            'Reject',
                            style: TextStyle(fontSize: 12),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.error,
                            side: const BorderSide(color: AppColors.error),
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 34,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.flag, size: 16),
                          label: const Text(
                            'Flag',
                            style: TextStyle(fontSize: 12),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.deepOrange,
                            side: const BorderSide(color: Colors.deepOrange),
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
