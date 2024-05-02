import 'package:flutter/material.dart';
import 'package:my_app_office/route.dart';

class EmployeeListView extends StatefulWidget {
  const EmployeeListView({super.key});

  @override
  State<EmployeeListView> createState() => _EmployeeListViewState();
}

class _EmployeeListViewState extends State<EmployeeListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Directory"),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(employeeFormRoute);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 48, // Image radius
              backgroundImage: AssetImage(
                "images/ashiq.png",
              ),
            ),
            title: const Text("Ashiq"),
            trailing:
                TextButton(onPressed: () {}, child: const Icon(Icons.menu)),
            onTap: () {
              Navigator.of(context).pushNamed(otherProfileRoute);
            },
          )
        ],
      ),
    );
  }
}
