import 'package:flutter/material.dart';

class HomeFirstColumn extends StatefulWidget {
  const HomeFirstColumn({super.key});

  @override
  State<HomeFirstColumn> createState() => _HomeFirstColumnState();
}

class _HomeFirstColumnState extends State<HomeFirstColumn> {
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
          const Expanded(
            flex: 2,
            child: ListTile(
              title: Text(
                'Ashiqur Rahman',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("Web Devloper"),
            ),
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
      ),
    );
  }
}
