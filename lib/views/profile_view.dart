import 'package:flutter/material.dart';
import 'package:my_app_office/services/auth/auth_service.dart';
import 'package:my_app_office/services/cloud_firebase/firebase_service.dart';
import 'package:my_app_office/services/model/employee.dart';
import 'package:my_app_office/views/widgets/profile/profile_about.dart';
import 'package:my_app_office/views/widgets/profile/profile_contact.dart';
import 'package:my_app_office/views/widgets/profile/profile_top.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final _employeeService = FirebaseCloudService();

  Future<Employee?> getUserDetails(BuildContext context) async {
    final user = AuthService.firebase().currentUser!;
    final email = user.email;

    return await _employeeService.getUserByEmail(email);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserDetails(context),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                final employee = snapshot.data!;
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.blueAccent,
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        const ProfileTop(),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 10, 10, 10)),
                            ),
                          ),
                        ),
                        ProfileAbout(
                          employee: employee,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const ProfileContact(),
                      ],
                    ),
                  ),
                );
              } else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

            default:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
          }
        });
  }
}
