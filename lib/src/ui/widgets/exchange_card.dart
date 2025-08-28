import 'package:flutter/material.dart';
import '../../utils/formatters.dart';

class ExchangeCard extends StatelessWidget {
  final double rate;
  final String from;
  final String to;
  final String lastUpdatedAt;

  const ExchangeCard({super.key, required this.rate, required this.from, required this.to, required this.lastUpdatedAt});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Exchange rate now", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    Text(Formatters.formatDate(lastUpdatedAt), style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "$to/$from",
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(6)),
              child: Text(
                "R\$ ${Formatters.formatNumber(rate)}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
