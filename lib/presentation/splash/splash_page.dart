import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      context.go('/auth');
    });

    return Scaffold(
      body: Center(
        child: Text(
          "Swift AI",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
      ),
    );
  }
}