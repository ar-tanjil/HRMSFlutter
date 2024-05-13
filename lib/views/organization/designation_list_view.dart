import 'package:flutter/material.dart';
import 'package:my_app_office/route.dart';

class DesignationListView extends StatefulWidget {
  const DesignationListView({super.key});

  @override
  State<DesignationListView> createState() => _DesignationListViewState();
}

class _DesignationListViewState extends State<DesignationListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 226, 233),
      appBar: AppBar(
        title: const Text("Desigantion List"),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(designationFormRoute);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
