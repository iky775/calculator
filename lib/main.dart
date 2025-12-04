import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/calculator_provider.dart';
import 'screens/calculator_screen.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CalculatorProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modern Calculator',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.accent,
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}
