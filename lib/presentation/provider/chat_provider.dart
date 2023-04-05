import 'package:app_yes_no/domain/entities/menssage.dart';
import 'package:flutter/foundation.dart';

class ChatProvider extends ChangeNotifier {
  List<Menssage> menssageList = [
    Menssage(
      text: 'Hola, ¿Cómo estás?, ¿Qué tal el día?',
      type: MessageType.message,
      from: FromWho.other,
    ),
    Menssage(
      text: 'Hola, todo bien, ¿y tú?',
      type: MessageType.message,
      from: FromWho.me,
    ),
  ];
}
