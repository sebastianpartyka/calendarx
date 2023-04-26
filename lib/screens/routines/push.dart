import 'package:calendarx/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';

class Push extends StatelessWidget {
  const Push({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push:'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}