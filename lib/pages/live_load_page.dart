import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class LiveLoadPage extends StatefulWidget {
  const LiveLoadPage({super.key});

  @override
  State<LiveLoadPage> createState() => _LiveLoadPageState();
}

class _LiveLoadPageState extends State<LiveLoadPage> {
  final rnd = Random();
  late Timer timer;

  int nationalLoad = 320000;
  int authPerMin = 4200;
  int activeCenters = 1380;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      setState(() {
        nationalLoad += rnd.nextInt(15000) - 7000;
        authPerMin += rnd.nextInt(400) - 200;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Color get loadColor {
    if (nationalLoad > 500000) return Colors.red;
    if (nationalLoad > 350000) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Live Aadhaar Operations',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Real-time authentication & enrollment monitoring',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              _kpi(
                'National Load',
                '${(nationalLoad / 1000).toStringAsFixed(0)}K',
                Icons.public,
                loadColor,
              ),
              const SizedBox(width: 16),
              _kpi(
                'Auth / Min',
                authPerMin.toString(),
                Icons.flash_on,
                Colors.blue,
              ),
              const SizedBox(width: 16),
              _kpi(
                'Active Centers',
                activeCenters.toString(),
                Icons.location_city,
                Colors.green,
              ),
            ],
          ),

          const SizedBox(height: 28),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'National Load Pressure',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 14),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: (nationalLoad / 600000).clamp(0, 1),
                    minHeight: 14,
                    backgroundColor: Colors.grey.shade200,
                    color: loadColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  nationalLoad > 450000
                      ? '⚠ Critical load detected'
                      : 'System operating normally',
                  style: TextStyle(
                    color: loadColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'High Activity Zones',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _ZoneRow('Uttar Pradesh', 'HIGH'),
                _ZoneRow('Maharashtra', 'HIGH'),
                _ZoneRow('Tamil Nadu', 'MEDIUM'),
                _ZoneRow('Delhi NCR', 'HIGH'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _kpi(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 10),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 6),
            Text(
              value,
              style:
              const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class _ZoneRow extends StatelessWidget {
  final String state;
  final String risk;
  const _ZoneRow(this.state, this.risk);

  @override
  Widget build(BuildContext context) {
    final color =
    risk == 'HIGH' ? Colors.red : risk == 'MEDIUM' ? Colors.orange : Colors.green;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(state)),
          Text(
            risk,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
