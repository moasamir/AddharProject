import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../map/state_data.dart';

class MapCard extends StatefulWidget {
  final Function(StateInfo) onStateSelected;
  const MapCard({super.key, required this.onStateSelected});

  @override
  State<MapCard> createState() => _MapCardState();
}

class _MapCardState extends State<MapCard> {
  StateInfo? hovered;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 12),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;

          return Stack(
            children: [
              /// Background image
              Positioned.fill(
                child: Opacity(
                  opacity: 0.18,
                  child: Image.asset(
                    'assets/images/map_bg.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              /// Svg
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Transform.scale(
                    scale: 1.05,
                    child: SvgPicture.asset(
                      'assets/maps/india_states.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              /// State dot
              ...states.map((s) {
                return Positioned(
                  left: s.dx * w,
                  top: s.dy * h,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) => setState(() => hovered = s),
                    onExit: (_) => setState(() => hovered = null),
                    child: GestureDetector(
                      onTap: () => widget.onStateSelected(s),
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: s.statusColor,
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),

              /// Bottom dot
              Positioned(
                left: 16,
                bottom: 16,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    LegendRow(color: Colors.green, text: 'Low'),
                    SizedBox(width: 14),
                    LegendRow(color: Colors.orange, text: 'Medium'),
                  ],
                ),
              ),


              /// Hover
              if (hovered != null)
                Positioned(
                  left: hovered!.dx * w + 20,
                  top: hovered!.dy * h - 20,
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      width: 260,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.warning,
                                color: hovered!.statusColor,
                                size: 18,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                hovered!.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Stress Level: ${hovered!.status.name.toUpperCase()}',
                            style: TextStyle(
                              color: hovered!.statusColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          const Divider(height: 18),
                          _bullet(
                            hovered!.status == StressStatus.high
                                ? 'Predicted overload in 15 days'
                                : 'Load within safe limits',
                            hovered!.statusColor,
                          ),
                          _bullet(
                            'Migration-driven spike',
                            Colors.orange,
                          ),

                          const SizedBox(height: 8),

                          Row(
                            children: [
                              const Icon(Icons.trending_up, size: 16),
                              const SizedBox(width: 6),
                              const Text(
                                'Expected Peak Load:',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${hovered!.expectedLoad.toString()}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _bullet(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

/// Bottom dot class
class LegendRow extends StatelessWidget {
  final Color color;
  final String text;

  const LegendRow({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
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
