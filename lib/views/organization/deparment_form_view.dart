import 'package:flutter/material.dart';
import 'package:my_app_office/services/api/model/department.dart';

class DeparmentFormView extends StatefulWidget {
  const DeparmentFormView({super.key});

  @override
  State<DeparmentFormView> createState() => _DeparmentFormViewState();
}

class _DeparmentFormViewState extends State<DeparmentFormView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _description;

  @override
  void initState() {
    _name = TextEditingController();
    _description = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Widget _gap() => const SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 226, 233),
      appBar: AppBar(
        title: const Text("Add New Department"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 15, 10.0, 0),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter Department Name',
                        prefixIcon: Icon(Icons.title),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      controller: _description,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        hintText: 'Enter Department Name',
                        prefixIcon: Icon(Icons.note),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    _gap(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Add Department',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            String name = _name.text;
                            String description = _description.text;

                            Department department = Department(
                              departmentName: name,
                              departmentDesc: description,
                            );
                            DepartmentService service = DepartmentService();
                            service.postDepartment(department: department);

                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> get departmentDropdown {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: "IT", child: Text("IT")),
    DropdownMenuItem(value: "HR", child: Text("HR")),
    DropdownMenuItem(value: "ACCOUNTS", child: Text("ACCOUNTS")),
  ];
  return menuItems;
}
