import 'package:app_yes_no/presentation/widgets/chat/my_menssage_bubble.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://resources.premierleague.com/premierleague/photos/players/250x250/p14937.png'),
          ),
        ),
        title: const Text(
          'Cristiano Ronaldo',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.blue,
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return MyMessageBubble(
                  isMe: index % 2 == 0,
                  type: index % 3 == 0
                      ? MessageType.image
                      : MessageType.message, // Cambia el tipo de mensaje
                  message: index % 3 == 0 // Cambia el mensaje
                      ? 'https://yesno.wtf/assets/yes/8-2f93962e2ab24427df8589131da01a4d.gif'
                      : 'Hola, ¿Cómo estás?, ¿Qué tal el día?',
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
