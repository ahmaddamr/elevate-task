import 'package:elevate_task/modules/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ElevateTask());
}

class ElevateTask extends StatelessWidget {
  const ElevateTask({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
