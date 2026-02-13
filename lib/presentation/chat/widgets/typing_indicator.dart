import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TypingIndicator extends StatelessWidget {
  final bool isTyping;
  TypingIndicator({this.isTyping = true});

  @override
  Widget build(BuildContext context) {
    if (!isTyping) return SizedBox.shrink();

    final dots = List.generate(3, (index) => index);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: dots.map((index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ).animate(
            delay: Duration(milliseconds: 200 * index),
          ).scaleXY(
            begin: 0.5,
            end: 1.2,
            duration: 500.ms,
            curve: Curves.easeInOut,
          ).then().scaleXY(
            begin: 1.2,
            end: 0.5,
            duration: 500.ms,
            curve: Curves.easeInOut,
          ).animate();
        }).toList(),
      ),
    );
  }
}
