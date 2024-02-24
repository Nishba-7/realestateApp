import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];

  // Function to handle user messages and generate bot responses
  void _sendMessage(String message) {
    setState(() {
      _messages.add('User: $message');
      // Process user message and generate bot response
      String botResponse = generateBotResponse(message);
      _messages.add('Bot: $botResponse');
      _textController.clear();
    });
  }

  // Function to generate bot response based on user message
  String generateBotResponse(String message) {
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // To display the messages from bottom to top
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(hintText: 'Type a message'),
                    onSubmitted: _sendMessage,
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    String message = _textController.text.trim();
                    if (message.isNotEmpty) {
                      _sendMessage(message);
                    }
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
