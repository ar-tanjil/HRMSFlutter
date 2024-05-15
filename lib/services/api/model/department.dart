import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Department departmentFromJson(String str) =>
    Department.fromJson(json.decode(str));

String departmentToJson(Department data) => json.encode(data.toJson());

class Department {
  int? id;
  String? departmentName;
  int? managerId;
  String? departmentDesc;

  Department({
    this.id,
    this.departmentName,
    this.managerId,
    this.departmentDesc,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"],
        departmentName: json["departmentName"],
        managerId: json["managerId"],
        departmentDesc: json["departmentDesc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "departmentName": departmentName,
        "managerId": managerId,
        "departmentDesc": departmentDesc,
      };

  @override
  String toString() {
    return "Deparment {id: $id, title: $departmentName, description: $departmentDesc}";
  }

  @override
  bool operator ==(covariant Department other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class DepartmentService {
  List<Department> _department = [];

  static final DepartmentService _shared = DepartmentService._sahredInstance();

  DepartmentService._sahredInstance() {
    _deparmentStreamController = StreamController<List<Department>>.broadcast(
      onListen: () {
        _deparmentStreamController.sink.add(_department);
      },
    );
  }

  factory DepartmentService() => _shared;

  late final StreamController<List<Department>> _deparmentStreamController;

  Stream<List<Department>> get allDeparment =>
      _deparmentStreamController.stream;

  final String _url = "https://springoffice.onrender.com/departments";

  Future<void> cacheDepartment() async {
    final allDep = await geAlltDeparments();
    _department = allDep;
    _deparmentStreamController.add(_department);
  }

  Future<void> postDepartment({required Department department}) async {
    var response = await http.post(Uri.parse(_url),
        headers: {"Content-Type": "application/json"},
        body: departmentToJson(department));
    if (response.statusCode < 301) {
      _department.add(department);
      _deparmentStreamController.add(_department);
    }
  }

  Future<List<Department>> geAlltDeparments() async {
    var response = await http
        .get(Uri.parse(_url), headers: {"Content-Type": "application/json"});
    Iterable l = json.decode(response.body);
    List<Department> departemts =
        List<Department>.from(l.map((dep) => Department.fromJson(dep)));

    return departemts;
  }
}
