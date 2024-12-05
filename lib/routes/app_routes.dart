import 'package:get/get.dart';
import '../onboarding/view/onboarding_view.dart';
import '../dashboard/view/dashboard_view.dart';
import '../productivity/view/productivity_view.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String dashboard = '/dashboard';
  static const String productivity = '/productivity';

  static final routes = [
    GetPage(name: onboarding, page: () => const OnboardingView()),
    GetPage(name: dashboard, page: () => const DashboardView()),
    GetPage(name: productivity, page: () => const ProductivityView()),
  ];
}
