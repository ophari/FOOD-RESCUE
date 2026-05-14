import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/data/dummy/seller_dummy_data.dart';
import 'package:flutter_application_1/data/models.dart';

class SellerNotificationScreen extends StatelessWidget {
  const SellerNotificationScreen({super.key});

  IconData _getIcon(SellerNotificationType type) => switch (type) {
    SellerNotificationType.newClaim => Icons.shopping_bag_rounded,
    SellerNotificationType.pickupReminder => Icons.schedule_rounded,
    SellerNotificationType.expiredFood => Icons.warning_rounded,
    SellerNotificationType.system => Icons.info_rounded,
  };

  Color _getColor(SellerNotificationType type) => switch (type) {
    SellerNotificationType.newClaim => AppColors.primary,
    SellerNotificationType.pickupReminder => AppColors.warning,
    SellerNotificationType.expiredFood => AppColors.error,
    SellerNotificationType.system => AppColors.info,
  };

  @override
  Widget build(BuildContext context) {
    final notifications = SellerDummyData.sellerNotifications;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Notifikasi'),
        backgroundColor: AppColors.surface,
        surfaceTintColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Tandai dibaca',
              style: TextStyle(fontSize: 13, color: AppColors.primary),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: notif.isRead
                    ? AppColors.surface
                    : AppColors.primarySurface.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: notif.isRead
                      ? AppColors.border.withValues(alpha: 0.5)
                      : AppColors.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: _getColor(notif.type).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getIcon(notif.type),
                      color: _getColor(notif.type),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                notif.title,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: notif.isRead
                                      ? FontWeight.w500
                                      : FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                            if (!notif.isRead)
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          notif.message,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _timeAgo(notif.createdAt),
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fadeIn(duration: 400.ms, delay: (index * 80).ms);
        },
      ),
    );
  }

  String _timeAgo(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 60) return '${diff.inMinutes} menit lalu';
    if (diff.inHours < 24) return '${diff.inHours} jam lalu';
    return '${diff.inDays} hari lalu';
  }
}
