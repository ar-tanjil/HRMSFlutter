import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app_office/services/cloud_firebase/cloud_constants.dart';

class Employee {
  final String id;
  final String name;
  final String email;
  final String department;
  final String designation;
  final String shift;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.department,
    required this.designation,
    required this.shift,
  });

  Employee.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        name = snapshot.data()[empName],
        email = snapshot.data()[empEmail],
        department = snapshot.data()[empDepartment],
        designation = snapshot.data()[empDesignation],
        shift = snapshot.data()[empShift];

  @override
  String toString() {
    return "id: $id, name: $name, email: $email, "
        " department: $department, designation: $designation, shift: $shift";
  }

  @override
  bool operator ==(covariant Employee other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}
