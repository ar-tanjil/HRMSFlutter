import 'package:flutter/material.dart';
import 'package:my_app_office/services/auth/auth_service.dart';
import 'package:my_app_office/services/cloud_firebase/firebase_service.dart';
import 'package:my_app_office/services/model/employee.dart';

class HomeFirstColumn extends StatefulWidget {
  const HomeFirstColumn({
    super.key,
  });

  @override
  State<HomeFirstColumn> createState() => _HomeFirstColumnState();
}

class _HomeFirstColumnState extends State<HomeFirstColumn> {
  late final _employeeService = FirebaseCloudService();

  Future<Employee?> getUserDetails(BuildContext context) async {
    final user = AuthService.firebase().currentUser!;
    final email = user.email;

    return await _employeeService.getUserByEmail(email);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: Row(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 48, // Image radius
                  backgroundImage: AssetImage(
                    "images/ashiq.png",
                  ),
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
                          final Employee employee = snapshot.data!;
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
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Time In",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
