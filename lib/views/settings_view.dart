import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app_office/route.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _employee = false;
  bool _organazation = false;
  bool _account = false;

  void _changed({required String field}) {
    setState(() {
      switch (field) {
        case "emp":
          _employee = _employee ? false : true;
          break;
        case "org":
          _organazation = _organazation ? false : true;
          break;
        case "acc":
          _account = _account ? false : true;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 15, 4, 0),
      child: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.blueGrey,
                  width: 0.4,
                ),
              ),
            ),
            child: ListTile(
              tileColor: Colors.white,
              leading: const Icon(
                Icons.group,
                color: Colors.blue,
              ),
              title: const Text(
                "Employees",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              subtitle: const Text("Manage Employee"),
              trailing: _employee
                  ? const Icon(
                      Icons.expand_more,
                      color: Colors.blue,
                    )
                  : const Icon(Icons.chevron_right),
              onTap: () {
                _changed(field: "emp");
              },
            ),
          ),
          Column(
            children: [
              if (_employee) ...[
                ListTile(
                  tileColor: Colors.white54,
                  leading: const Icon(
                    CupertinoIcons.group_solid,
                    size: 18,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    "All Employee",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  subtitle: const Text(
                    "Manage employee",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(employeeListRoute);
                  },
                ),
                ListTile(
                  tileColor: Colors.white54,
                  leading: const Icon(
                    CupertinoIcons.money_dollar,
                    size: 18,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    "Salary",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  subtitle: const Text(
                    "Manage salary",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(salaryListRoute);
                  },
                ),
                ListTile(
                  tileColor: Colors.white54,
                  leading: const Icon(
                    Icons.person_remove,
                    size: 18,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    "Off-boarding",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  subtitle: const Text(
                    "Manage off-boarding",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.blueGrey,
                  width: 0.4,
                ),
              ),
            ),
            child: ListTile(
              tileColor: Colors.white,
              leading: const Icon(
                Icons.apartment,
                color: Colors.blue,
              ),
              title: const Text(
                "Organization",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              subtitle: const Text("Manage organization"),
              trailing: _organazation
                  ? const Icon(
                      Icons.expand_more,
                      color: Colors.blue,
                    )
                  : const Icon(
                      Icons.chevron_right,
                    ),
              onTap: () {
                _changed(field: "org");
              },
            ),
          ),
          Column(
            children: [
              if (_organazation) ...[
                ListTile(
                  tileColor: Colors.white54,
                  leading: const Icon(
                    CupertinoIcons.building_2_fill,
                    size: 18,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    "Department",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  subtitle: const Text(
                    "Manage Department",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(deparmentListRoute);
                  },
                ),
                ListTile(
                  tileColor: Colors.white54,
                  leading: const Icon(
                    CupertinoIcons.rectangle_stack_person_crop_fill,
                    size: 18,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    "Designation",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  subtitle: const Text(
                    "Manage designation",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(designationListRoute);
                  },
                ),
                ListTile(
                  tileColor: Colors.white54,
                  leading: const Icon(
                    Icons.lock_clock,
                    size: 18,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    "Shifts",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  subtitle: const Text(
                    "Manage Shifts",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.blueGrey,
                  width: 0.4,
                ),
              ),
            ),
            child: ListTile(
              tileColor: Colors.white,
              leading: const Icon(
                Icons.manage_accounts,
                color: Colors.blue,
              ),
              title: const Text(
                "Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              subtitle: const Text("Manage account"),
              trailing: _account
                  ? const Icon(
                      Icons.expand_more,
                      color: Colors.blue,
                    )
                  : const Icon(
                      Icons.chevron_right,
                    ),
              onTap: () {
                _changed(field: "acc");
              },
            ),
          ),
          Column(
            children: [
              if (_account) ...[
                ListTile(
                  tileColor: Colors.white54,
                  leading: const Icon(
                    Icons.account_circle,
                    size: 18,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  subtitle: const Text(
                    "Manage profile",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, profileRoute);
                  },
                ),
                ListTile(
                  tileColor: Colors.white54,
                  leading: const Icon(
                    Icons.lock,
                    size: 18,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  subtitle: const Text(
                    "Manage password",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  tileColor: Colors.white54,
                  leading: const Icon(
                    Icons.delete,
                    size: 18,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    "Delete Account",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  subtitle: const Text(
                    "Request account deletion",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.blueGrey,
                  width: 0.4,
                ),
              ),
            ),
            child: ListTile(
              tileColor: Colors.white,
              leading: const Icon(
                Icons.notifications,
                color: Colors.blue,
              ),
              title: const Text(
                "Notification",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              subtitle: const Text("Manage notification"),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
