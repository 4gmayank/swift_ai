import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_ai/presentation/common/widgets/empty_widget.dart';

class HomePage extends StatelessWidget {
  final List<String> conversations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Chats"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => context.go('/auth'),
          )
        ],
      ),
      body: conversations.isEmpty
          ? EmptyStateWidget()
          : ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(conversations[index]),
          onTap: () => context.push('/chat/${conversations[index]}'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/chat/New Conversation'),
        child: Icon(Icons.add),
      ),
    );
  }
}
