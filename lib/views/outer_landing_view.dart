import 'package:flutter/material.dart';
import 'package:my_app_office/services/auth/auth_service.dart';
import 'package:my_app_office/views/inner_landing_view.dart';
import 'package:my_app_office/views/login_view.dart';
import 'package:my_app_office/views/verify_email_view.dart';

class OuterLandingView extends StatefulWidget {
  const OuterLandingView({super.key});

  @override
  State<OuterLandingView> createState() => _OuterLandingViewState();
}

class _OuterLandingViewState extends State<OuterLandingView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const OfficeView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }

          default:
            return const Scaffold(
              body: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
