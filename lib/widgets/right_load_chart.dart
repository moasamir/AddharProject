import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../map/state_data.dart';

class RightLoadChart extends StatelessWidget {
  final StateInfo? state;
  const RightLoadChart({super.key, this.state});

  @override
  Widget build(BuildContext context) {
    if (state == null) return const SizedBox();

    // 🔢 dynamic values per state
    final jan = state!.expectedLoad * 0.5;
    final feb = state!.expectedLoad * 0.7;
    final mar = state!.expectedLoad * 0.95;

    final maxY = (state!.expectedLoad * 1.1).toDouble();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Load Forecast',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),

        const SizedBox(height: 12),

        /// Chart
        SizedBox(
          height: 170,
          child: BarChart(
            BarChartData(
              maxY: maxY / 1000,
              alignment: BarChartAlignment.spaceAround,

              /// Chart Hover
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.black,
                  getTooltipItem: (g, _, rod, __) {
                    return BarTooltipItem(
                      '${rod.toY.toInt()}K',
                      const TextStyle(color: Colors.white),
                    );
                  },
                ),
              ),

              /// Grid
              gridData: FlGridData(
                show: true,
                horizontalInterval: (maxY / 3) / 1000,
                drawVerticalLine: true,
                getDrawingHorizontalLine: (_) => FlLine(
                  color: Colors.grey.shade300,
                  dashArray: [6, 6],
                ),
                getDrawingVerticalLine: (_) => FlLine(
                  color: Colors.grey.shade200,
                  dashArray: [6, 6],
                ),
              ),

              borderData: FlBorderData(show: false),

              titlesData: FlTitlesData(
                topTitles:
                AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                AxisTitles(sideTitles: SideTitles(showTitles: false)),

                /// Number K
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 42,
                    interval: (maxY / 3) / 1000,
                    getTitlesWidget: (v, _) {
                      return Text(
                        '${v.toInt()}K',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),

                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (v, _) {
                      return Text(
                        ['Jan', 'Feb', 'Mar'][v.toInt()],
                        style: const TextStyle(fontSize: 12),
                      );
                    },
                  ),
                ),
              ),

              barGroups: [
                _bar(0, jan, Colors.blue),
                _bar(1, feb, Colors.orange),
                _bar(2, mar, Colors.red),
              ],
            ),
            swapAnimationDuration:
            const Duration(milliseconds: 700), // smooth feel
          ),
        ),

        const SizedBox(height: 8),

        Row(
          children: const [
            Icon(Icons.circle, size: 6, color: Colors.red),
            SizedBox(width: 6),
            Text(
              'Delhi expected to hit overload by March 10',
              style: TextStyle(color: Colors.red, fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }

  BarChartGroupData _bar(int x, double value, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value / 1000,
          width: 26,
          borderRadius: BorderRadius.zero,
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              color.withOpacity(0.65),
              color,
            ],
          ),
        ),
      ],
    );
  }
}
