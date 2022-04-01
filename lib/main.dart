import 'package:course_alura_flutter/screens/dashboard/dash_board_screen.dart';
import 'package:flutter/material.dart';
import 'components/BankAlertDialogAuth.dart';

void main() async {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: const Color(0xFF820AD1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF820AD1),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF9500F6),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF9500F6),
          ),
        ),
      ),
      home: DashboardScreen(),
    );
  }
}
