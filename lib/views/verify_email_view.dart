import 'package:flutter/material.dart';
import 'package:my_app_office/route.dart';
import 'package:my_app_office/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 226, 233),
      appBar: AppBar(
        title: const Text("Verify Email"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          const Text("We've sent you an Email Verifiacation,"
              " Please verify your account."),
          const Text("If you haven't received a verification email yet,"
              " press the button below."),
          TextButton(
            onPressed: () async {
              AuthService.firebase().emailVerification();
            },
            child: const Text("Send Verification Email Again"),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute,
                (route) => false,
              );
            },
            child: const Text("Go to login"),
          ),
        ],
      ),
    );
  }
}
