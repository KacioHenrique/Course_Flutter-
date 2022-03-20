import 'package:course_alura_flutter/screens/dashboard/dash_board_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF820AD1),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF820AD1), ),
      ),
    );
  }
}
