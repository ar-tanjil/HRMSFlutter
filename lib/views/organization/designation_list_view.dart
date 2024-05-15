import 'package:flutter/material.dart';
import 'package:my_app_office/dialogs/delete_dialog.dart';
import 'package:my_app_office/enum/list_menu.dart';
import 'package:my_app_office/route.dart';
import 'package:my_app_office/services/api/model/designation.dart';

class DesignationListView extends StatefulWidget {
  const DesignationListView({super.key});

  @override
  State<DesignationListView> createState() => _DesignationListViewState();
}

class _DesignationListViewState extends State<DesignationListView> {
  late final DesignationService desigService;

  @override
  void initState() {
    desigService = DesignationService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 226, 233),
      appBar: AppBar(
        title: const Text("designation List"),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(designationFormRoute);
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: desigService.cacheDesignation(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return StreamBuilder<List<Designation>>(
                  stream: desigService.allDesignation,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.active:
                        if (snapshot.hasData) {
                          var deps = snapshot.data!;
                          if (deps.isNotEmpty) {
                            return ListView.builder(
                              itemCount: deps.length,
                              itemBuilder: (context, index) {
                                final designation = deps.elementAt(index);
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 2.0, 8.0, 2.0),
                                  child: ListTile(
                                    title: Text(
                                      designation.jobTitle ?? "",
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Text(
                                      designation.departmentName ?? "",
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 61, 54, 54),
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
                                              // _employeeService.deleteNote(id: employee.id);
                                            }

                                            break;
                                          case ListMenu.update:
                                          // Navigator.of(context).pushNamed(
                                          //   employeeFormRoute,
                                          //   arguments: employee,
                                          // );
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
                                      // Navigator.of(context).pushNamed(otherProfileRoute,
                                      //     arguments: employee);
                                    },
                                  ),
                                );
                              },
                            );
                          } else {
                            return Container();
                          }
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                      default:
                        return Container();
                    }
                  });
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
