import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_ai/presentation/login/providers/login_controller.dart';
import 'package:swift_ai/presentation/login/widget/sign_in_button.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);

    ref.listen(loginControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (user) {
          if (user != null) {
            print(user.email);
            context.go('/home', extra: user);
          }
        },
        error: (error, _) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error.toString())));
        },
      );
    });

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.isLoading) const CircularProgressIndicator(),
              SizedBox(height: 50),
              Text(
                "Welcome to Swift AI",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              SignInButtons(
                onGuest: () async {
                   context.go('/home');
                },
                onGoogle: () {
                  ref.read(loginControllerProvider.notifier).signInWithGoogle();
                },
                onApple: () => context.go('/home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
