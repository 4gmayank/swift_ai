import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_ai/presentation/login/login_page.dart';
import 'presentation/splash/splash_page.dart';
import 'presentation/home/pages/home_page.dart';
import 'presentation/chat/pages/chat_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashPage()),
    GoRoute(path: '/auth', builder: (context, state) => LoginPage()),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        final user = state.extra as User?;
        return HomePage(user: user);
      },
    ),
    GoRoute(
      path: '/chat/:title',
      builder: (context, state) {
        final title = state.pathParameters['title']!;
        return ChatPage(chatTitle: title);
      },
    ),
  ],
);
