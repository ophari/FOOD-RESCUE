import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class ClaimMonitoringScreen extends StatelessWidget {
  const ClaimMonitoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Claim Monitoring',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Monitor semua aktivitas claim di platform',
            style: TextStyle(fontSize: 14, color: AppColors.textTertiary),
          ),
          const SizedBox(height: 24),

          // Summary Stats
          Row(
            children: [
              _ClaimStat(
                label: 'Active',
                value: '42',
                color: AppColors.primary,
                icon: Icons.receipt_long_rounded,
              ),
              const SizedBox(width: 16),
              _ClaimStat(
                label: 'Completed',
                value: '156',
                color: AppColors.success,
                icon: Icons.check_circle_rounded,
              ),
              const SizedBox(width: 16),
              _ClaimStat(
                label: 'Cancelled',
                value: '12',
                color: AppColors.error,
                icon: Icons.cancel_rounded,
              ),
              const SizedBox(width: 16),
              _ClaimStat(
                label: 'Suspicious',
                value: '3',
                color: AppColors.warning,
                icon: Icons.warning_rounded,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Claims Table
          Container(
            width: double.infinity,
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
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      const Text(
                        'All Claims',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 38,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list, size: 16),
                          label: const Text(
                            'Filter',
                            style: TextStyle(fontSize: 13),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: WidgetStateProperty.all(
                      AppColors.background,
                    ),
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Buyer',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Food',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Seller',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Status',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Time',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Action',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                    rows: [
                      _buildRow(
                        'Ahmad Rizki',
                        'Nasi Gudeg',
                        'Warung Bu Sari',
                        'Active',
                        '30m ago',
                      ),
                      _buildRow(
                        'Siti N.',
                        'Roti Gandum',
                        'Bakery Sehat',
                        'Completed',
                        '2h ago',
                      ),
                      _buildRow(
                        'Budi S.',
                        'Sayur Asem',
                        'Warteg Barokah',
                        'Completed',
                        '3h ago',
                      ),
                      _buildRow(
                        'Dewi L.',
                        'Buah Potong',
                        'Toko Buah',
                        'Cancelled',
                        '5h ago',
                      ),
                      _buildRow(
                        'Adi P.',
                        'Ayam Goreng',
                        'Catering Lezat',
                        'Suspicious',
                        '1d ago',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildRow(
    String buyer,
    String food,
    String seller,
    String status,
    String time,
  ) {
    final color = switch (status) {
      'Active' => AppColors.primary,
      'Completed' => AppColors.success,
      'Cancelled' => AppColors.error,
      'Suspicious' => AppColors.warning,
      _ => AppColors.textTertiary,
    };
    return DataRow(
      cells: [
        DataCell(
          Text(buyer, style: const TextStyle(fontWeight: FontWeight.w500)),
        ),
        DataCell(Text(food, style: const TextStyle(fontSize: 13))),
        DataCell(
          Text(
            seller,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),
        ),
        DataCell(
          Text(
            time,
            style: const TextStyle(fontSize: 12, color: AppColors.textTertiary),
          ),
        ),
        DataCell(
          IconButton(
            icon: const Icon(Icons.visibility_rounded, size: 18),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class _ClaimStat extends StatelessWidget {
  final String label, value;
  final Color color;
  final IconData icon;
  const _ClaimStat({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
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
