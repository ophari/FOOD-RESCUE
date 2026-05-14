import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class AdminNotificationScreen extends StatelessWidget {
  const AdminNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      _NotifData(
        'Seller Baru Mendaftar',
        'Bakery Sehat mendaftar sebagai seller baru dan menunggu verifikasi.',
        Icons.store_rounded,
        AppColors.primary,
        '15m ago',
        false,
      ),
      _NotifData(
        'Food Flagged',
        'Rendang Sapi dari Catering Nusantara dilaporkan oleh 2 user.',
        Icons.flag_rounded,
        Colors.deepOrange,
        '1h ago',
        false,
      ),
      _NotifData(
        'Moderation Pending',
        '7 postingan makanan menunggu review.',
        Icons.pending_actions_rounded,
        AppColors.warning,
        '2h ago',
        false,
      ),
      _NotifData(
        'Pickup No-Show',
        'Dewi Lestari tidak mengambil Roti Gandum Segar.',
        Icons.person_off_rounded,
        AppColors.error,
        '5h ago',
        true,
      ),
      _NotifData(
        'Milestone Reached',
        'Platform telah menyelamatkan 3,000+ porsi makanan!',
        Icons.celebration_rounded,
        AppColors.success,
        '1d ago',
        true,
      ),
      _NotifData(
        'System Update',
        'Maintenance scheduled untuk Sabtu, 20:00-22:00 WIB.',
        Icons.settings_rounded,
        AppColors.info,
        '2d ago',
        true,
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notification Center',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'System notifications & alerts',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 38,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    'Mark All Read',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          ...notifications.map(
            (notif) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: notif.isRead
                      ? AppColors.surface
                      : AppColors.primarySurface.withValues(alpha: 0.3),
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
                        color: notif.color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(notif.icon, color: notif.color, size: 22),
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
                                  notif.title,
                                  style: TextStyle(
                                    fontSize: 15,
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
                          ),
                          const SizedBox(height: 6),
                          Text(
                            notif.time,
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
            ),
          ),
        ],
      ),
    );
  }
}

class _NotifData {
  final String title, message, time;
  final IconData icon;
  final Color color;
  final bool isRead;
  const _NotifData(
    this.title,
    this.message,
    this.icon,
    this.color,
    this.time,
    this.isRead,
  );
}
