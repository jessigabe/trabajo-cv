import 'package:flutter/material.dart';
import 'screens/cv_webview_screen.dart';

void main() {
  runApp(const JessicaCvApp());
}

class JessicaCvApp extends StatefulWidget {
  const JessicaCvApp({super.key});

  @override
  State<JessicaCvApp> createState() => _JessicaCvAppState();
}

class _JessicaCvAppState extends State<JessicaCvApp> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV Jessica Cuasquen',
      themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6853A6),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFA996E6),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: CvWebViewScreen(
        darkMode: _darkMode,
        onThemeChanged: (value) => setState(() => _darkMode = value),
      ),
    );
  }
}
