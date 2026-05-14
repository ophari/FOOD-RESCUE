import 'package:flutter_application_1/data/models.dart';

class SellerDummyData {
  SellerDummyData._();

  // =========================================================
  // SELLER STATS
  // =========================================================

  static const int totalFoodPosted = 24;
  static const int totalClaimed = 18;
  static const int pickupToday = 3;
  static const int activeFoodCount = 6;

  // =========================================================
  // SELLER FOOD LIST
  // =========================================================

  static final List<SellerFood> sellerFoods = [
    SellerFood(
      id: 'sf1',
      name: 'Nasi Gudeg Komplit',
      description:
          'Nasi gudeg komplit dengan ayam, telur, dan sambal krecek. Masih segar dan hangat.',
      category: 'Nasi',
      totalPortions: 10,
      claimedPortions: 5,
      pickupTime: '12:00',
      pickupEndTime: '14:00',
      imageUrl:
          'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400',
      status: FoodStatus.active,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    SellerFood(
      id: 'sf2',
      name: 'Roti Gandum Segar',
      description: 'Roti gandum freshly baked, tersisa dari bakery hari ini.',
      category: 'Roti & Kue',
      totalPortions: 15,
      claimedPortions: 15,
      pickupTime: '16:00',
      pickupEndTime: '18:00',
      imageUrl:
          'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400',
      status: FoodStatus.soldOut,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    SellerFood(
      id: 'sf3',
      name: 'Sayur Asem Segar',
      description: 'Sayur asem rumahan dengan bahan segar.',
      category: 'Sayuran',
      totalPortions: 8,
      claimedPortions: 3,
      pickupTime: '11:00',
      pickupEndTime: '13:00',
      imageUrl:
          'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=400',
      status: FoodStatus.active,
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    ),
    SellerFood(
      id: 'sf4',
      name: 'Buah Potong Segar',
      description: 'Aneka buah potong segar: semangka, melon, pepaya.',
      category: 'Buah',
      totalPortions: 12,
      claimedPortions: 0,
      pickupTime: '10:00',
      pickupEndTime: '15:00',
      imageUrl:
          'https://images.unsplash.com/photo-1619566636858-adf3ef46400b?w=400',
      status: FoodStatus.active,
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    SellerFood(
      id: 'sf5',
      name: 'Ayam Goreng Kremes',
      description: 'Ayam goreng kremes renyah, tersisa dari catering.',
      category: 'Lauk Pauk',
      totalPortions: 6,
      claimedPortions: 6,
      pickupTime: '13:00',
      pickupEndTime: '15:00',
      imageUrl:
          'https://images.unsplash.com/photo-1626645738196-c2a7c87a8f58?w=400',
      status: FoodStatus.expired,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    SellerFood(
      id: 'sf6',
      name: 'Kue Lapis Legit',
      description: 'Kue lapis legit homemade, tersisa dari pesanan.',
      category: 'Roti & Kue',
      totalPortions: 4,
      claimedPortions: 0,
      pickupTime: '09:00',
      pickupEndTime: '12:00',
      imageUrl:
          'https://images.unsplash.com/photo-1558301211-0d8c8ddee6ec?w=400',
      status: FoodStatus.draft,
      createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
  ];

  // =========================================================
  // SELLER CLAIMS
  // =========================================================

  static final List<SellerClaimItem> sellerClaims = [
    SellerClaimItem(
      id: 'sc1',
      buyerName: 'Ahmad Rizki',
      buyerPhone: '0812-3456-7890',
      foodName: 'Nasi Gudeg Komplit',
      foodImage:
          'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400',
      portions: 2,
      claimCode: 'SISA-2024-001',
      status: SellerClaimStatus.pending,
      claimDate: DateTime.now().subtract(const Duration(minutes: 30)),
      pickupTime: '12:00 - 14:00',
    ),
    SellerClaimItem(
      id: 'sc2',
      buyerName: 'Siti Nurhaliza',
      buyerPhone: '0857-1234-5678',
      foodName: 'Nasi Gudeg Komplit',
      foodImage:
          'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400',
      portions: 1,
      claimCode: 'SISA-2024-002',
      status: SellerClaimStatus.confirmed,
      claimDate: DateTime.now().subtract(const Duration(hours: 1)),
      pickupTime: '12:00 - 14:00',
    ),
    SellerClaimItem(
      id: 'sc3',
      buyerName: 'Budi Santoso',
      buyerPhone: '0878-9876-5432',
      foodName: 'Sayur Asem Segar',
      foodImage:
          'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=400',
      portions: 3,
      claimCode: 'SISA-2024-003',
      status: SellerClaimStatus.pickedUp,
      claimDate: DateTime.now().subtract(const Duration(hours: 3)),
      pickupTime: '11:00 - 13:00',
    ),
    SellerClaimItem(
      id: 'sc4',
      buyerName: 'Dewi Lestari',
      buyerPhone: '0899-1122-3344',
      foodName: 'Roti Gandum Segar',
      foodImage:
          'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400',
      portions: 5,
      claimCode: 'SISA-2024-004',
      status: SellerClaimStatus.noShow,
      claimDate: DateTime.now().subtract(const Duration(days: 1)),
      pickupTime: '16:00 - 18:00',
    ),
  ];

  // =========================================================
  // SELLER NOTIFICATIONS
  // =========================================================

  static final List<SellerNotificationItem> sellerNotifications = [
    SellerNotificationItem(
      id: 'sn1',
      title: 'Claim Baru Masuk!',
      message:
          'Ahmad Rizki mengklaim 2 porsi Nasi Gudeg Komplit. Pickup jam 12:00-14:00.',
      type: SellerNotificationType.newClaim,
      createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
    SellerNotificationItem(
      id: 'sn2',
      title: 'Pickup Reminder',
      message: 'Siti Nurhaliza akan pickup Nasi Gudeg Komplit dalam 30 menit.',
      type: SellerNotificationType.pickupReminder,
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    SellerNotificationItem(
      id: 'sn3',
      title: 'Makanan Expired',
      message:
          'Ayam Goreng Kremes sudah melewati batas waktu pickup. Status diubah ke expired.',
      type: SellerNotificationType.expiredFood,
      isRead: true,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    SellerNotificationItem(
      id: 'sn4',
      title: 'Selamat Bergabung!',
      message:
          'Terima kasih sudah menjadi seller di SISA 1. Mari selamatkan makanan bersama!',
      type: SellerNotificationType.system,
      isRead: true,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];
}
