class Menssage {
  final String text;
  final MessageType type;
  final FromWho from;

  Menssage({
    required this.text,
    required this.type,
    required this.from,
  });
}

enum MessageType {
  message,
  image,
}

enum FromWho { me, other }
