import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mapproject/map/state_data.dart';

class BottomLineChart extends StatelessWidget {
  final TimeRange range;
  final DecisionAction action;

  const BottomLineChart({
    super.key,
    required this.range,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> spots = _spots();

    final double maxDataY =
    spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);

    final double calculatedMaxY = (maxDataY / 50).ceil() * 50;
    final double interval = calculatedMaxY / 3;

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: spots.length.toDouble() - 1,
        minY: 0,
        maxY: calculatedMaxY,

        // Grid
        gridData: FlGridData(
          show: true,
          horizontalInterval: interval,
          getDrawingHorizontalLine: (_) => FlLine(
            color: Colors.grey.shade300,
            dashArray: [6, 4],
          ),
        ),

        // Hover
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((spot) {
                return LineTooltipItem(
                  '${spot.y.toInt()}K',
                  const TextStyle(color: Colors.white),
                );
              }).toList();
            },
          ),
        ),

        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),

          // Number K
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: interval,
              reservedSize: 36,
              getTitlesWidget: (value, meta) {
                if (value == 0) return const SizedBox();
                return Text(
                  '${value.toInt()}K',
                  style: const TextStyle(fontSize: 11),
                );
              },
            ),
          ),

          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                const months = [
                  'Jan','Feb','Mar','Apr','May','Jun',
                  'Jul','Aug','Sep','Oct','Nov','Dec'
                ];
                return Text(
                  months[value.toInt() % 12],
                  style: const TextStyle(fontSize: 11),
                );
              },
            ),
          ),
        ),

        borderData: FlBorderData(show: false),

        // Line Area
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            barWidth: 3,
            color: Colors.blue,
            dotData: const FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.withOpacity(0.35),
                  Colors.blue.withOpacity(0.05),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Data

  List<FlSpot> _spots() {
    switch (range) {
      case TimeRange.m3:
        return const [
          FlSpot(0, 120),
          FlSpot(1, 150),
          FlSpot(2, 180),
        ];

      case TimeRange.m6:
        return const [
          FlSpot(0, 120),
          FlSpot(1, 150),
          FlSpot(2, 180),
          FlSpot(3, 220),
          FlSpot(4, 260),
          FlSpot(5, 300),
        ];

      case TimeRange.y1:
      default:
        return const [
          FlSpot(0, 120),
          FlSpot(1, 140),
          FlSpot(2, 160),
          FlSpot(3, 190),
          FlSpot(4, 220),
          FlSpot(5, 250),
          FlSpot(6, 280),
          FlSpot(7, 310),
          FlSpot(8, 350),
          FlSpot(9, 380),
          FlSpot(10, 420),
          FlSpot(11, 470),
        ];
    }
  }
}
