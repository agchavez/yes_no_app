import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Local imports
import 'package:app_yes_no/config/theme/app_theme.dart';
import 'package:app_yes_no/presentation/provider/chat_provider.dart';
import 'package:app_yes_no/presentation/screens/chat/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter',
        theme: AppTheme.darkTheme,
        home: const ChatScreen(),
      ),
    );
  }
}
