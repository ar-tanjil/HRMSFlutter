import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          title: Text("Employees"),
        ),
        ListTile(
          title: Text("Organization"),
        ),
        ListTile(
          title: Text("Account"),
        ),
      ],
    );
  }
}
