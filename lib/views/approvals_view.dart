import 'package:flutter/material.dart';

class ApprovalView extends StatelessWidget {
  const ApprovalView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.fromLTRB(4.0, 15, 4, 0),
        child: PayrollCard(
          netPay: 1000,
          payDate: "2024-06-01",
        ));
  }
}

class PayrollCard extends StatelessWidget {
  final double netPay;
  final String payDate;

  const PayrollCard({super.key, required this.netPay, required this.payDate});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Content doesn't overflow
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ashiq",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0), // Add some space
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Net Pay:",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "${formatCurrency(netPay)}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Text(
              "Pay Date: $payDate",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  String formatCurrency(double amount) {
    // Implement your logic to format the currency (e.g., USD, EUR)
    // You can use a package like intl for advanced formatting
    return "\$$amount";
  }
}
