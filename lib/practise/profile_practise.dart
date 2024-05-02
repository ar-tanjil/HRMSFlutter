import 'package:flutter/material.dart';

class ProfilePage1 extends StatelessWidget {
  const ProfilePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 100, 193),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     FloatingActionButton.extended(
                  //       onPressed: () {},
                  //       heroTag: 'follow',
                  //       elevation: 0,
                  //       label: const Text("Follow"),
                  //       icon: const Icon(Icons.person_add_alt_1),
                  //     ),
                  //     const SizedBox(width: 16.0),
                  //     FloatingActionButton.extended(
                  //       onPressed: () {},
                  //       heroTag: 'mesage',
                  //       elevation: 0,
                  //       backgroundColor: Colors.red,
                  //       label: const Text("Message"),
                  //       icon: const Icon(Icons.message_rounded),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
