//import 'package:calendarx/firebase_options.dart';
import 'package:calendarx/screens/home_page.dart';
import 'package:calendarx/widgets/bottom_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Goals extends StatefulWidget {
  const Goals({
    Key? key,
  }) : super(key: key);

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  // int currentIndex = 0;
  final screens = [
    const MyHomePage(),
    const Goals(),
  ];

  final controller = TextEditingController();
  final userID = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goals:'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection(
                  'users') // obsługa wielu użytkowników po zalogowaniu każdy ma inne dane
              .doc(userID)
              .collection('categories')
              .add(
            {
              'title': controller.text,
            },
          );
          controller.clear();
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavBar(),
      body: StreamBuilderFire(controller: controller),
    );
  }
}

class StreamBuilderFire extends StatelessWidget {
  StreamBuilderFire({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final userID = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(
              'users') // obsługa wielu użytkowników po zalogowaniu każdy ma inne dane
          .doc(userID)
          .collection('categories')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Unexpected error has occurred');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Please wait, loading the data');
        }

        final documents = snapshot.data!.docs;

        return ListView(
          children: [
            const SizedBox(height: 10),
            for (final document in documents) ...[
              Dismissible(
                  key: ValueKey(document.id),
                  onDismissed: (_) {
                    FirebaseFirestore.instance
                        .collection(
                            'users') // obsługa wielu użytkowników po zalogowaniu każdy ma inne dane
                        .doc(userID)
                        .collection('categories')
                        .doc(document.id)
                        .delete();
                  },
                  child: CategoryWidget(document['title'])),
            ],
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(7),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(80),
        ),
      ),
      child: Text(
        (title),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
