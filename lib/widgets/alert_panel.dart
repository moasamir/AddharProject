import 'package:flutter/material.dart';
import '../map/state_data.dart';

class AlertPanel extends StatelessWidget {
  final StateInfo? state;
  const AlertPanel({super.key, this.state});

  @override
  Widget build(BuildContext context) {
    if (state == null) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Alerts',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Icon(Icons.keyboard_arrow_down, size: 18),
          ],
        ),

        const Divider(),

        _alert(
          '11:16 am',
          'High stress predicted in ${state!.name} NCR',
          'Migration-driven spike',
        ),

        const SizedBox(height: 10),

        _alert(
          '10:02 am',
          'Seasonal spike expected in Bihar',
          '',
        ),
      ],
    );
  }

  Widget _alert(String time, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.warning_amber_rounded,
            color: Colors.orange, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(time, style: const TextStyle(color: Colors.grey)),
              Text(title,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              if (subtitle.isNotEmpty)
                Text(subtitle,
                    style:
                    const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
