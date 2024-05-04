// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:my_app_office/dialogs/error_dialoge.dart';
import 'package:my_app_office/route.dart';
import 'package:my_app_office/services/auth/auth_exception.dart';
import 'package:my_app_office/services/auth/auth_service.dart';
import 'package:my_app_office/services/cloud_firebase/firebase_service.dart';
import 'package:my_app_office/services/model/employee.dart';
import 'package:my_app_office/views/employee_form_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final FirebaseCloudService _employeeService;

  String? _selectedDepartment;
  String? _selectedDesignation;
  String? _selectedShift;
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _password;
  bool _isPasswordVisible = false;
  // late final TextEditingController _confirmPassword;

  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();

    _employeeService = FirebaseCloudService();

    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _selectedDepartment = null;
    _selectedDesignation = null;
    _selectedShift = null;
    super.dispose();
  }

  Widget _gap() => const SizedBox(height: 16);

  Future<void> creatUser({
    required String email,
    required String password,
  }) async {
    try {
      await AuthService.firebase().createUser(email: email, password: password);

      AuthService.firebase().emailVerification();
    } on WeakPasswordAuthException {
      await showErrorDialog(
        context,
        "Password Is Incorrect",
      );
    } on EmailAlreadyInUseAuthException {
      await showErrorDialog(
        context,
        "Email Is Already Registerd",
      );
    } on InvalidEmailAuthException {
      await showErrorDialog(
        context,
        "Ivalid Email",
      );
    } on GenericAuthException {
      await showErrorDialog(
        context,
        "Failed To Register",
      );
    }
  }

  Future<void> addOrUpdateEmployeeByForm({
    required String name,
    required String email,
    required String department,
    required String designation,
    required String shift,
  }) async {
    final employee = Employee(
      id: "",
      name: name,
      email: email,
      department: department,
      designation: designation,
      shift: shift,
      role: "Admin",
    );

    await _employeeService.addNewEmployee(employee: employee);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 219, 226, 233),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 15, 10.0, 0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(32.0),
                constraints: const BoxConstraints(maxWidth: 350),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _gap(),
                      _gap(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Register Your Account",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      _gap(),
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
                      TextFormField(
                        controller: _password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }

                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(_isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            )),
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
                            backgroundColor:
                                const Color.fromARGB(255, 231, 194, 83),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              String name = _name.text;
                              String email = _email.text;
                              String password = _password.text;
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

                              await creatUser(email: email, password: password);

                              Navigator.of(context).pushNamed(
                                verifyEmailRoute,
                              );
                            }
                          },
                        ),
                      ),
                      _gap(),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            loginRoute,
                            (route) => false,
                          );
                        },
                        child: const Text("Go to login"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
