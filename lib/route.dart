import 'package:my_app_office/practise/add_image.dart';
import 'package:my_app_office/views/general_profile_view.dart';
import 'package:my_app_office/views/inner_landing_view.dart';
import 'package:my_app_office/views/login_view.dart';
import 'package:my_app_office/views/organization/deparment_form_view.dart';
import 'package:my_app_office/views/organization/department_list_view.dart';
import 'package:my_app_office/views/organization/designation_form_view.dart';
import 'package:my_app_office/views/organization/designation_list_view.dart';
import 'package:my_app_office/views/organization/employee_form_view.dart';
import 'package:my_app_office/views/organization/employee_list_view.dart';
import 'package:my_app_office/views/organization/salary_form_view.dart';
import 'package:my_app_office/views/organization/salary_list_view.dart';
import 'package:my_app_office/views/profile_view.dart';
import 'package:my_app_office/views/register_view.dart';
import 'package:my_app_office/views/reports/attendance_view.dart';
import 'package:my_app_office/views/reports/leave_view.dart';
import 'package:my_app_office/views/verify_email_view.dart';

const innerLandingRoute = "/innerLanding/";
const profileRoute = '/profile/';
const otherProfileRoute = "/otherProfileRoute/";
const employeeListRoute = "/employeeList/";
const employeeFormRoute = "/employeeForm/";
const loginRoute = "/login/";
const registarRoute = "/register/";
const verifyEmailRoute = "/verifyemail/";
const deparmentListRoute = "/departmentList/";
const designationListRoute = "/designationList/";
const departmentFormRoute = "/departmentForm/";
const designationFormRoute = "/designationForm/";
const attendanceRoute = "/attendance/";
const leaveRoute = "/leave/";
const salaryListRoute = "/salaryList/";
const salaryFormRoute = "/salaryForm/";
// -------------
const addImageView = "/addImage/";

final route = {
  innerLandingRoute: (context) => const OfficeView(),
  profileRoute: (context) => const Profile(),
  otherProfileRoute: (context) => const OtherProfileView(),
  employeeListRoute: (context) => const EmployeeListView(),
  employeeFormRoute: (context) => const EmployeeFormView(),
  loginRoute: (context) => const LoginView(),
  verifyEmailRoute: (context) => const VerifyEmailView(),
  registarRoute: (context) => const RegisterView(),
  deparmentListRoute: (context) => const DepartmentListView(),
  designationListRoute: (context) => const DesignationListView(),
  departmentFormRoute: (context) => const DeparmentFormView(),
  designationFormRoute: (context) => const DesignationFormView(),
  attendanceRoute: (context) => const AttendanceView(),
  leaveRoute: (context) => const LeaveView(),
  salaryListRoute: (context) => const SalaryListView(),
  salaryFormRoute: (context) => const SalaryFormView(),
  addImageView: (context) => const AddImageView(),
};
