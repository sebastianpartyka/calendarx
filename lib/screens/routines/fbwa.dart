import 'package:calendarx/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';

class Fbwa extends StatelessWidget {
  const Fbwa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FBW A:'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      //   bottomNavigationBar: const BottomNavBar(),
      body: Center(
        child: Text(
          'Siema Heniu',
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}
