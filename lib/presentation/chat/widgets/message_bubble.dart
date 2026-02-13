import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String role;
  final String content;

  MessageBubble({required this.role, required this.content});

  @override
  Widget build(BuildContext context) {
    bool isUser = role == "user";
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: isUser
              ? LinearGradient(colors: [Colors.indigo, Colors.blueAccent])
              : LinearGradient(colors: [Colors.grey.shade300, Colors.grey.shade200]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          content,
          style: TextStyle(color: isUser ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
