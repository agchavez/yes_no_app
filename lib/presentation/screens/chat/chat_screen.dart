import 'package:app_yes_no/presentation/provider/chat_provider.dart';
import 'package:app_yes_no/presentation/widgets/chat/my_menssage_bubble.dart';
import 'package:app_yes_no/presentation/widgets/shared/menssage_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/menssage.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
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
              controller: chatProvider.scrollController,
              itemCount: chatProvider.menssageList.length,
              itemBuilder: (context, index) {
                final menssage = chatProvider.menssageList[index];
                return MyMessageBubble(
                  menssage: menssage,
                );
              },
            )),
            MenssageFielBox(
              onValue: (value) => chatProvider.addMenssage(Menssage(
                text: value,
                type: MessageType.message,
                from: FromWho.me,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
