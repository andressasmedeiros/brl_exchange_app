import 'package:flutter/material.dart';
import '../../models/daily_rate.dart';
import '../../utils/formatters.dart';

class DailyRateCard extends StatelessWidget {
  final DailyRate dailyRate;

  const DailyRateCard({super.key, required this.dailyRate});

  @override
  Widget build(BuildContext context) {
    final diff = dailyRate.closeDiff ?? 0;
    final diffColor = diff > 0 ? Colors.green : (diff < 0 ? Colors.red : Colors.black);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Formatters.formatDate(dailyRate.date).split(" ").first,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.blue),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: "OPEN: ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "R\$ ${dailyRate.open.toStringAsFixed(4)}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "HIGH: ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "R\$ ${dailyRate.high.toStringAsFixed(4)}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: "CLOSE: ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "R\$ ${dailyRate.close.toStringAsFixed(4)}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "LOW: ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "R\$ ${dailyRate.low.toStringAsFixed(4)}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              "CLOSE DIFF (%): ${diff > 0 ? "+" : ""}${diff.toStringAsFixed(2)}%",
              style: TextStyle(color: diffColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
