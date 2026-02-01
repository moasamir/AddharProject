import 'package:flutter/material.dart';
import '../map/state_data.dart';

class RiskZonesPage extends StatelessWidget {
  const RiskZonesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final highRisk =
    states.where((s) => s.status == StressStatus.high).toList();
    final mediumRisk =
    states.where((s) => s.status == StressStatus.medium).toList();
    final lowRisk =
    states.where((s) => s.status == StressStatus.low).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.warning_amber_rounded,
                  color: Colors.redAccent, size: 28),
              SizedBox(width: 8),
              Text(
                'Risk Zones Overview',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              _summaryCard(
                title: 'High Risk',
                count: highRisk.length,
                color: Colors.red,
                icon: Icons.trending_up,
              ),
              const SizedBox(width: 16),
              _summaryCard(
                title: 'Medium Risk',
                count: mediumRisk.length,
                color: Colors.orange,
                icon: Icons.trending_flat,
              ),
              const SizedBox(width: 16),
              _summaryCard(
                title: 'Low Risk',
                count: lowRisk.length,
                color: Colors.green,
                icon: Icons.trending_down,
              ),
            ],
          ),

          const SizedBox(height: 32),

          _sectionTitle('High Risk States'),
          _riskList(highRisk),

          const SizedBox(height: 24),

          _sectionTitle('Medium Risk States'),
          _riskList(mediumRisk),

          const SizedBox(height: 24),

          _sectionTitle('Low Risk States'),
          _riskList(lowRisk),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _riskList(List<StateInfo> list) {
    if (list.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8),
        child: Text('No data available'),
      );
    }

    return Column(
      children: list.map((state) {
        return Container(
          margin: const EdgeInsets.only(top: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: state.statusColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Expected Load: ${_format(state.expectedLoad)}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: state.statusColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  state.status.name.toUpperCase(),
                  style: TextStyle(
                    color: state.statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String _format(int v) {
    if (v >= 1000000) return '${(v / 1000000).toStringAsFixed(1)}M';
    if (v >= 1000) return '${(v / 1000).toStringAsFixed(0)}K';
    return v.toString();
  }

  // Summary Card
  Widget _summaryCard({
    required String title,
    required int count,
    required Color color,
    required IconData icon,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              count.toString(),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
