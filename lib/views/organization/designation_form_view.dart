import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app_office/services/api/model/department.dart';
import 'package:my_app_office/services/api/model/designation.dart';

class DesignationFormView extends StatefulWidget {
  const DesignationFormView({super.key});

  @override
  State<DesignationFormView> createState() => _DesignationFormViewState();
}

class _DesignationFormViewState extends State<DesignationFormView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _jobTitle;
  late final TextEditingController _minSalary;
  late final TextEditingController _maxSalary;
  late final TextEditingController _totalPost;

  int? _selectedDepartment;

  late final List<Department> _deparments;

  List<DropdownMenuItem<int>> get departmentDropdown {
    List<DropdownMenuItem<int>> menuItems = [];
    for (var dep in _deparments) {
      DropdownMenuItem<int> item =
          DropdownMenuItem(value: dep.id, child: Text(dep.departmentName!));
      menuItems.add(item);
    }
    return menuItems;
  }

  Future<void> _getAllDep() async {
    DepartmentService depService = DepartmentService();
    _deparments = await depService.geAlltDeparments();
  }

  @override
  void initState() {
    _jobTitle = TextEditingController();
    _minSalary = TextEditingController();
    _maxSalary = TextEditingController();
    _totalPost = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _jobTitle.dispose();
    _minSalary.dispose();
    _maxSalary.dispose();
    _totalPost.dispose();
    super.dispose();
  }

  Widget _gap() => const SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 226, 233),
      appBar: AppBar(
        title: const Text("Add New Designation"),
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
                      controller: _jobTitle,
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
                    TextFormField(
                      controller: _minSalary,
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Min Salary',
                        prefixIcon: Icon(Icons.cabin),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      controller: _maxSalary,
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Max Salary',
                        prefixIcon: Icon(Icons.cabin),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      controller: _totalPost,
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Total Post',
                        prefixIcon: Icon(Icons.cabin),
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
                            'Add Job',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            String jobTitle = _jobTitle.text;
                            int minSalary = int.parse(_minSalary.text);
                            int maxSalary = int.parse(_maxSalary.text);
                            int totalPost = int.parse(_totalPost.text);
                            int departmentId = _selectedDepartment!;

                            Designation designation = Designation(
                                jobTitle: jobTitle,
                                minSalary: minSalary,
                                maxSalary: maxSalary,
                                totalPost: totalPost,
                                departmentId: departmentId);

                            DesignationService service = DesignationService();
                            await service.postDesignation(
                                designation: designation);

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
