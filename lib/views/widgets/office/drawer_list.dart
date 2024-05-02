import 'package:flutter/material.dart';
import 'package:my_app_office/route.dart';

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
            color: Colors.red,
          ),
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            color: Colors.red,
          ),
          title: const Text('Profile'),
          onTap: () {
            Navigator.pushNamed(context, profileRoute);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.menu_book,
            color: Colors.red,
          ),
          title: const Text('User Guide'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.report,
            color: Colors.red,
          ),
          title: const Text('About'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.share,
            color: Colors.red,
          ),
          title: const Text('Share'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.star,
            color: Colors.red,
          ),
          title: const Text('Rate Use'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.red,
          ),
          title: const Text('Logout'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
