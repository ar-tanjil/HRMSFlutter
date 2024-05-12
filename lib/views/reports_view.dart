import 'package:flutter/material.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(4.0, 15, 4, 0),
      child: Column(
        children: [
          Card(
              child: ListTile(
            title: Text(
              "Attendance",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
            ),
          )),
          Card(
              child: ListTile(
            title: Text(
              "Leave",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
            ),
          )),
        ],
      ),
    );
  }
}
