import 'package:flutter/material.dart';

class MenssageFielBox extends StatelessWidget {
  const MenssageFielBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Escribe un mensaje',
        border: InputBorder.none,
      ),
      maxLines: null,
    );
  }
}
