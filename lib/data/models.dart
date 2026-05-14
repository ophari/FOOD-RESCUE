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

// =========================================================
// ROLE & AUTH MODELS
// =========================================================

enum UserRole { buyer, seller, admin }

class UserAccount {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? avatarUrl;
  final UserRole role;
  final bool isActive;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime? lastLogin;

  const UserAccount({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.avatarUrl,
    required this.role,
    this.isActive = true,
    this.isVerified = false,
    required this.createdAt,
    this.lastLogin,
  });
}

// =========================================================
// SELLER MODELS
// =========================================================

enum FoodStatus { active, soldOut, expired, draft }

class SellerFood {
  final String id;
  final String name;
  final String description;
  final String category;
  final int totalPortions;
  final int claimedPortions;
  final String pickupTime;
  final String pickupEndTime;
  final String imageUrl;
  final List<String> galleryUrls;
  final FoodStatus status;
  final DateTime createdAt;

  const SellerFood({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.totalPortions,
    this.claimedPortions = 0,
    required this.pickupTime,
    required this.pickupEndTime,
    required this.imageUrl,
    this.galleryUrls = const [],
    this.status = FoodStatus.active,
    required this.createdAt,
  });

  int get remainingPortions => totalPortions - claimedPortions;
  double get claimPercentage =>
      totalPortions > 0 ? claimedPortions / totalPortions : 0;
}

enum SellerClaimStatus { pending, confirmed, pickedUp, noShow }

class SellerClaimItem {
  final String id;
  final String buyerName;
  final String buyerPhone;
  final String foodName;
  final String foodImage;
  final int portions;
  final String claimCode;
  final SellerClaimStatus status;
  final DateTime claimDate;
  final String pickupTime;

  const SellerClaimItem({
    required this.id,
    required this.buyerName,
    required this.buyerPhone,
    required this.foodName,
    required this.foodImage,
    required this.portions,
    required this.claimCode,
    required this.status,
    required this.claimDate,
    required this.pickupTime,
  });
}

class SellerNotificationItem {
  final String id;
  final String title;
  final String message;
  final SellerNotificationType type;
  final bool isRead;
  final DateTime createdAt;

  const SellerNotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    this.isRead = false,
    required this.createdAt,
  });
}

enum SellerNotificationType { newClaim, pickupReminder, expiredFood, system }

// =========================================================
// ADMIN MODELS
// =========================================================

enum ModerationStatus { pending, approved, rejected, flagged }

class ModerationItem {
  final String id;
  final String foodName;
  final String sellerName;
  final String imageUrl;
  final ModerationStatus status;
  final String? reason;
  final DateTime submittedAt;

  const ModerationItem({
    required this.id,
    required this.foodName,
    required this.sellerName,
    required this.imageUrl,
    required this.status,
    this.reason,
    required this.submittedAt,
  });
}

class AdminStats {
  final int totalUsers;
  final int totalSellers;
  final int totalFoodRescued;
  final int activeClaims;
  final int pendingModeration;
  final double wasteReduction;

  const AdminStats({
    required this.totalUsers,
    required this.totalSellers,
    required this.totalFoodRescued,
    required this.activeClaims,
    required this.pendingModeration,
    required this.wasteReduction,
  });
}

class ActivityLog {
  final String id;
  final String action;
  final String description;
  final String userName;
  final UserRole userRole;
  final DateTime timestamp;

  const ActivityLog({
    required this.id,
    required this.action,
    required this.description,
    required this.userName,
    required this.userRole,
    required this.timestamp,
  });
}
