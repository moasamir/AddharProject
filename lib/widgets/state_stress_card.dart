import 'package:flutter/material.dart';
import '../map/state_data.dart';

class StateStressCard extends StatelessWidget {
  final StateInfo state;

  const StateStressCard({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.warning,
                color: state.statusColor,
              ),
              const SizedBox(width: 8),
              Text(
                state.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            'Stress Level: ${state.status.name.toUpperCase()}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: state.statusColor,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            'Expected Peak Load: ${state.expectedLoad}',
            style: const TextStyle(fontSize: 13),
          ),

          const SizedBox(height: 10),

          const Text('• Predicted overload in 15 days'),
          const Text('• Migration-driven spike'),
        ],
      ),
    );
  }
}
