import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app_office/route.dart';

class HomeSecondColumn extends StatefulWidget {
  const HomeSecondColumn({super.key});

  @override
  State<HomeSecondColumn> createState() => _HomeSecondColumnState();
}

class _HomeSecondColumnState extends State<HomeSecondColumn> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(children: [
        const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "Ouick Access",
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
              flex: 1,
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.5, 2, 0.5, 4),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(employeeListRoute);
                        },
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(0), // Image border
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(15), // Image radius
                              child: Image.asset('images/employee.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const Text(
                            "Employee",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.5, 2, 0.5, 4),
                      child: ElevatedButton(
                        onPressed: () {},
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(0), // Image border
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(15), // Image radius
                              child: Image.asset('images/attendance.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              "Attendance",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.5, 2, 0.5, 4),
                      child: ElevatedButton(
                        onPressed: () {},
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(0), // Image border
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(15), // Image radius
                              child: Image.asset('images/leave.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const Text(
                            "Leave",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
