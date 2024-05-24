import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app_office/services/api/model/employee_api.dart';
import 'package:my_app_office/services/api/model/salary.dart';

class SalaryFormView extends StatefulWidget {
  const SalaryFormView({super.key});

  @override
  State<SalaryFormView> createState() => _SalaryFormViewState();
}

class _SalaryFormViewState extends State<SalaryFormView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _basicSalary;
  late final TextEditingController _medicalAllowance;
  late final TextEditingController _providentFund;

  int? _selectedEmployee;

  late final List<EmployeeApi> _employee;

  List<DropdownMenuItem<int>> get employeeDropdown {
    List<DropdownMenuItem<int>> menuItems = [];
    for (var emp in _employee) {
      DropdownMenuItem<int> item =
          DropdownMenuItem(value: emp.id, child: Text(emp.firstName!));
      menuItems.add(item);
    }
    return menuItems;
  }

  Future<void> _getEmployeeWithoutSalary() async {
    EmployeeService employeeService = EmployeeService();
    _employee = await employeeService.getAllEmployeeWithoutSalary();
  }

  @override
  void initState() {
    _basicSalary = TextEditingController();
    _medicalAllowance = TextEditingController();
    _providentFund = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _basicSalary.dispose();
    _medicalAllowance.dispose();
    _providentFund.dispose();
    super.dispose();
  }

  Widget _gap() => const SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 226, 233),
      appBar: AppBar(
        title: const Text("Add Salary"),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder(
          future: _getEmployeeWithoutSalary(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
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
                              DropdownButtonFormField(
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Select Employee',
                                    prefixIcon: Icon(Icons.cabin),
                                    border: OutlineInputBorder(),
                                  ),
                                  // dropdownColor: Colors.blueAccent,
                                  value: _selectedEmployee,
                                  onChanged: (int? newValue) {
                                    _selectedEmployee = newValue!;
                                  },
                                  items: employeeDropdown),
                              _gap(),
                              TextFormField(
                                controller: _basicSalary,
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
                                  labelText: 'Basic Salary',
                                  prefixIcon: Icon(Icons.cabin),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              _gap(),
                              TextFormField(
                                controller: _medicalAllowance,
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
                                  labelText: 'Medical Allowance',
                                  prefixIcon: Icon(Icons.cabin),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              _gap(),
                              TextFormField(
                                controller: _providentFund,
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
                                  labelText: 'Medical Allowance',
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
                                      'Add Salary',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      int employeeId = _selectedEmployee!;
                                      double basicSalary =
                                          double.parse(_basicSalary.text);
                                      double medicalAllowance =
                                          double.parse(_medicalAllowance.text);
                                      double providentFund =
                                          double.parse(_providentFund.text);

                                      Salary salary = Salary(
                                        employeeId: employeeId,
                                        basic: basicSalary,
                                        medicalAllowance: medicalAllowance,
                                        providentFund: providentFund,
                                        travelAllowance: 0.0,
                                      );

                                      SalaryService service = SalaryService();
                                      await service.postSalalry(salary: salary);

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
              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          }),
    );
  }
}
