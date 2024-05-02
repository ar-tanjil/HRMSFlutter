import 'package:flutter/material.dart';

class ApprovalView extends StatelessWidget {
  const ApprovalView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Card(child: Text("Leave")),
        Card(child: Text("Regularization")),
      ],
    );
  }
}
