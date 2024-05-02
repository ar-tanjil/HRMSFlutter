import 'package:flutter/material.dart';
import 'package:my_app_office/views/widgets/profile/profile_about.dart';
import 'package:my_app_office/views/widgets/profile/profile_contact.dart';
import 'package:my_app_office/views/widgets/profile/profile_top.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileTop(),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color.fromARGB(255, 10, 10, 10)),
                ),
              ),
            ),
            const ProfileAbout(),
            const SizedBox(
              height: 16,
            ),
            const ProfileContact(),
          ],
        ),
      ),
    );
  }
}
