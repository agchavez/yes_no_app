import 'package:flutter/material.dart';

class MenssageFielBox extends StatefulWidget {
  const MenssageFielBox({super.key});

  @override
  _MenssageFielBoxState createState() => _MenssageFielBoxState();
}

class _MenssageFielBoxState extends State<MenssageFielBox> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    // Limpiamos el controlador de texto cuando el widget se elimine
    _textEditingController.dispose();
    super.dispose();
  }

  void _handleTextChanged(String text) {
    setState(() {
      // Actualizamos el estado del botón según el texto ingresado
      _isButtonEnabled = text.isNotEmpty;
    });
  }

  void _handleSendPressed() {
    if (_isButtonEnabled) {
      // Enviamos el mensaje o hacemos algo con el texto aquí
      print(_textEditingController.text);
      // Limpiamos el campo de texto después de enviar el mensaje
      _textEditingController.clear();
      setState(() {
        // Deshabilitamos el botón después de enviar el mensaje
        _isButtonEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              controller: _textEditingController,
              onChanged: _handleTextChanged,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Escribe un mensaje',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
              size: 30,
              color: Colors.blue,
            ),
            onPressed: _isButtonEnabled ? _handleSendPressed : null,
          ),
        ],
      ),
    );
  }
}
