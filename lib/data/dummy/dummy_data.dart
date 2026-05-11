import '../models.dart';

class DummyData {
  DummyData._();

  static final List<String> categories = [
    'Semua',
    'Nasi',
    'Roti & Kue',
    'Sayuran',
    'Buah',
    'Minuman',
    'Snack',
    'Lauk Pauk',
  ];

  static final List<String> categoryIcons = [
    '️',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  static final List<FoodItem> foods = [
    FoodItem(
      id: '1',
      name: 'Nasi Gudeg Komplit',
      description:
          'Nasi gudeg komplit dengan ayam, telur, dan sambal krecek. Masih segar dan hangat. Porsi besar cocok untuk makan siang.',
      storeName: 'Warung Bu Sari',
      storeAddress: 'Jl. Malioboro No. 45, Yogyakarta',
      category: 'Nasi',
      portions: 5,
      pickupTime: '12:00',
      pickupEndTime: '14:00',
      distance: 0.8,
      lat: -6.2100,
      lng: 106.8450,
      imageUrl:
          'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400',
      galleryUrls: [
        'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=400',
        'https://images.unsplash.com/photo-1547592180-85f173990554?w=400',
      ],
      isUrgent: true,
      createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
    FoodItem(
      id: '2',
      name: 'Roti Gandum Segar',
      description:
          'Roti gandum freshly baked, tersisa dari bakery hari ini. Masih sangat segar dan empuk.',
      storeName: 'Bakery Sehat',
      storeAddress: 'Jl. Sudirman No. 12, Jakarta',
      category: 'Roti & Kue',
      portions: 10,
      pickupTime: '16:00',
      pickupEndTime: '18:00',
      distance: 1.2,
      lat: -6.2080,
      lng: 106.8470,
      imageUrl:
          'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400',
      galleryUrls: [
        'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400',
      ],
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    FoodItem(
      id: '3',
      name: 'Sayur Asem Segar',
      description:
          'Sayur asem rumahan dengan bahan segar. Porsi besar, cocok untuk keluarga.',
      storeName: 'Warteg Barokah',
      storeAddress: 'Jl. Gatot Subroto No. 78, Jakarta',
      category: 'Sayuran',
      portions: 3,
      pickupTime: '11:00',
      pickupEndTime: '13:00',
      distance: 2.1,
      lat: -6.2120,
      lng: 106.8430,
      imageUrl:
          'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=400',
      galleryUrls: [],
      isUrgent: true,
      createdAt: DateTime.now().subtract(const Duration(minutes: 45)),
    ),
    FoodItem(
      id: '4',
      name: 'Buah Potong Segar',
      description:
          'Aneka buah potong segar: semangka, melon, pepaya. Baru dipotong hari ini.',
      storeName: 'Toko Buah Makmur',
      storeAddress: 'Jl. Thamrin No. 33, Jakarta',
      category: 'Buah',
      portions: 8,
      pickupTime: '10:00',
      pickupEndTime: '15:00',
      distance: 0.5,
      lat: -6.2070,
      lng: 106.8460,
      imageUrl:
          'https://images.unsplash.com/photo-1619566636858-adf3ef46400b?w=400',
      galleryUrls: [],
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    FoodItem(
      id: '5',
      name: 'Ayam Goreng Kremes',
      description:
          'Ayam goreng kremes renyah, masih hangat. Tersisa dari pesanan catering.',
      storeName: 'Catering Lezat',
      storeAddress: 'Jl. Kemang Raya No. 56, Jakarta',
      category: 'Lauk Pauk',
      portions: 6,
      pickupTime: '13:00',
      pickupEndTime: '15:00',
      distance: 3.4,
      lat: -6.2150,
      lng: 106.8500,
      imageUrl:
          'https://images.unsplash.com/photo-1626645738196-c2a7c87a8f58?w=400',
      galleryUrls: [],
      createdAt: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
    ),
    FoodItem(
      id: '6',
      name: 'Es Teh Manis',
      description:
          'Es teh manis segar, tersisa dari event kantor. Disimpan dalam termos dingin.',
      storeName: 'Kantor ABC',
      storeAddress: 'Jl. HR Rasuna Said No. 10, Jakarta',
      category: 'Minuman',
      portions: 15,
      pickupTime: '14:00',
      pickupEndTime: '17:00',
      distance: 1.8,
      lat: -6.2095,
      lng: 106.8480,
      imageUrl:
          'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=400',
      galleryUrls: [],
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    ),
  ];

  static final List<ClaimItem> activeClaims = [
    ClaimItem(
      id: 'c1',
      food: foods[0],
      claimCode: 'SISA-2024-001',
      status: ClaimStatus.active,
      claimDate: DateTime.now().subtract(const Duration(hours: 1)),
    ),
  ];

  static final List<ClaimItem> completedClaims = [
    ClaimItem(
      id: 'c2',
      food: foods[1],
      claimCode: 'SISA-2024-002',
      status: ClaimStatus.completed,
      claimDate: DateTime.now().subtract(const Duration(days: 1)),
      pickupDate: DateTime.now().subtract(const Duration(hours: 20)),
      rating: 4.5,
      review: 'Roti masih sangat segar! Terima kasih.',
    ),
    ClaimItem(
      id: 'c3',
      food: foods[3],
      claimCode: 'SISA-2024-003',
      status: ClaimStatus.completed,
      claimDate: DateTime.now().subtract(const Duration(days: 2)),
      pickupDate: DateTime.now().subtract(const Duration(days: 1, hours: 22)),
      rating: 5.0,
      review: 'Buahnya segar banget, porsi juga banyak.',
    ),
    ClaimItem(
      id: 'c4',
      food: foods[4],
      claimCode: 'SISA-2024-004',
      status: ClaimStatus.cancelled,
      claimDate: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

  static final List<NotificationItem> notifications = [
    NotificationItem(
      id: 'n1',
      title: 'Claim Berhasil! ',
      message:
          'Kamu berhasil claim Nasi Gudeg Komplit. Ambil sebelum jam 14:00.',
      type: NotificationType.claim,
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    NotificationItem(
      id: 'n2',
      title: 'Jangan Lupa Pickup! ⏰',
      message:
          'Sisa 1 jam untuk mengambil Nasi Gudeg Komplit di Warung Bu Sari.',
      type: NotificationType.reminder,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    NotificationItem(
      id: 'n3',
      title: 'Makanan Baru di Sekitarmu ',
      message: '3 makanan baru tersedia dalam radius 2 km dari lokasimu.',
      type: NotificationType.newFood,
      isRead: true,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    NotificationItem(
      id: 'n4',
      title: 'Selamat Datang di SISA 1! ',
      message: 'Terima kasih sudah bergabung. Mari selamatkan makanan bersama!',
      type: NotificationType.system,
      isRead: true,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];
}
