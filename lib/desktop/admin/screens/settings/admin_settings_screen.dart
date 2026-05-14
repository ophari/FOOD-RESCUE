import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class AdminSettingsScreen extends StatefulWidget {
  const AdminSettingsScreen({super.key});
  @override
  State<AdminSettingsScreen> createState() => _AdminSettingsScreenState();
}

class _AdminSettingsScreenState extends State<AdminSettingsScreen> {
  bool _maintenanceMode = false;
  bool _emailNotifications = true;
  bool _autoApprove = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Settings',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Platform configuration',
            style: TextStyle(fontSize: 14, color: AppColors.textTertiary),
          ),
          const SizedBox(height: 24),

          // Platform Settings
          _SettingsSection(
            title: 'Platform',
            children: [
              _ToggleSetting(
                label: 'Maintenance Mode',
                subtitle: 'Nonaktifkan platform sementara untuk maintenance',
                value: _maintenanceMode,
                onChanged: (v) => setState(() => _maintenanceMode = v),
              ),
              _ToggleSetting(
                label: 'Auto-Approve Food',
                subtitle: 'Otomatis setujui posting makanan tanpa moderasi',
                value: _autoApprove,
                onChanged: (v) => setState(() => _autoApprove = v),
              ),
            ],
          ),
          const SizedBox(height: 20),

          _SettingsSection(
            title: 'Notifications',
            children: [
              _ToggleSetting(
                label: 'Email Notifications',
                subtitle: 'Kirim notifikasi via email ke admin',
                value: _emailNotifications,
                onChanged: (v) => setState(() => _emailNotifications = v),
              ),
            ],
          ),
          const SizedBox(height: 20),

          _SettingsSection(
            title: 'Role Permissions',
            children: [
              _SettingItem(
                icon: Icons.people_rounded,
                label: 'Buyer Permissions',
                subtitle: 'Manage buyer access and limits',
              ),
              _SettingItem(
                icon: Icons.store_rounded,
                label: 'Seller Permissions',
                subtitle: 'Manage seller access and limits',
              ),
              _SettingItem(
                icon: Icons.admin_panel_settings_rounded,
                label: 'Admin Permissions',
                subtitle: 'Manage admin roles',
              ),
            ],
          ),
          const SizedBox(height: 20),

          _SettingsSection(
            title: 'System',
            children: [
              _SettingItem(
                icon: Icons.backup_rounded,
                label: 'Backup Data',
                subtitle: 'Last backup: 2 hours ago',
              ),
              _SettingItem(
                icon: Icons.delete_sweep_rounded,
                label: 'Clear Cache',
                subtitle: 'Free up storage space',
              ),
              _SettingItem(
                icon: Icons.info_outline_rounded,
                label: 'System Info',
                subtitle: 'Version 1.2.0 - Flutter',
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SettingsSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class _ToggleSetting extends StatelessWidget {
  final String label, subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  const _ToggleSetting({
    required this.label,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  final IconData icon;
  final String label, subtitle;
  const _SettingItem({
    required this.icon,
    required this.label,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Icon(icon, size: 22, color: AppColors.textSecondary),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textTertiary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
