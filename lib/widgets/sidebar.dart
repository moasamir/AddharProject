import 'package:flutter/material.dart';
import '../layout/dashboard_layout.dart';

class Sidebar extends StatelessWidget {
  final DashboardPage selected;
  final Function(DashboardPage) onSelect;

  const Sidebar({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  Widget _item(
      IconData icon,
      String label,
      DashboardPage page,
      ) {
    final active = selected == page;

    return InkWell(
      onTap: () => onSelect(page),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: active ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Text(label, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF1E2430),
      ),
      child: Column(
        children: [
          _item(Icons.remove_red_eye, 'Overview', DashboardPage.overview),
          _item(Icons.flash_on, 'Live Load', DashboardPage.liveLoad),
          _item(Icons.show_chart, 'Forecast', DashboardPage.forecast),
          _item(Icons.warning, 'Risk Zones', DashboardPage.riskZones),
          _item(Icons.settings, 'Decisions', DashboardPage.decisions),
        ],
      ),
    );
  }
}
