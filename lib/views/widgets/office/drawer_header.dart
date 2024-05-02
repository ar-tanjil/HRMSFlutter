import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OfficeDrawerHeader extends StatefulWidget {
  const OfficeDrawerHeader({super.key});

  @override
  State<OfficeDrawerHeader> createState() => _OfficeDrawerHeaderState();
}

class _OfficeDrawerHeaderState extends State<OfficeDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.red,
          ],
        ),
      ),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 100, // Image radius
                  backgroundImage: AssetImage('images/ashiqpic.png'),
                  // child: Image.asset('images/ashiq.png'),
                ),
              ),
            ),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}
