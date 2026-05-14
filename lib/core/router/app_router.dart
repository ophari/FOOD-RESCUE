import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/data/models.dart';

// Buyer Screens
import 'package:flutter_application_1/mobile/buyer/screens/splash/splash_screen.dart';
import 'package:flutter_application_1/mobile/buyer/screens/onboarding/onboarding_screen.dart';
import 'package:flutter_application_1/mobile/buyer/screens/auth/login_screen.dart';
import 'package:flutter_application_1/mobile/buyer/screens/auth/register_screen.dart';
import 'package:flutter_application_1/mobile/buyer/screens/home/home_screen.dart';
import 'package:flutter_application_1/mobile/buyer/screens/explore/explore_screen.dart';
import 'package:flutter_application_1/mobile/buyer/screens/claim/my_claims_screen.dart';
import 'package:flutter_application_1/mobile/buyer/screens/notification/notification_screen.dart';
import 'package:flutter_application_1/mobile/buyer/screens/profile/profile_screen.dart';
import 'package:flutter_application_1/mobile/buyer/screens/food_detail/food_detail_screen.dart';
import 'package:flutter_application_1/mobile/buyer/screens/claim/claim_confirm_screen.dart';
import 'package:flutter_application_1/mobile/buyer/screens/claim/claim_success_screen.dart';
import 'package:flutter_application_1/mobile/buyer/screens/claim/claim_history_screen.dart';
import 'package:flutter_application_1/mobile/buyer/widgets/main_scaffold.dart';

// Seller Screens
import 'package:flutter_application_1/mobile/seller/widgets/seller_scaffold.dart';
import 'package:flutter_application_1/mobile/seller/screens/dashboard/seller_dashboard_screen.dart';
import 'package:flutter_application_1/mobile/seller/screens/food/food_management_screen.dart';
import 'package:flutter_application_1/mobile/seller/screens/food/add_food_screen.dart';
import 'package:flutter_application_1/mobile/seller/screens/food/edit_food_screen.dart';
import 'package:flutter_application_1/mobile/seller/screens/claim/seller_claim_screen.dart';
import 'package:flutter_application_1/mobile/seller/screens/claim/qr_validation_screen.dart';
import 'package:flutter_application_1/mobile/seller/screens/notification/seller_notification_screen.dart';
import 'package:flutter_application_1/mobile/seller/screens/profile/seller_profile_screen.dart';

// Admin Screens
import 'package:flutter_application_1/desktop/admin/widgets/admin_layout.dart';
import 'package:flutter_application_1/desktop/admin/screens/dashboard/admin_dashboard_screen.dart';
import 'package:flutter_application_1/desktop/admin/screens/users/user_management_screen.dart';
import 'package:flutter_application_1/desktop/admin/screens/seller/seller_management_screen.dart';
import 'package:flutter_application_1/desktop/admin/screens/food/food_moderation_screen.dart';
import 'package:flutter_application_1/desktop/admin/screens/claim/claim_monitoring_screen.dart';
import 'package:flutter_application_1/desktop/admin/screens/report/report_screen.dart';
import 'package:flutter_application_1/desktop/admin/screens/notification/admin_notification_screen.dart';
import 'package:flutter_application_1/desktop/admin/screens/settings/admin_settings_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _buyerShellKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _sellerShellKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _adminShellKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    // =========================================================
    // AUTH ROUTES (shared)
    // =========================================================
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    // =========================================================
    // BUYER ROUTES
    // =========================================================
    ShellRoute(
      navigatorKey: _buyerShellKey,
      builder: (context, state, child) => MainScaffold(child: child),
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: '/explore',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ExploreScreen()),
        ),
        GoRoute(
          path: '/claims',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: MyClaimsScreen()),
        ),
        GoRoute(
          path: '/notifications',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: NotificationScreen()),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ProfileScreen()),
        ),
      ],
    ),
    GoRoute(
      path: '/food/:id',
      builder: (context, state) {
        final food = state.extra as FoodItem;
        return FoodDetailScreen(food: food);
      },
    ),
    GoRoute(
      path: '/claim/confirm',
      builder: (context, state) {
        final food = state.extra as FoodItem;
        return ClaimConfirmScreen(food: food);
      },
    ),
    GoRoute(
      path: '/claim/success',
      builder: (context, state) {
        final food = state.extra as FoodItem;
        return ClaimSuccessScreen(food: food);
      },
    ),
    GoRoute(
      path: '/claim/history',
      builder: (context, state) => const ClaimHistoryScreen(),
    ),

    // =========================================================
    // SELLER ROUTES
    // =========================================================
    ShellRoute(
      navigatorKey: _sellerShellKey,
      builder: (context, state, child) => SellerScaffold(child: child),
      routes: [
        GoRoute(
          path: '/seller/dashboard',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SellerDashboardScreen()),
        ),
        GoRoute(
          path: '/seller/food',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: FoodManagementScreen()),
        ),
        GoRoute(
          path: '/seller/claims',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SellerClaimScreen()),
        ),
        GoRoute(
          path: '/seller/notifications',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SellerNotificationScreen()),
        ),
        GoRoute(
          path: '/seller/profile',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SellerProfileScreen()),
        ),
      ],
    ),
    GoRoute(
      path: '/seller/food/add',
      builder: (context, state) => const AddFoodScreen(),
    ),
    GoRoute(
      path: '/seller/food/edit',
      builder: (context, state) {
        final food = state.extra as SellerFood;
        return EditFoodScreen(food: food);
      },
    ),
    GoRoute(
      path: '/seller/qr-scan',
      builder: (context, state) => const QrValidationScreen(),
    ),

    // =========================================================
    // ADMIN ROUTES
    // =========================================================
    ShellRoute(
      navigatorKey: _adminShellKey,
      builder: (context, state, child) => AdminLayout(child: child),
      routes: [
        GoRoute(
          path: '/admin/dashboard',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AdminDashboardScreen()),
        ),
        GoRoute(
          path: '/admin/users',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: UserManagementScreen()),
        ),
        GoRoute(
          path: '/admin/sellers',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SellerManagementScreen()),
        ),
        GoRoute(
          path: '/admin/food',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: FoodModerationScreen()),
        ),
        GoRoute(
          path: '/admin/claims',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ClaimMonitoringScreen()),
        ),
        GoRoute(
          path: '/admin/reports',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ReportScreen()),
        ),
        GoRoute(
          path: '/admin/notifications',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AdminNotificationScreen()),
        ),
        GoRoute(
          path: '/admin/settings',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AdminSettingsScreen()),
        ),
      ],
    ),
  ],
);
