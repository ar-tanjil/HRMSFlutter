import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app_office/services/cloud_firebase/cloud_constants.dart';
import 'package:my_app_office/services/cloud_firebase/cloud_storage_execption.dart';
import 'package:my_app_office/services/model/employee.dart';

class FirebaseCloudService {
// Sigleton instance
  static final FirebaseCloudService _shared =
      FirebaseCloudService._sharedInstance();

  FirebaseCloudService._sharedInstance();

  factory FirebaseCloudService() => _shared;
// ----------------

  final _employee = FirebaseFirestore.instance.collection("employee");

  Stream<Iterable<Employee>> allEmployee() => _employee
      .orderBy(empName, descending: false)
      .snapshots()
      .map((snap) => snap.docs.map(
            (doc) => Employee.fromSnapshot(doc),
          ));

  Future<void> addNewEmployee({required Employee employee}) async {
    await _employee.add({
      empName: employee.name,
      empEmail: employee.email,
      empDepartment: employee.department,
      empDesignation: employee.designation,
      empShift: employee.shift
    });

    return Future.value();
  }

  Future<Iterable<Employee>> getEmployeeById({
    required String id,
  }) async {
    try {
      return await _employee
          .where(
            empId,
            isEqualTo: id,
          )
          .get()
          .then((value) => value.docs.map((doc) {
                return Employee.fromSnapshot(doc);
              }));
    } catch (e) {
      throw CouldNotGetAllEmployeeException();
    }
  }

  Future<void> updateEmployee({
    required id,
    required Employee employee,
  }) async {
    try {
      await _employee.doc(id).update({
        empName: employee.name,
        empEmail: employee.email,
        empDepartment: employee.department,
        empDesignation: employee.designation,
        empShift: employee.shift,
      });
    } catch (e) {
      throw CouldNotUpdateEmployeeException();
    }
  }

  Future<void> deleteNote({
    required String id,
  }) async {
    try {
      await _employee.doc(id).delete();
    } catch (e) {
      throw CouldNotDeleteEmployeeException();
    }
  }
}
