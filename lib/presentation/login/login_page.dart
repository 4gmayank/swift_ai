import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_ai/presentation/auth/widget/auth_button.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Swift AI",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              AuthButtons(
                onGuest: () => context.go('/home'),
                onGoogle: () => context.go('/home'),
                onApple: () => context.go('/home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
