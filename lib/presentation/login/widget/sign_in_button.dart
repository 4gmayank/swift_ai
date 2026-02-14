import 'package:flutter/material.dart';

class SignInButtons extends StatelessWidget {
  final VoidCallback onGuest;
  final VoidCallback onGoogle;
  final VoidCallback onApple;

  const SignInButtons({super.key,
    required this.onGuest,
    required this.onGoogle,
    required this.onApple,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onGuest,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text("Continue as Guest"),
        ),
        SizedBox(height: 12),
        ElevatedButton(
          onPressed: onGoogle,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text("Sign in with Google"),
        ),
        SizedBox(height: 12),
        ElevatedButton(
          onPressed: onApple,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text("Sign in with Apple"),
        ),
      ],
    );
  }
}
