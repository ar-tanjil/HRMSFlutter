import 'package:my_app_office/views/employee_form_view.dart';
import 'package:my_app_office/views/employee_list_view.dart';
import 'package:my_app_office/views/general_profile_view.dart';
import 'package:my_app_office/views/profile_view.dart';

const profileRoute = '/profile/';
const otherProfileRoute = "/otherProfileRoute/";
const employeeListRoute = "/employeeList/";
const employeeFormRoute = "/employeeForm/";

final route = {
  profileRoute: (context) => const Profile(),
  otherProfileRoute: (context) => const OtherProfileView(),
  employeeListRoute: (context) => const EmployeeListView(),
  employeeFormRoute: (context) => const EmployeeFormView(),
};
