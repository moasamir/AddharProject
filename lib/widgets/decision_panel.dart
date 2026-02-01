import 'package:flutter/material.dart';

class DecisionPanel extends StatelessWidget {
  const DecisionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Decision Support',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _actionButton(
                color: Colors.blue,
                icon: Icons.group_add,
                title: 'Deploy Extra Staff',
                sub: '+200',
              ),
              const SizedBox(width: 12),
              _actionButton(
                color: Colors.orange,
                icon: Icons.store_mall_directory,
                title: 'Open Temporary\nAadhaar Centers',
              ),
              const SizedBox(width: 12),
              _actionButton(
                color: Colors.red,
                icon: Icons.campaign,
                title: 'Send Advisory',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required Color color,
    required IconData icon,
    required String title,
    String? sub,
  }) {
    return Expanded(
      child: Container(
        height: 95,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            if (sub != null)
              Text(sub, style: const TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}