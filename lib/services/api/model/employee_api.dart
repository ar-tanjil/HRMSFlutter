import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EmployeeService {
  List<EmployeeApi> _employee = [];

  static final EmployeeService _shared = EmployeeService._sahredInstance();

  EmployeeService._sahredInstance() {
    _deparmentStreamController = StreamController<List<EmployeeApi>>.broadcast(
      onListen: () {
        _deparmentStreamController.sink.add(_employee);
      },
    );
  }

  factory EmployeeService() => _shared;

  late final StreamController<List<EmployeeApi>> _deparmentStreamController;

  Stream<List<EmployeeApi>> get allDesignation =>
      _deparmentStreamController.stream;

  final String _url = "https://springoffice.onrender.com/employees";

  Future<void> cacheDesignation() async {
    final allDep = await getAllEmployee();
    _employee = allDep;
    _deparmentStreamController.add(_employee);
  }

  Future<void> postEmployee({required EmployeeApi employee}) async {
    var response = await http.post(Uri.parse(_url),
        headers: {"Content-Type": "application/json"},
        body: employeeApiToJson(employee));
    if (response.statusCode < 301) {
      _employee.add(employee);
      _deparmentStreamController.add(_employee);
    }
  }

  Future<List<EmployeeApi>> getAllEmployee() async {
    var response = await http
        .get(Uri.parse(_url), headers: {"Content-Type": "application/json"});
    Iterable l = json.decode(response.body);
    List<EmployeeApi> departemts =
        List<EmployeeApi>.from(l.map((dep) => EmployeeApi.fromJson(dep)));

    return departemts;
  }
}

EmployeeApi employeeApiFromJson(String str) =>
    EmployeeApi.fromJson(json.decode(str));

String employeeApiToJson(EmployeeApi data) => json.encode(data.toJson());

class EmployeeApi {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  DateTime? hireDate;
  String? separationDate;
  DateTime? dob;
  int? jobId;
  int? departmentId;
  String? zipCode;
  String? roadNo;
  String? city;
  String? country;
  String? ssc;
  DateTime? sscPassingYear;
  String? hsc;
  DateTime? hscPassingYear;
  String? undergraduate;
  DateTime? undergraduatePassingYear;
  String? postgraduate;
  DateTime? postgraduatePassingYear;
  String? jobTitle;
  String? departmentName;
  int? salaryId;

  EmployeeApi({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.hireDate,
    this.separationDate,
    this.dob,
    this.jobId,
    this.departmentId,
    this.zipCode,
    this.roadNo,
    this.city,
    this.country,
    this.ssc,
    this.sscPassingYear,
    this.hsc,
    this.hscPassingYear,
    this.undergraduate,
    this.undergraduatePassingYear,
    this.postgraduate,
    this.postgraduatePassingYear,
    this.jobTitle,
    this.departmentName,
    this.salaryId,
  });

  factory EmployeeApi.fromJson(Map<String, dynamic> json) => EmployeeApi(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        hireDate:
            json["hireDate"] == null ? null : DateTime.parse(json["hireDate"]),
        separationDate: json["separationDate"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        jobId: json["jobId"],
        departmentId: json["departmentId"],
        zipCode: json["zipCode"],
        roadNo: json["roadNo"],
        city: json["city"],
        country: json["country"],
        ssc: json["ssc"],
        sscPassingYear: json["sscPassingYear"] == null
            ? null
            : DateTime.parse(json["sscPassingYear"]),
        hsc: json["hsc"],
        hscPassingYear: json["hscPassingYear"] == null
            ? null
            : DateTime.parse(json["hscPassingYear"]),
        undergraduate: json["undergraduate"],
        undergraduatePassingYear: json["undergraduatePassingYear"] == null
            ? null
            : DateTime.parse(json["undergraduatePassingYear"]),
        postgraduate: json["postgraduate"],
        postgraduatePassingYear: json["postgraduatePassingYear"] == null
            ? null
            : DateTime.parse(json["postgraduatePassingYear"]),
        jobTitle: json["jobTitle"],
        departmentName: json["departmentName"],
        salaryId: json["salaryId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "hireDate":
            "${hireDate!.year.toString().padLeft(4, '0')}-${hireDate!.month.toString().padLeft(2, '0')}-${hireDate!.day.toString().padLeft(2, '0')}",
        "separationDate": separationDate,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "jobId": jobId,
        "departmentId": departmentId,
        "zipCode": zipCode,
        "roadNo": roadNo,
        "city": city,
        "country": country,
        "ssc": ssc,
        "sscPassingYear":
            "${sscPassingYear!.year.toString().padLeft(4, '0')}-${sscPassingYear!.month.toString().padLeft(2, '0')}-${sscPassingYear!.day.toString().padLeft(2, '0')}",
        "hsc": hsc,
        "hscPassingYear":
            "${hscPassingYear!.year.toString().padLeft(4, '0')}-${hscPassingYear!.month.toString().padLeft(2, '0')}-${hscPassingYear!.day.toString().padLeft(2, '0')}",
        "undergraduate": undergraduate,
        "undergraduatePassingYear":
            "${undergraduatePassingYear!.year.toString().padLeft(4, '0')}-${undergraduatePassingYear!.month.toString().padLeft(2, '0')}-${undergraduatePassingYear!.day.toString().padLeft(2, '0')}",
        "postgraduate": postgraduate,
        "postgraduatePassingYear":
            "${postgraduatePassingYear!.year.toString().padLeft(4, '0')}-${postgraduatePassingYear!.month.toString().padLeft(2, '0')}-${postgraduatePassingYear!.day.toString().padLeft(2, '0')}",
        "jobTitle": jobTitle,
        "departmentName": departmentName,
        "salaryId": salaryId,
      };

  @override
  String toString() {
    return '''Deparment {id: $id, name: $firstName $lastName, email: $email,
      dob: $dob, depId: $departmentId, jobId: $jobId, city: $city, country: $country
     }
    ''';
  }

  @override
  bool operator ==(covariant EmployeeApi other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}
