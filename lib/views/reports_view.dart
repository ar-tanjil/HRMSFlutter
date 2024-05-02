import 'package:flutter/material.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Card(child: Text("Attendance")),
        Card(child: Text("Leave")),
      ],
    );
  }
}
