import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reports & Analytics',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Analitik dan laporan platform SISA 1',
            style: TextStyle(fontSize: 14, color: AppColors.textTertiary),
          ),
          const SizedBox(height: 24),

          // Summary Row
          Row(
            children: [
              _ReportCard(
                title: 'Total Rescued',
                value: '3,456 porsi',
                subtitle: 'All time',
                icon: Icons.restaurant_rounded,
                color: AppColors.primary,
              ),
              const SizedBox(width: 16),
              _ReportCard(
                title: 'Waste Reduced',
                value: '2,340.5 kg',
                subtitle: 'Estimated',
                icon: Icons.eco_rounded,
                color: AppColors.success,
              ),
              const SizedBox(width: 16),
              _ReportCard(
                title: 'Active Region',
                value: '12 kota',
                subtitle: 'Indonesia',
                icon: Icons.location_on_rounded,
                color: AppColors.info,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Chart Placeholder - Rescue Analytics
          _ChartPlaceholder(
            title: 'Food Rescue Trend',
            subtitle: 'Jumlah makanan yang diselamatkan per bulan',
            height: 280,
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: _ChartPlaceholder(
                  title: 'Kategori Makanan',
                  subtitle: 'Distribusi per kategori',
                  height: 240,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _ChartPlaceholder(
                  title: 'Aktif Per Jam',
                  subtitle: 'Puncak aktivitas harian',
                  height: 240,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Growth Table
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.border.withValues(alpha: 0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Growth Statistics',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),
                ...[
                  _GrowthRow(
                    label: 'New Users',
                    thisMonth: '234',
                    lastMonth: '198',
                    growth: '+18%',
                    isPositive: true,
                  ),
                  _GrowthRow(
                    label: 'New Sellers',
                    thisMonth: '12',
                    lastMonth: '8',
                    growth: '+50%',
                    isPositive: true,
                  ),
                  _GrowthRow(
                    label: 'Food Posted',
                    thisMonth: '456',
                    lastMonth: '389',
                    growth: '+17%',
                    isPositive: true,
                  ),
                  _GrowthRow(
                    label: 'Claims',
                    thisMonth: '312',
                    lastMonth: '340',
                    growth: '-8%',
                    isPositive: false,
                  ),
                  _GrowthRow(
                    label: 'Pickup Rate',
                    thisMonth: '87%',
                    lastMonth: '82%',
                    growth: '+5%',
                    isPositive: true,
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

class _ReportCard extends StatelessWidget {
  final String title, value, subtitle;
  final IconData icon;
  final Color color;
  const _ReportCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const Spacer(),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textTertiary,
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
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartPlaceholder extends StatelessWidget {
  final String title, subtitle;
  final double height;
  const _ChartPlaceholder({
    required this.title,
    required this.subtitle,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: AppColors.textTertiary),
          ),
          const Spacer(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.bar_chart_rounded,
                  size: 48,
                  color: AppColors.primary.withValues(alpha: 0.3),
                ),
                const SizedBox(height: 8),
                Text(
                  'Chart akan ditampilkan di sini',
                  style: TextStyle(fontSize: 13, color: AppColors.textTertiary),
                ),
                Text(
                  '(Memerlukan package chart)',
                  style: TextStyle(fontSize: 11, color: AppColors.textTertiary),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _GrowthRow extends StatelessWidget {
  final String label, thisMonth, lastMonth, growth;
  final bool isPositive;
  const _GrowthRow({
    required this.label,
    required this.thisMonth,
    required this.lastMonth,
    required this.growth,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              thisMonth,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              lastMonth,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textTertiary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              growth,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isPositive ? AppColors.success : AppColors.error,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
