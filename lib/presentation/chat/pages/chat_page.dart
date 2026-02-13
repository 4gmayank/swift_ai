import 'package:flutter/material.dart';
import '../widgets/message_bubble.dart';
import '../widgets/chat_input_field.dart';
import '../widgets/typing_indicator.dart';
import 'dart:async';

class ChatPage extends StatefulWidget {
  final String chatTitle;
  ChatPage({required this.chatTitle});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Map<String, String>> messages = [
    {"role": "assistant", "content": "Hello! I am Swift AI."}
  ];
  bool isTyping = false;

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      messages.add({"role": "user", "content": text});
      isTyping = true;
    });

    simulateAIResponse((chunk) {
      setState(() {
        messages.add({"role": "assistant", "content": chunk});
        isTyping = false;
      });
    });
  }

  Future<void> simulateAIResponse(Function(String) onChunk) async {
    final chunks = ["Thinking", "...", "Here is my response!"];
    for (var chunk in chunks) {
      await Future.delayed(Duration(milliseconds: 400));
      onChunk(chunk);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.chatTitle)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (_, index) => MessageBubble(
                  role: messages[index]["role"]!,
                  content: messages[index]["content"]!),
            ),
          ),
          TypingIndicator(),
          ChatInputField(onSend: sendMessage),
        ],
      ),
    );
  }
}
