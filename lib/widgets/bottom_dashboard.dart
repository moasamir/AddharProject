import 'package:flutter/material.dart';
import 'bottom_line_chart.dart';
import 'package:mapproject/map/state_data.dart';

class BottomDashboard extends StatefulWidget {
  const BottomDashboard({super.key});

  @override
  State<BottomDashboard> createState() => _BottomDashboardState();
}

class _BottomDashboardState extends State<BottomDashboard> {
  TimeRange selectedRange = TimeRange.m6;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Decision Support',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 750,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _actionBtn(
                            color: Colors.blue,
                            icon: Icons.group_add,
                            text: 'Deploy Extra Staff\n+200',
                          ),
                          const SizedBox(width: 10),
                          _actionBtn(
                            color: Colors.orange,
                            icon: Icons.account_balance,
                            text: 'Open Temporary\nAadhaar Centers',
                          ),
                          const SizedBox(width: 10),
                          _actionBtn(
                            color: Colors.red,
                            icon: Icons.description,
                            text: 'Send\nAdvisory',
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          _range('Last 3 Months', TimeRange.m3),
                          _range('6 Months', TimeRange.m6),
                          _range('1 Year', TimeRange.y1),

                          const SizedBox(width: 300),

                          const _StatusItem(color: Colors.green, text: 'Low'),
                          const SizedBox(width: 14),
                          const _StatusItem(color: Colors.orange, text: 'Medium'),
                          const SizedBox(width: 14),
                          const _StatusItem(color: Colors.red, text: 'High'),

                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 16),

                // Chart
                Expanded(
                  child: BottomLineChart(
                    range: selectedRange,
                    action: DecisionAction.staff,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Range Button
  Widget _range(String text, TimeRange range) {
    final active = selectedRange == range;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () => setState(() => selectedRange = range),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: active ? Colors.blue.shade50 : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: active ? Colors.blue : Colors.grey.shade300,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: active ? Colors.blue : Colors.black87,
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  // Action button
  Widget _actionBtn({
    required Color color,
    required IconData icon,
    required String text,
  }) {
    return Expanded(
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

// Dot
class _StatusDot extends StatelessWidget {
  final Color color;
  const _StatusDot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _StatusItem extends StatelessWidget {
  final Color color;
  final String text;

  const _StatusItem({
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
