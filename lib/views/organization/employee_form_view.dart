import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app_office/services/api/model/department.dart';
import 'package:my_app_office/services/api/model/designation.dart';
import 'package:my_app_office/services/api/model/employee_api.dart';

class EmployeeFormView extends StatefulWidget {
  const EmployeeFormView({super.key});

  @override
  State<EmployeeFormView> createState() => _EmployeeFormViewState();
}

class _EmployeeFormViewState extends State<EmployeeFormView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _city;
  late final TextEditingController _country;
  late final TextEditingController _email;
  late final TextEditingController _dob;

// --------------------

  int? _selectedDepartment;
  int? _selectedDesignation;

  late final List<Department> _deparments;
  late final List<Designation> _designation;

  Future<void> _getAllDep() async {
    DepartmentService depService = DepartmentService();
    _deparments = await depService.geAlltDeparments();
  }

  List<DropdownMenuItem<int>> get departmentDropdown {
    List<DropdownMenuItem<int>> menuItems = [];
    for (var dep in _deparments) {
      DropdownMenuItem<int> item =
          DropdownMenuItem(value: dep.id, child: Text(dep.departmentName!));
      menuItems.add(item);
    }
    return menuItems;
  }

  Future<void> _getAllDesignation() async {
    DesignationService desigService = DesignationService();
    _designation = await desigService.geAlltDesignation();
  }

  List<DropdownMenuItem<int>> get designationDropdown {
    List<DropdownMenuItem<int>> menuItems = [];
    for (var desig in _designation) {
      DropdownMenuItem<int> item =
          DropdownMenuItem(value: desig.id, child: Text(desig.jobTitle!));
      menuItems.add(item);
    }
    return menuItems;
  }

  @override
  void initState() {
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _email = TextEditingController();
    _city = TextEditingController();
    _country = TextEditingController();
    _dob = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _dob.dispose();
    _selectedDepartment = null;
    _selectedDesignation = null;
    super.dispose();
  }

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (picked != null) {
      setState(() {
        _dob.text = picked.toString();
      });
    }
  }

  Widget _gap() => const SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 219, 226, 233),
        appBar: AppBar(
          title: const Text("Employee Registration"),
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
                        controller: _firstName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          hintText: 'Enter your Name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      _gap(),
                      TextFormField(
                        controller: _lastName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                          hintText: 'Enter your Name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      _gap(),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        autocorrect: false,
                        controller: _dob,
                        onTap: () {
                          _selectDate();
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Choose Date';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Date Of Birth',
                          hintText: 'Enter your Data Birth',
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      _gap(),
                      TextFormField(
                        controller: _email,
                        validator: (value) {
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
                      FutureBuilder(
                          future: _getAllDep(),
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.done:
                                return DropdownButtonFormField(
                                    validator: (value) {
                                      if (value == null) {
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
                                    onChanged: (int? newValue) {
                                      setState(() {
                                        _selectedDepartment = newValue!;
                                      });
                                    },
                                    items: departmentDropdown);
                              default:
                                return DropdownButtonFormField(
                                  validator: (value) {
                                    if (value == null) {
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
                                  onChanged: (int? newValue) {
                                    setState(() {
                                      _selectedDepartment = newValue!;
                                    });
                                  },
                                  items: null,
                                );
                            }
                          }),
                      _gap(),
                      FutureBuilder(
                          future: _getAllDesignation(),
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.done:
                                return DropdownButtonFormField(
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Select Designation',
                                      prefixIcon: Icon(Icons.cabin),
                                      border: OutlineInputBorder(),
                                    ),
                                    // dropdownColor: Colors.blueAccent,
                                    value: _selectedDesignation,
                                    onChanged: (int? newValue) {
                                      setState(() {
                                        _selectedDesignation = newValue!;
                                      });
                                    },
                                    items: designationDropdown);
                              default:
                                return DropdownButtonFormField(
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Select Designation',
                                    prefixIcon: Icon(Icons.cabin),
                                    border: OutlineInputBorder(),
                                  ),
                                  // dropdownColor: Colors.blueAccent,
                                  onChanged: (int? newValue) {
                                    setState(() {
                                      _selectedDepartment = newValue!;
                                    });
                                  },
                                  items: null,
                                );
                            }
                          }),
                      _gap(),
                      TextFormField(
                        controller: _city,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'City',
                          hintText: 'Enter your City',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      _gap(),
                      TextFormField(
                        controller: _country,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Country',
                          hintText: 'Enter your Country',
                          prefixIcon: Icon(Icons.person),
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
                              'Add Employee',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              String firstName = _firstName.text;
                              String lastName = _lastName.text;
                              String email = _email.text;
                              DateTime dob = DateTime.parse(_dob.text);
                              int designationId = 1;
                              int departmentId = 1;
                              String city = _city.text;
                              String country = _country.text;

                              EmployeeApi employee = EmployeeApi(
                                firstName: firstName,
                                lastName: lastName,
                                email: email,
                                dob: dob,
                                departmentId: departmentId,
                                jobId: designationId,
                                city: city,
                                country: country,
                              );

                              EmployeeService service = EmployeeService();

                              await service.postEmployee(employee: employee);

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
        ));
  }
}
