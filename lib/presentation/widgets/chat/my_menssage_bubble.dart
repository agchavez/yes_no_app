import 'package:flutter/material.dart';

import '../../../domain/entities/menssage.dart';

class MyMessageBubble extends StatelessWidget {
  final Menssage menssage;
  const MyMessageBubble({
    Key? key,
    required this.menssage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: menssage.from == FromWho.other
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
            decoration: BoxDecoration(
              color: menssage.from == FromWho.other ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child:
                menssage.type == MessageType.image // Comprueba si es una imagen
                    ? _ImageChat(message: menssage.text)
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          menssage.text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}

class _ImageChat extends StatelessWidget {
  const _ImageChat({
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: NetworkImage(message),
          width: size.width * 0.6,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return SizedBox(
              width: size.width * 0.6,
              height: 150,
              child: Center(
                child: CircularProgressIndicator(
                  // ignore: unnecessary_null_comparison
                  value: loadingProgress == null
                      ? 0
                      : loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
