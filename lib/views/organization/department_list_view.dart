import 'package:flutter/material.dart';
import 'package:my_app_office/route.dart';

class DepartmentListView extends StatefulWidget {
  const DepartmentListView({super.key});

  @override
  State<DepartmentListView> createState() => _DepartmentListViewState();
}

class _DepartmentListViewState extends State<DepartmentListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 226, 233),
      appBar: AppBar(
        title: const Text("Department List"),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(departmentFormRoute);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
