import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Designation designationFromJson(String str) =>
    Designation.fromJson(json.decode(str));

String designationToJson(Designation data) => json.encode(data.toJson());

class Designation {
  int? id;
  String? jobTitle;
  int? minSalary;
  int? maxSalary;
  int? totalPost;
  int? vacancy;
  int? departmentId;
  String? departmentName;

  Designation({
    this.id,
    this.jobTitle,
    this.minSalary,
    this.maxSalary,
    this.totalPost,
    this.vacancy,
    this.departmentId,
    this.departmentName,
  });

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        id: json["id"],
        jobTitle: json["jobTitle"],
        minSalary: json["minSalary"],
        maxSalary: json["maxSalary"],
        totalPost: json["totalPost"],
        vacancy: json["vacancy"],
        departmentId: json["departmentId"],
        departmentName: json["departmentName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jobTitle": jobTitle,
        "minSalary": minSalary,
        "maxSalary": maxSalary,
        "totalPost": totalPost,
        "vacancy": vacancy,
        "departmentId": departmentId,
        "departmentName": departmentName,
      };

  @override
  String toString() {
    return '''
    Designation {id: $id, 
    title: $jobTitle,
    minSalary: $minSalary,
    maxSalary: $maxSalary,
    totalPost: $totalPost,
    departmentId: $departmentId,
    }
    ''';
  }

  @override
  bool operator ==(covariant Designation other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class DesignationService {
  List<Designation> _designation = [];

  static final DesignationService _shared =
      DesignationService._sahredInstance();

  DesignationService._sahredInstance() {
    _deparmentStreamController = StreamController<List<Designation>>.broadcast(
      onListen: () {
        _deparmentStreamController.sink.add(_designation);
      },
    );
  }

  factory DesignationService() => _shared;

  late final StreamController<List<Designation>> _deparmentStreamController;

  Stream<List<Designation>> get allDesignation =>
      _deparmentStreamController.stream;

  final String _url = "https://springoffice.onrender.com/designations";

  Future<void> cacheDesignation() async {
    final allDep = await geAlltDesignation();
    _designation = allDep;
    _deparmentStreamController.add(_designation);
  }

  Future<void> postDesignation({required Designation designation}) async {
    var response = await http.post(Uri.parse(_url),
        headers: {"Content-Type": "application/json"},
        body: designationToJson(designation));
    if (response.statusCode < 301) {
      _designation.add(designation);
      _deparmentStreamController.add(_designation);
    }
  }

  Future<List<Designation>> geAlltDesignation() async {
    var response = await http
        .get(Uri.parse(_url), headers: {"Content-Type": "application/json"});
    Iterable l = json.decode(response.body);
    List<Designation> departemts =
        List<Designation>.from(l.map((dep) => Designation.fromJson(dep)));

    return departemts;
  }
}
