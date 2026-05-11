class FoodItem {
  final String id;
  final String name;
  final String description;
  final String storeName;
  final String storeAddress;
  final String category;
  final int portions;
  final String pickupTime;
  final String pickupEndTime;
  final double distance;
  final double lat;
  final double lng;
  final String imageUrl;
  final List<String> galleryUrls;
  final bool isUrgent;
  final DateTime createdAt;

  const FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.storeName,
    required this.storeAddress,
    required this.category,
    required this.portions,
    required this.pickupTime,
    required this.pickupEndTime,
    required this.distance,
    required this.lat,
    required this.lng,
    required this.imageUrl,
    this.galleryUrls = const [],
    this.isUrgent = false,
    required this.createdAt,
  });
}

class ClaimItem {
  final String id;
  final FoodItem food;
  final String claimCode;
  final ClaimStatus status;
  final DateTime claimDate;
  final DateTime? pickupDate;
  final double? rating;
  final String? review;

  const ClaimItem({
    required this.id,
    required this.food,
    required this.claimCode,
    required this.status,
    required this.claimDate,
    this.pickupDate,
    this.rating,
    this.review,
  });
}

enum ClaimStatus { active, completed, cancelled, expired }

class NotificationItem {
  final String id;
  final String title;
  final String message;
  final NotificationType type;
  final bool isRead;
  final DateTime createdAt;

  const NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    this.isRead = false,
    required this.createdAt,
  });
}

enum NotificationType { claim, reminder, newFood, system }
