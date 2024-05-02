import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeThirdColumn extends StatefulWidget {
  const HomeThirdColumn({super.key});

  @override
  State<HomeThirdColumn> createState() => _HomeThirdColumnState();
}

class _HomeThirdColumnState extends State<HomeThirdColumn> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color.fromARGB(255, 222, 210, 210)),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "Attendance Insight",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(15), // Image radius
                        child: Image.asset('images/cleander.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Present",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text("0"),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ElevatedButton(
                onPressed: () {},
                child: const Text("View"),
              )),
            ],
          )
        ],
      ),
    );
  }
}
