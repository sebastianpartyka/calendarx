//import 'package:calendarx/firebase_options.dart';
import 'package:calendarx/screens/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';

// Firebase jest użyty tylko raz w Main i działa wszędzie
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions().currentPlatform,
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Goals(),
//     );
//   }
// }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goals:'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance.collection('categories').add(
            {
              'title': controller.text,
            },
          );
          controller.clear();
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        //  currentIndex: 1;
        //bottom navigation bar on scaffold
        color: Colors.blue,
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.calendar_month_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DemoApp()),
                // );
              },
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              icon: Icon(
                Icons.person_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const Profile()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.motion_photos_on_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const MorePage()),
                // );
                //const MorePage();
              },
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (index) => setState(() => currentIndex = index),
      //   backgroundColor: Colors.blue,
      //   selectedItemColor: Colors.white,
      //   iconSize: 30,
      //   selectedFontSize: 20,
      //   showUnselectedLabels: false,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.list_rounded),
      //         label: 'List',
      //         backgroundColor: Colors.white),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.Goals_month_sharp),
      //         label: 'Goals',
      //         backgroundColor: Colors.white),
      //   ],
      // ),
      body:
          //screens[currentIndex]
          StreamBuilderFire(controller: controller),
    );
  }
}

class StreamBuilderFire extends StatelessWidget {
  const StreamBuilderFire({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('categories').snapshots(),
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
