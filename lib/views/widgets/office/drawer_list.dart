import 'package:flutter/material.dart';
import 'package:my_app_office/dialogs/logout_dialog.dart';
import 'package:my_app_office/route.dart';
import 'package:my_app_office/services/auth/auth_service.dart';

class OfficeDrawerList extends StatefulWidget {
  const OfficeDrawerList({super.key});

  @override
  State<OfficeDrawerList> createState() => _OfficeDrawerListState();
}

class _OfficeDrawerListState extends State<OfficeDrawerList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.dashboard,
            color: Colors.blueGrey,
          ),
          title: const Text(
            'Home',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            color: Colors.blueGrey,
          ),
          title: const Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, profileRoute);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.menu_book,
            color: Colors.blueGrey,
          ),
          title: const Text(
            'User Guide',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, addImageView);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.report,
            color: Colors.blueGrey,
          ),
          title: const Text(
            'About',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.share,
            color: Colors.blueGrey,
          ),
          title: const Text(
            'Share',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.star,
            color: Colors.blueGrey,
          ),
          title: const Text(
            'Rate Use',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.blueGrey,
          ),
          title: const Text(
            'Logout',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          onTap: () async {
            final shouldLogout = await showLogutDialog(context);

            if (shouldLogout) {
              await AuthService.firebase().logOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute,
                (route) => false,
              );
            }
          },
        ),
      ],
    );
  }
}
