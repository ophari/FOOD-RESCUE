import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class AdminLayout extends StatefulWidget {
  final Widget child;
  const AdminLayout({super.key, required this.child});
  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  bool _isCollapsed = false;

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/admin/dashboard')) return 0;
    if (location.startsWith('/admin/users')) return 1;
    if (location.startsWith('/admin/sellers')) return 2;
    if (location.startsWith('/admin/food')) return 3;
    if (location.startsWith('/admin/claims')) return 4;
    if (location.startsWith('/admin/reports')) return 5;
    if (location.startsWith('/admin/notifications')) return 6;
    if (location.startsWith('/admin/settings')) return 7;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _getSelectedIndex(context);
    final width = MediaQuery.of(context).size.width;
    final isTablet = width < 1024;

    if (isTablet && !_isCollapsed) {
      _isCollapsed = true;
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          // Sidebar
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: _isCollapsed ? 72 : 260,
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                // Logo
                Container(
                  height: 70,
                  padding: EdgeInsets.symmetric(
                    horizontal: _isCollapsed ? 12 : 20,
                  ),
                  child: Row(
                    mainAxisAlignment: _isCollapsed
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'S1',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      if (!_isCollapsed) ...[
                        const SizedBox(width: 12),
                        const Text(
                          'SISA 1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          ' Admin',
                          style: TextStyle(color: Colors.white54, fontSize: 14),
                        ),
                      ],
                    ],
                  ),
                ),
                const Divider(color: Colors.white12, height: 1),
                const SizedBox(height: 12),
                // Menu Items
                _SidebarItem(
                  icon: Icons.dashboard_rounded,
                  label: 'Dashboard',
                  isSelected: selectedIndex == 0,
                  isCollapsed: _isCollapsed,
                  onTap: () => context.go('/admin/dashboard'),
                ),
                _SidebarItem(
                  icon: Icons.people_rounded,
                  label: 'Users',
                  isSelected: selectedIndex == 1,
                  isCollapsed: _isCollapsed,
                  onTap: () => context.go('/admin/users'),
                ),
                _SidebarItem(
                  icon: Icons.store_rounded,
                  label: 'Sellers',
                  isSelected: selectedIndex == 2,
                  isCollapsed: _isCollapsed,
                  onTap: () => context.go('/admin/sellers'),
                ),
                _SidebarItem(
                  icon: Icons.restaurant_rounded,
                  label: 'Food Moderation',
                  isSelected: selectedIndex == 3,
                  isCollapsed: _isCollapsed,
                  onTap: () => context.go('/admin/food'),
                ),
                _SidebarItem(
                  icon: Icons.receipt_long_rounded,
                  label: 'Claims',
                  isSelected: selectedIndex == 4,
                  isCollapsed: _isCollapsed,
                  onTap: () => context.go('/admin/claims'),
                ),
                _SidebarItem(
                  icon: Icons.bar_chart_rounded,
                  label: 'Reports',
                  isSelected: selectedIndex == 5,
                  isCollapsed: _isCollapsed,
                  onTap: () => context.go('/admin/reports'),
                ),
                _SidebarItem(
                  icon: Icons.notifications_rounded,
                  label: 'Notifications',
                  isSelected: selectedIndex == 6,
                  isCollapsed: _isCollapsed,
                  onTap: () => context.go('/admin/notifications'),
                  badge: 3,
                ),
                _SidebarItem(
                  icon: Icons.settings_rounded,
                  label: 'Settings',
                  isSelected: selectedIndex == 7,
                  isCollapsed: _isCollapsed,
                  onTap: () => context.go('/admin/settings'),
                ),
                const Spacer(),
                // Collapse toggle
                InkWell(
                  onTap: () => setState(() => _isCollapsed = !_isCollapsed),
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: _isCollapsed
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.end,
                      children: [
                        Icon(
                          _isCollapsed
                              ? Icons.chevron_right_rounded
                              : Icons.chevron_left_rounded,
                          color: Colors.white54,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          // Content
          Expanded(
            child: Column(
              children: [
                // Top bar
                Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.search_rounded,
                          color: AppColors.textSecondary,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      Stack(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.notifications_outlined,
                              color: AppColors.textSecondary,
                            ),
                            onPressed: () {},
                          ),
                          Positioned(
                            right: 8,
                            top: 8,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: AppColors.error,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            'A',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Admin',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                // Page content
                Expanded(child: widget.child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final bool isCollapsed;
  final VoidCallback onTap;
  final int badge;
  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.isCollapsed,
    required this.onTap,
    this.badge = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isCollapsed ? 8 : 12,
        vertical: 2,
      ),
      child: Material(
        color: isSelected
            ? AppColors.primary.withValues(alpha: 0.15)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 46,
            padding: EdgeInsets.symmetric(horizontal: isCollapsed ? 0 : 14),
            child: Row(
              mainAxisAlignment: isCollapsed
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: isSelected ? AppColors.primary : Colors.white54,
                ),
                if (!isCollapsed) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: isSelected ? AppColors.primary : Colors.white70,
                      ),
                    ),
                  ),
                  if (badge > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '$badge',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
