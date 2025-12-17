import 'package:flutter_test_app/pages/home.dart';
import 'package:flutter_test_app/pages/login_page.dart';
import 'package:flutter_test_app/pages/history_page.dart';
import 'package:flutter_test_app/pages/profile_page.dart';
import 'package:flutter_test_app/pages/register_page.dart';
import 'package:flutter_test_app/services/auth_service.dart';
import 'package:go_router/go_router.dart';

final authService = AuthService();

final appRouter = GoRouter(
  redirect: (context, state) async {
    final loggedIn = await authService.isLoggedIn();
    final loggingIn =
        state.uri.path == "/login" || state.uri.path == "/register";

    if (!loggedIn && !loggingIn) return "/login";
    if (loggedIn && loggingIn) return "/";

    return null;
  },
  routes: [
    GoRoute(path: '/login', builder: (_, _) => const LoginPage()),
    GoRoute(path: '/register', builder: (_, _) => const RegisterPage()),
    GoRoute(path: '/', builder: (_, _) => Home()),
    GoRoute(path: '/history', builder: (_, _) => HistoryPage()),
    GoRoute(path: '/profile', builder: (_, _) => ProfilePage()),
  ],
);
