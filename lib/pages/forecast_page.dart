import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '📈 Load Forecast & Predictions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Projected Aadhaar load based on trends & seasonality',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              _forecastCard(
                title: 'Next 7 Days',
                value: '+12%',
                subtitle: 'Expected increase',
                color: Colors.orange,
                icon: Icons.trending_up,
              ),
              const SizedBox(width: 16),
              _forecastCard(
                title: 'Peak Month',
                value: 'April',
                subtitle: 'Highest stress',
                color: Colors.red,
                icon: Icons.warning,
              ),
              const SizedBox(width: 16),
              _forecastCard(
                title: 'Risk States',
                value: '5',
                subtitle: 'High probability',
                color: Colors.deepPurple,
                icon: Icons.location_on,
              ),
            ],
          ),

          const SizedBox(height: 24),

          Container(
            height: 360,
            padding: const EdgeInsets.all(20),
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
                  'National Load Forecast (Next 6 Months)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Expanded(child: _forecastChart()),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.06),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _forecastChart() {
    return LineChart(
      LineChartData(
        minY: 120,
        maxY: 460,
        gridData: FlGridData(
          show: true,
          horizontalInterval: 80,
          drawVerticalLine: false,
        ),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          rightTitles:
          AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:
          AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 80,
              reservedSize: 40,
              getTitlesWidget: (v, _) => Text('${v.toInt()}K',
                  style: const TextStyle(fontSize: 11)),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (v, _) {
                const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                return Text(months[v.toInt()],
                    style: const TextStyle(fontSize: 11));
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            barWidth: 3,
            color: Colors.blue,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              color: Colors.blue.withOpacity(0.15),
            ),
            spots: const [
              FlSpot(0, 160),
              FlSpot(1, 190),
              FlSpot(2, 230),
              FlSpot(3, 280),
              FlSpot(4, 330),
              FlSpot(5, 420),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _forecastCard({
    required String title,
    required String value,
    required String subtitle,
    required Color color,
    required IconData icon,
  }) {
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
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 6),
            Text(value,
                style:
                const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle,
                style: TextStyle(
                    fontSize: 12,
                    color: color,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
