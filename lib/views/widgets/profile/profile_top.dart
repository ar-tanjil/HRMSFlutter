import 'package:flutter/material.dart';
import 'package:my_app_office/services/model/employee.dart';

class ProfileTop extends StatefulWidget {
  final Employee employee;
  const ProfileTop({super.key, required this.employee});

  @override
  State<ProfileTop> createState() => _ProfileTopState();
}

class _ProfileTopState extends State<ProfileTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blueGrey,
            Colors.blue,
            Color.fromARGB(255, 114, 156, 229),
          ],
        ),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0xff0043ba),
                        Color.fromARGB(255, 29, 100, 193),
                      ]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 219, 226, 233),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(''),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Text(
            widget.employee.name,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            widget.employee.designation,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
