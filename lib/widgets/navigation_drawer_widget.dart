import 'package:calendarx/features/auth/pages/user_profile.dart';
import 'package:calendarx/screens/achievements.dart';
import 'package:calendarx/screens/goals.dart';
import 'package:calendarx/screens/home_page.dart';
import 'package:calendarx/screens/index1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:kalendar2/DemoAppDisplayEvent/DemoApp.dart';
import 'package:calendarx/widgets/user_page.dart';
import 'package:flutterfire_ui/auth.dart';
// import 'package:kalendar2/achievements.dart';
// import 'package:kalendar2/equipment.dart';
// import 'package:kalendar2/goals.dart';
// import 'package:kalendar2/homepage.dart';
// import 'package:kalendar2/stats.dart';
// import 'package:kalendar2/training_presets.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 10);

  @override
  Widget build(BuildContext context) {
    final name = FirebaseAuth.instance.currentUser!.displayName;
    final email = FirebaseAuth.instance.currentUser?.email;
    // final urlImage =
    //     'https://icons-for-free.com/iconfiles/png/512/avatar+human+male+man+men+people+person+profile+user+users-1320196163635839021.png';

    //'assets/images/profile.png';
    //https://icons-for-free.com/iconfiles/png/512/avatar+human+male+man+men+people+person+profile+user+users-1320196163635839021.png
    //https://www.seekpng.com/png/detail/72-729700_account-avatar-face-head-person-profile-user-comments.png

    return Drawer(
      child: Material(
        color: const Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          padding: padding,
          children: <Widget>[
            buildHeader(
              //  urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserProfile(),
                ),
              ),
            ),
            //const SizedBox(height: 10),
            buildMenuItem(
              text: 'Index',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            //const SizedBox(height: 10),
            buildMenuItem(
              text: 'Calendar',
              icon: Icons.calendar_month_rounded,
              onClicked: () => selectedItem(context, 1),
            ),
            //const SizedBox(height: 10),
            // buildMenuItem(
            //   text: 'Equipment (Shoes/bikes)',
            //   icon: Icons.inventory_2_outlined,
            //   onClicked: () => selectedItem(context, 2),
            // ),
            //const SizedBox(height: 10),
            // buildMenuItem(
            //   text: 'Routes / Training presets',
            //   icon: Icons.route,
            //   onClicked: () => selectedItem(context, 3),
            // ),
            //const SizedBox(height: 10),
            buildMenuItem(
              text: 'Goals',
              icon: Icons.radar_rounded,
              onClicked: () => selectedItem(context, 2),
            ),

            buildMenuItem(
              text: 'Achievements / records',
              icon: Icons.checklist_rounded,
              onClicked: () => selectedItem(context, 3),
            ),
            //const SizedBox(height: 16),

            //const SizedBox(height: 16),
            // buildMenuItem(
            //   text: 'Stats',
            //   icon: Icons.query_stats_rounded,
            //   onClicked: () => selectedItem(context, 6),
            // ),
            //const SizedBox(height: 16),
            Divider(thickness: 2, color: Colors.white),
            //const SizedBox(height: 16),
            // buildMenuItem(
            //   text: 'Calculators',
            //   icon: Icons.calculate_rounded,
            //   onClicked: () => selectedItem(context, 7),
            // ),
            // //const SizedBox(height: 10),
            // buildMenuItem(
            //   text: 'Data export',
            //   icon: Icons.import_export_outlined,
            //   onClicked: () => selectedItem(context, 8),
            // ),
            // //const SizedBox(height: 10),
            // buildMenuItem(
            //   text: 'Community (list of users)',
            //   icon: Icons.people,
            //   onClicked: () => selectedItem(context, 9),
            // ),
            // //const SizedBox(height: 10),
            // buildMenuItem(
            //   text: 'Favorites / following',
            //   icon: Icons.workspaces_outline,
            //   onClicked: () => selectedItem(context, 10),
            // ),
            //const SizedBox(height: 16),
            // Divider(thickness: 2, color: Colors.white),
            //const SizedBox(height: 16),
            buildMenuItem(
              text: 'Profile',
              icon: Icons.person,
              onClicked: () => selectedItem(context, 4),
            ),
            //const SizedBox(height: 10),
            buildMenuItem(
              text: 'About',
              icon: Icons.info_rounded,
              onClicked: () => selectedItem(context, 12),
            ),
            const SizedBox(height: 200),
            buildMenuItem(
              text: 'Log out',
              icon: Icons.logout_outlined,
              onClicked: () => selectedItem(context, 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    // required String urlImage,
    required name,
    required email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/profile.png')
                  //NetworkImage(urlImage),
                  ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    email,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 16,
          //  fontWeight: FontWeight.bold,
        ),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop(); //przy powracaniu wstecz NavDrawer znika
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Index1(),
        ));
        break;

      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        ));
        break;

      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Goals(),
        ));
        break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Achievements(),
        ));
        break;

      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const UserProfile(),
        ));
        break;

      case 5:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => Calendar(),
        // ));
        break;

      case 6:
        break;

      // case 7:
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => const nazwastrony(),
      //   ));
      //   break;

      // case 8:
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => DemoApp(),
      //   ));
      //   break;

      // case 9:
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => DemoApp(),
      //   ));
      //   break;

      // case 10:
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => DemoApp(),
      //   ));
      //   break;

      // case 11:
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => DemoApp(),
      //   ));
      //   break;

      // case 12:
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => DemoApp(),
      //   ));
      //   break;

      case 13:
        FlutterFireUIAuth.signOut(
          context: context,
        );
        break;
    }
  }
}
