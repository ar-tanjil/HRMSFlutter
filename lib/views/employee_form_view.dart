import 'package:flutter/material.dart';
import 'package:my_app_office/services/cloud_firebase/firebase_service.dart';
import 'package:my_app_office/services/model/employee.dart';
import 'package:my_app_office/utils/get_argument.dart';

class EmployeeFormView extends StatefulWidget {
  const EmployeeFormView({super.key});

  @override
  State<EmployeeFormView> createState() => _EmployeeFormViewState();
}

class _EmployeeFormViewState extends State<EmployeeFormView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final FirebaseCloudService _employeeService;

  String _employeeId = "";
  bool _edit = false;
  String? _selectedDepartment;
  String? _selectedDesignation;
  String? _selectedShift;
  late final TextEditingController _name;
  late final TextEditingController _email;

  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _employeeService = FirebaseCloudService();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _selectedDepartment = null;
    _selectedDesignation = null;
    _selectedShift = null;
    super.dispose();
  }

  Widget _gap() => const SizedBox(height: 16);

  Future<Employee?> getEmployee(BuildContext context) async {
    final employee = context.getArgument<Employee>();
    if (employee != null) {
      _edit = true;
      _employeeId = employee.id;
      _selectedDepartment = employee.department;
      _selectedDesignation = employee.designation;
      _selectedShift = employee.shift;
      _name.text = employee.name;
      _email.text = employee.email;
    }
    return employee;
  }

  Future<void> addOrUpdateEmployeeByForm({
    required String name,
    required String email,
    required String department,
    required String designation,
    required String shift,
  }) async {
    final employee = Employee(
      id: _employeeId,
      name: name,
      email: email,
      department: department,
      designation: designation,
      shift: shift,
    );

    if (_edit) {
      return await _employeeService.updateEmployee(
        id: _employeeId,
        employee: employee,
      );
    }

    return await _employeeService.addNewEmployee(employee: employee);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Registration"),
      ),
      body: FutureBuilder(
          future: getEmployee(context),
          builder: (context, snapshot) {
            return SingleChildScrollView(
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
                              hintText: 'Enter your Name',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          _gap(),
                          TextFormField(
                            controller: _email,
                            validator: (value) {
                              // add email validation
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }

                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
                              if (!emailValid) {
                                return 'Please enter a valid email';
                              }

                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          _gap(),
                          DropdownButtonFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Select Department',
                                prefixIcon: Icon(Icons.cabin),
                                border: OutlineInputBorder(),
                              ),
                              // dropdownColor: Colors.blueAccent,
                              value: _selectedDepartment,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedDepartment = newValue!;
                                });
                              },
                              items: departmentDropdown),
                          _gap(),
                          DropdownButtonFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Select Designation',
                                prefixIcon: Icon(Icons.card_membership),
                                border: OutlineInputBorder(),
                              ),
                              // dropdownColor: Colors.blueAccent,
                              value: _selectedDesignation,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedDesignation = newValue!;
                                });
                              },
                              items: designationDropdown),
                          _gap(),
                          DropdownButtonFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Select Shift',
                                prefixIcon: Icon(Icons.lock_clock),
                                border: OutlineInputBorder(),
                              ),
                              // dropdownColor: Colors.blueAccent,
                              value: _selectedShift,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedShift = newValue!;
                                });
                              },
                              items: shiftDropdown),
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
                                  'Add Employee',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  String name = _name.text;
                                  String email = _email.text;
                                  String department = _selectedDepartment!;
                                  String designation = _selectedDesignation!;
                                  String shift = _selectedShift!;

                                  await addOrUpdateEmployeeByForm(
                                    name: name,
                                    email: email,
                                    department: department,
                                    designation: designation,
                                    shift: shift,
                                  );
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
            );
          }),
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

List<DropdownMenuItem<String>> get designationDropdown {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: "MANAGER", child: Text("MANAGER")),
    DropdownMenuItem(value: "SR.OFFICER", child: Text("SR. OFFICER")),
    DropdownMenuItem(value: "JR.OFFICER", child: Text("JR. OFFICES")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get shiftDropdown {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: "FULLTIME", child: Text("FULL TIME")),
    DropdownMenuItem(value: "PARTTIME", child: Text("PART TIME")),
  ];
  return menuItems;
}
