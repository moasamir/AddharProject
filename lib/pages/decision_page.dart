import 'package:flutter/material.dart';

class DecisionsPage extends StatelessWidget {
  const DecisionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Decision Support',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Recommended operational actions based on current data',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 24),

          _decision(
            'Deploy Temporary Enrollment Centers',
            'High load detected in UP & Maharashtra',
            Icons.location_city,
            Colors.red,
          ),
          _decision(
            'Increase Authentication Capacity',
            'Expected surge during peak hours',
            Icons.flash_on,
            Colors.orange,
          ),
          _decision(
            'Schedule Maintenance',
            'Low activity window detected at night',
            Icons.build,
            Colors.green,
          ),
          _decision(
            'Alert State Authorities',
            'Critical stress threshold crossed',
            Icons.warning,
            Colors.deepPurple,
          ),
        ],
      ),
    );
  }

  Widget _decision(
      String title,
      String desc,
      IconData icon,
      Color color,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 6),
                Text(desc,
                    style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('EXECUTE'),
          ),
        ],
      ),
    );
  }
}
