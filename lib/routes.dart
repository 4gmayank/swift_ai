import 'package:go_router/go_router.dart';
import 'presentation/auth/pages/auth_page.dart';
import 'presentation/splash/splash_page.dart';
import 'presentation/home/pages/home_page.dart';
import 'presentation/chat/pages/chat_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashPage()),
    GoRoute(path: '/auth', builder: (context, state) => AuthPage()),
    GoRoute(path: '/home', builder: (context, state) => HomePage()),
    GoRoute(
      path: '/chat/:title',
      builder: (context, state) {
        final title = state.pathParameters['title']!;
        return ChatPage(chatTitle: title);
      },
    ),
  ],
);
