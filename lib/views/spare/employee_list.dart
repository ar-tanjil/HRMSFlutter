import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app_office/dialogs/delete_dialog.dart';
import 'package:my_app_office/enum/list_menu.dart';
import 'package:my_app_office/route.dart';
import 'package:my_app_office/services/cloud_firebase/firebase_service.dart';
import 'package:my_app_office/services/model/employee.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  late final FirebaseCloudService _employeeService;

  @override
  void initState() {
    _employeeService = FirebaseCloudService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 226, 233),
      appBar: AppBar(
        title: const Text("Employee List"),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(employeeFormRoute);
        },
        child: const Icon(CupertinoIcons.person_add_solid),
      ),
      body: StreamBuilder(
        stream: _employeeService.allEmployee(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              if (snapshot.hasData) {
                final allEmplyee = snapshot.data as Iterable<Employee>;
                return ListView.builder(
                  itemCount: allEmplyee.length,
                  itemBuilder: (context, index) {
                    final employee = allEmplyee.elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                      child: ListTile(
                        title: Text(
                          employee.name,
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: const CircleAvatar(
                          radius: 25, // Image radius
                          backgroundImage: AssetImage(
                            "images/ashiq.png",
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(255, 61, 54, 54),
                              width: 0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        trailing: PopupMenuButton<ListMenu>(
                          onSelected: (value) async {
                            switch (value) {
                              case ListMenu.delete:
                                final shouldDelete =
                                    await showDeleteDialog(context);

                                if (shouldDelete) {
                                  _employeeService.deleteNote(id: employee.id);
                                }

                                break;
                              case ListMenu.update:
                                Navigator.of(context).pushNamed(
                                  employeeFormRoute,
                                  arguments: employee,
                                );
                            }
                          },
                          itemBuilder: (context) {
                            return const [
                              PopupMenuItem<ListMenu>(
                                value: ListMenu.delete,
                                child: Text("Delete"),
                              ),
                              PopupMenuItem<ListMenu>(
                                value: ListMenu.update,
                                child: Text("Update"),
                              )
                            ];
                          },
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(otherProfileRoute,
                              arguments: employee);
                        },
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
