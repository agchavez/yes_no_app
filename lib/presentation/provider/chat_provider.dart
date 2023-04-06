import 'package:app_yes_no/domain/entities/menssage.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

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

  Future<void> addMenssage(Menssage menssage) async {
    menssageList.add(menssage);
    notifyListeners();
    moveScrollToEnd();
  }

  void moveScrollToEnd() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
