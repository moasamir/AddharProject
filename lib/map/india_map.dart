import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IndiaMap extends StatelessWidget {
  final Function(String stateCode) onStateTap;

  const IndiaMap({
    super.key,
    required this.onStateTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/maps/india_states.svg',
              fit: BoxFit.contain,
              width: constraints.maxWidth,
              height: constraints.maxHeight,
            ),

            _dot(
              left: constraints.maxWidth * 0.55,
              top: constraints.maxHeight * 0.45,
              color: Colors.red,
              onTap: () => onStateTap('MH'),
            ),
            _dot(
              left: constraints.maxWidth * 0.50,
              top: constraints.maxHeight * 0.55,
              color: Colors.orange,
              onTap: () => onStateTap('KA'),
            ),
            _dot(
              left: constraints.maxWidth * 0.60,
              top: constraints.maxHeight * 0.35,
              color: Colors.green,
              onTap: () => onStateTap('UP'),
            ),
          ],
        );
      },
    );
  }

  Widget _dot({
    required double left,
    required double top,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
