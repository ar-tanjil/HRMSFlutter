import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app_office/route.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 15, 4, 0),
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(
                CupertinoIcons.calendar,
                color: Colors.blue,
              ),
              title: const Text(
                "Attendance",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(attendanceRoute);
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.directions_walk,
                color: Colors.blue,
              ),
              title: const Text(
                "Leave",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(leaveRoute);
              },
            ),
          ),
        ],
      ),
    );
  }
}
