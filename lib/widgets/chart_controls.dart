import 'package:flutter/material.dart';

class ChartControls extends StatelessWidget {
  const ChartControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _pill('Last 3 Months', false),
        _pill('6 Months', true),
        _pill('1 Year', false),
        const Spacer(),
        _legend(Colors.green, 'Low'),
        _legend(Colors.orange, 'Medium'),
        _legend(Colors.red, 'High'),
      ],
    );
  }

  Widget _pill(String text, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: active ? Colors.blue : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: active ? Colors.white : Colors.black),
      ),
    );
  }

  Widget _legend(Color c, String t) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        children: [
          CircleAvatar(radius: 5, backgroundColor: c),
          const SizedBox(width: 4),
          Text(t),
        ],
      ),
    );
  }
}
