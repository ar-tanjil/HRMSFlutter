import 'package:my_app_office/views/employee_form_view.dart';
import 'package:my_app_office/views/employee_list_view.dart';
import 'package:my_app_office/views/general_profile_view.dart';
import 'package:my_app_office/views/inner_landing_view.dart';
import 'package:my_app_office/views/login_view.dart';
import 'package:my_app_office/views/profile_view.dart';
import 'package:my_app_office/views/register_view.dart';
import 'package:my_app_office/views/verify_email_view.dart';

const innerLandingRoute = "/innerLanding/";
const profileRoute = '/profile/';
const otherProfileRoute = "/otherProfileRoute/";
const employeeListRoute = "/employeeList/";
const employeeFormRoute = "/employeeForm/";
const loginRoute = "/login/";
const registarRoute = "/register/";
const verifyEmailRoute = "/verifyemail/";

final route = {
  innerLandingRoute: (context) => const OfficeView(),
  profileRoute: (context) => const Profile(),
  otherProfileRoute: (context) => const OtherProfileView(),
  employeeListRoute: (context) => const EmployeeListView(),
  employeeFormRoute: (context) => const EmployeeFormView(),
  loginRoute: (context) => const LoginView(),
  verifyEmailRoute: (context) => const VerifyEmailView(),
  registarRoute: (context) => const RegisterView(),
};
