import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/models.dart';
import '../../screens/splash/splash_screen.dart';
import '../../screens/onboarding/onboarding_screen.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/auth/register_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/explore/explore_screen.dart';
import '../../screens/claim/my_claims_screen.dart';
import '../../screens/notification/notification_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/food_detail/food_detail_screen.dart';
import '../../screens/claim/claim_confirm_screen.dart';
import '../../screens/claim/claim_success_screen.dart';
import '../../screens/claim/claim_history_screen.dart';
import '../../widgets/main_scaffold.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
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
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
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
  ],
);
