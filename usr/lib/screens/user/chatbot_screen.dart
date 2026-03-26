// lib/screens/user/chatbot_screen.dart - AI assistant chatbot
import 'package:flutter/material.dart';
import '../../services/mock_chatbot_service.dart';
import '../../widgets/chat_bubble.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final _controller = TextEditingController();
  final _chatbot = MockChatbotService();
  final List<Map<String, dynamic>> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Assistant')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ChatBubble(message: msg['text'], isUser: msg['isUser']);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _controller, decoration: const InputDecoration(hintText: 'Ask about services...'))),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final userMsg = _controller.text;
                    if (userMsg.isNotEmpty) {
                      setState(() {
                        _messages.add({'text': userMsg, 'isUser': true});
                        _messages.add({'text': _chatbot.getReply(userMsg), 'isUser': false});
                      });
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}