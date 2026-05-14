import 'package:flutter_application_1/data/models.dart';

class AdminDummyData {
  AdminDummyData._();

  // =========================================================
  // ADMIN STATS
  // =========================================================

  static const AdminStats stats = AdminStats(
    totalUsers: 1247,
    totalSellers: 89,
    totalFoodRescued: 3456,
    activeClaims: 42,
    pendingModeration: 7,
    wasteReduction: 2340.5,
  );

  // =========================================================
  // USER ACCOUNTS
  // =========================================================

  static final List<UserAccount> users = [
    UserAccount(
      id: 'u1',
      name: 'Ahmad Rizki',
      email: 'ahmad.rizki@email.com',
      phone: '0812-3456-7890',
      role: UserRole.buyer,
      isActive: true,
      isVerified: true,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      lastLogin: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    UserAccount(
      id: 'u2',
      name: 'Siti Nurhaliza',
      email: 'siti.nur@email.com',
      phone: '0857-1234-5678',
      role: UserRole.buyer,
      isActive: true,
      isVerified: true,
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
      lastLogin: DateTime.now().subtract(const Duration(days: 1)),
    ),
    UserAccount(
      id: 'u3',
      name: 'Budi Santoso',
      email: 'budi.s@email.com',
      phone: '0878-9876-5432',
      role: UserRole.buyer,
      isActive: false,
      isVerified: true,
      createdAt: DateTime.now().subtract(const Duration(days: 60)),
      lastLogin: DateTime.now().subtract(const Duration(days: 15)),
    ),
    UserAccount(
      id: 'u4',
      name: 'Warung Bu Sari',
      email: 'busari@email.com',
      phone: '0899-1122-3344',
      role: UserRole.seller,
      isActive: true,
      isVerified: true,
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
      lastLogin: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    UserAccount(
      id: 'u5',
      name: 'Bakery Sehat',
      email: 'bakerysehat@email.com',
      phone: '0811-2233-4455',
      role: UserRole.seller,
      isActive: true,
      isVerified: false,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    UserAccount(
      id: 'u6',
      name: 'Dewi Lestari',
      email: 'dewi.l@email.com',
      role: UserRole.buyer,
      isActive: true,
      isVerified: false,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    UserAccount(
      id: 'u7',
      name: 'Catering Lezat',
      email: 'cateringlzt@email.com',
      phone: '0822-5566-7788',
      role: UserRole.seller,
      isActive: true,
      isVerified: true,
      createdAt: DateTime.now().subtract(const Duration(days: 35)),
      lastLogin: DateTime.now().subtract(const Duration(hours: 8)),
    ),
    UserAccount(
      id: 'u8',
      name: 'Admin SISA 1',
      email: 'admin@sisa1.id',
      role: UserRole.admin,
      isActive: true,
      isVerified: true,
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
      lastLogin: DateTime.now(),
    ),
  ];

  // =========================================================
  // MODERATION ITEMS
  // =========================================================

  static final List<ModerationItem> moderationItems = [
    ModerationItem(
      id: 'm1',
      foodName: 'Sate Ayam Madura',
      sellerName: 'Warung Pak Jo',
      imageUrl:
          'https://images.unsplash.com/photo-1529563021893-cc83c992d75d?w=400',
      status: ModerationStatus.pending,
      submittedAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    ModerationItem(
      id: 'm2',
      foodName: 'Bakso Sapi Special',
      sellerName: 'Bakso Mas Eko',
      imageUrl:
          'https://images.unsplash.com/photo-1555126634-323283e090fa?w=400',
      status: ModerationStatus.pending,
      submittedAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    ModerationItem(
      id: 'm3',
      foodName: 'Nasi Padang',
      sellerName: 'RM Minang Jaya',
      imageUrl:
          'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=400',
      status: ModerationStatus.approved,
      submittedAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    ModerationItem(
      id: 'm4',
      foodName: 'Mie Goreng',
      sellerName: 'Warung Sederhana',
      imageUrl:
          'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=400',
      status: ModerationStatus.rejected,
      reason: 'Foto tidak jelas, deskripsi tidak lengkap',
      submittedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    ModerationItem(
      id: 'm5',
      foodName: 'Rendang Sapi',
      sellerName: 'Catering Nusantara',
      imageUrl:
          'https://images.unsplash.com/photo-1606491956689-2ea866880049?w=400',
      status: ModerationStatus.flagged,
      reason: 'Harga tidak wajar',
      submittedAt: DateTime.now().subtract(const Duration(hours: 8)),
    ),
  ];

  // =========================================================
  // ACTIVITY LOGS
  // =========================================================

  static final List<ActivityLog> activityLogs = [
    ActivityLog(
      id: 'al1',
      action: 'CLAIM',
      description: 'Ahmad Rizki mengklaim Nasi Gudeg Komplit',
      userName: 'Ahmad Rizki',
      userRole: UserRole.buyer,
      timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
    ),
    ActivityLog(
      id: 'al2',
      action: 'POST_FOOD',
      description: 'Warung Bu Sari memposting Nasi Gudeg Komplit',
      userName: 'Warung Bu Sari',
      userRole: UserRole.seller,
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    ActivityLog(
      id: 'al3',
      action: 'PICKUP',
      description: 'Budi Santoso pickup Sayur Asem Segar berhasil',
      userName: 'Budi Santoso',
      userRole: UserRole.buyer,
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    ActivityLog(
      id: 'al4',
      action: 'REGISTER',
      description: 'Bakery Sehat mendaftar sebagai seller baru',
      userName: 'Bakery Sehat',
      userRole: UserRole.seller,
      timestamp: DateTime.now().subtract(const Duration(hours: 4)),
    ),
    ActivityLog(
      id: 'al5',
      action: 'MODERATION',
      description: 'Admin menyetujui posting Nasi Padang',
      userName: 'Admin SISA 1',
      userRole: UserRole.admin,
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    ActivityLog(
      id: 'al6',
      action: 'SUSPEND',
      description: 'Admin menonaktifkan akun Budi Santoso',
      userName: 'Admin SISA 1',
      userRole: UserRole.admin,
      timestamp: DateTime.now().subtract(const Duration(hours: 8)),
    ),
  ];
}
