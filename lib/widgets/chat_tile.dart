import 'package:a1b2c3/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String chatId;
  final String lastMessage;
  final DateTime timestamp;
  final Map<String, dynamic> receiverData;

  const ChatTile(
      {super.key,
      required this.chatId,
      required this.lastMessage,
      required this.timestamp,
      required this.receiverData});

  @override
  Widget build(BuildContext context) {
    return lastMessage != ""
        ? ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(receiverData['imageUrl']),
            ),
            title: Text(
              receiverData[''],
            ),
            subtitle: Text(lastMessage, maxLines: 2),
            trailing: Text(
              '${timestamp.hour}:${timestamp.minute}',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatScreen(
                            chatId: chatId,
                            receiverId: receiverData['uid'],
                          )));
            },
          )
        : Container();
  }
}
