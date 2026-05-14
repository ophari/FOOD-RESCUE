import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/data/dummy/admin_dummy_data.dart';
import 'package:flutter_application_1/data/models.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});
  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  String _searchQuery = '';
  String _roleFilter = 'all';

  List<UserAccount> get _filteredUsers {
    return AdminDummyData.users.where((u) {
      final matchesSearch =
          u.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          u.email.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesRole = _roleFilter == 'all' || u.role.name == _roleFilter;
      return matchesSearch && matchesRole;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'User Management',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${AdminDummyData.users.length} total users',
            style: const TextStyle(fontSize: 14, color: AppColors.textTertiary),
          ),
          const SizedBox(height: 20),

          // Search & Filters
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 46,
                  child: TextField(
                    onChanged: (v) => setState(() => _searchQuery = v),
                    decoration: InputDecoration(
                      hintText: 'Search users...',
                      prefixIcon: const Icon(Icons.search_rounded, size: 20),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                height: 46,
                child: DropdownButtonHideUnderline(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: DropdownButton<String>(
                      value: _roleFilter,
                      items: const [
                        DropdownMenuItem(
                          value: 'all',
                          child: Text('All Roles'),
                        ),
                        DropdownMenuItem(value: 'buyer', child: Text('Buyer')),
                        DropdownMenuItem(
                          value: 'seller',
                          child: Text('Seller'),
                        ),
                        DropdownMenuItem(value: 'admin', child: Text('Admin')),
                      ],
                      onChanged: (v) => setState(() => _roleFilter = v!),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Data Table
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.border.withValues(alpha: 0.5),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(AppColors.background),
                columns: const [
                  DataColumn(
                    label: Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Role',
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
                      'Verified',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Actions',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
                rows: _filteredUsers
                    .map(
                      (user) => DataRow(
                        cells: [
                          DataCell(
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: _roleColor(
                                    user.role,
                                  ).withValues(alpha: 0.1),
                                  child: Text(
                                    user.name[0],
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: _roleColor(user.role),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  user.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DataCell(
                            Text(
                              user.email,
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                          DataCell(_RoleBadge(role: user.role)),
                          DataCell(_StatusBadge(isActive: user.isActive)),
                          DataCell(
                            Icon(
                              user.isVerified
                                  ? Icons.verified_rounded
                                  : Icons.remove_circle_outline,
                              size: 18,
                              color: user.isVerified
                                  ? AppColors.success
                                  : AppColors.textTertiary,
                            ),
                          ),
                          DataCell(
                            PopupMenuButton<String>(
                              icon: const Icon(Icons.more_horiz, size: 20),
                              onSelected: (_) {},
                              itemBuilder: (_) => [
                                const PopupMenuItem(
                                  value: 'view',
                                  child: Text('View'),
                                ),
                                PopupMenuItem(
                                  value: 'toggle',
                                  child: Text(
                                    user.isActive ? 'Suspend' : 'Activate',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _roleColor(UserRole role) => switch (role) {
    UserRole.buyer => AppColors.info,
    UserRole.seller => AppColors.primary,
    UserRole.admin => AppColors.warning,
  };
}

class _RoleBadge extends StatelessWidget {
  final UserRole role;
  const _RoleBadge({required this.role});
  @override
  Widget build(BuildContext context) {
    final color = switch (role) {
      UserRole.buyer => AppColors.info,
      UserRole.seller => AppColors.primary,
      UserRole.admin => AppColors.warning,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        role.name,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final bool isActive;
  const _StatusBadge({required this.isActive});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: (isActive ? AppColors.success : AppColors.error).withValues(
          alpha: 0.1,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isActive ? 'Active' : 'Suspended',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: isActive ? AppColors.success : AppColors.error,
        ),
      ),
    );
  }
}
