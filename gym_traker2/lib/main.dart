import 'package:flutter/material.dart';
import 'screens/registro_usuario_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegistroUsuarioScreen(),
    );
  }
}
