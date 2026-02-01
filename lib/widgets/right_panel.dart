import 'package:flutter/material.dart';
import '../map/state_data.dart';
import 'alert_panel.dart';
import 'right_load_chart.dart';

class RightPanel extends StatelessWidget {
  final StateInfo? state;

  const RightPanel({
    super.key,
    this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            state?.name ?? 'Select a state',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          AlertPanel(state: state),
          const SizedBox(height: 15),
          RightLoadChart(state: state),
        ],
      ),
    );
  }
}