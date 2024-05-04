import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app_office/services/auth/auth_service.dart';
import 'package:my_app_office/services/cloud_firebase/firebase_service.dart';
import 'package:my_app_office/services/model/employee.dart';

class OfficeDrawerHeader extends StatefulWidget {
  const OfficeDrawerHeader({super.key});

  @override
  State<OfficeDrawerHeader> createState() => _OfficeDrawerHeaderState();
}

class _OfficeDrawerHeaderState extends State<OfficeDrawerHeader> {
  late final _employeeService = FirebaseCloudService();

  Future<Employee?> getUserDetails(BuildContext context) async {
    final user = AuthService.firebase().currentUser!;
    final email = user.email;

    return await _employeeService.getUserByEmail(email);
  }

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blueAccent,
            Colors.blue,
            Colors.blueGrey,
          ],
        ),
      ),
      child: Center(
        child: Row(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 100, // Image radius
                  // backgroundImage: AssetImage('images/ashiqpic.png'),
                  // child: Image.asset('images/ashiq.png'),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: FutureBuilder(
                  future: getUserDetails(context),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.done:
                        if (snapshot.hasData) {
                          final employee = snapshot.data!;
                          return ListTile(
                            title: Text(
                              employee.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(employee.designation),
                          );
                        } else {
                          return const ListTile(
                            title: Text(
                              "",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(""),
                          );
                        }

                      default:
                        return const ListTile(
                          title: Text(
                            "",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(""),
                        );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
