import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class SalaryService {
  List<Salary> _salary = [];

  static final SalaryService _shared = SalaryService._sahredInstance();

  SalaryService._sahredInstance() {
    _salaryStreamController = StreamController<List<Salary>>.broadcast(
      onListen: () {
        _salaryStreamController.sink.add(_salary);
      },
    );
  }

  factory SalaryService() => _shared;

  late final StreamController<List<Salary>> _salaryStreamController;

  Stream<List<Salary>> get allSalary => _salaryStreamController.stream;

  final String _url = "https://springoffice.onrender.com/salaries";

  Future<void> cacheSalary() async {
    final allSalary = await getAllSalary();
    _salary = allSalary;
    _salaryStreamController.add(_salary);
  }

  Future<void> postSalalry({required Salary salary}) async {
    var response = await http.post(Uri.parse("$_url/${salary.employeeId}"),
        headers: {"Content-Type": "application/json"},
        body: salaryToJson(salary));
    if (response.statusCode < 301) {
      _salary.add(salary);
      _salaryStreamController.add(_salary);
    }
  }

  Future<List<Salary>> getAllSalary() async {
    var response = await http
        .get(Uri.parse(_url), headers: {"Content-Type": "application/json"});

    final Iterable salary = json.decode(response.body);
    log(salary.toString());

    List<Salary> list =
        List<Salary>.from(salary.map((dep) => Salary.fromJson(dep)));
    log("message");
    return list;
  }
}

Salary salaryFromJson(String str) => Salary.fromJson(json.decode(str));

String salaryToJson(Salary data) => json.encode(data.toJson());

class Salary {
  int? id;
  double? basic;
  double? medicalAllowance;
  double? providentFund;
  double? travelAllowance;
  double? provident;
  double? medical;
  double? travel;
  double? loan;
  double? epf;
  int? employeeId;
  EmployeeTable? employeeTable;

  Salary({
    this.id,
    this.basic,
    this.medicalAllowance,
    this.providentFund,
    this.travelAllowance,
    this.provident,
    this.medical,
    this.travel,
    this.loan,
    this.epf,
    this.employeeId,
    this.employeeTable,
  });

  factory Salary.fromJson(Map<String, dynamic> json) => Salary(
        id: json["id"],
        basic: json["basic"],
        medicalAllowance: json["medicalAllowance"],
        providentFund: json["providentFund"],
        travelAllowance: json["travelAllowance"],
        provident: json["provident"],
        medical: json["medical"],
        travel: json["travel"],
        loan: json["loan"],
        epf: json["epf"],
        employeeId: json["employeeId"],
        employeeTable: json["employeeTable"] == null
            ? null
            : EmployeeTable.fromJson(json["employeeTable"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "basic": basic,
        "medicalAllowance": medicalAllowance,
        "providentFund": providentFund,
        "travelAllowance": travelAllowance,
        "provident": provident,
        "medical": medical,
        "travel": travel,
        "loan": loan,
        "epf": epf,
        "employeeId": employeeId,
        "employeeTable": employeeTable?.toJson(),
      };
}

class EmployeeTable {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? jobTitle;
  String? departmentName;

  EmployeeTable({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.jobTitle,
    this.departmentName,
  });

  factory EmployeeTable.fromJson(Map<String, dynamic> json) => EmployeeTable(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        jobTitle: json["jobTitle"],
        departmentName: json["departmentName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "jobTitle": jobTitle,
        "departmentName": departmentName,
      };
}
