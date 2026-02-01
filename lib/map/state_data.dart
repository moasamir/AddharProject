import 'package:flutter/material.dart';

enum StressStatus { low, medium, high }
enum TimeRange {
  m3,
  m6,
  y1,
}

enum DecisionAction {
  staff,
  temporary,
  advisory,
}

class StateInfo {
  final String name;
  final double dx; // % based
  final double dy; // % based
  final StressStatus status;
  final int expectedLoad;

  StateInfo({
    required this.name,
    required this.dx,
    required this.dy,
    required this.status,
    required this.expectedLoad,
  });

  Color get statusColor {
    switch (status) {
      case StressStatus.low:
        return Colors.green;
      case StressStatus.medium:
        return Colors.orange;
      case StressStatus.high:
        return Colors.red;
    }
  }
}

/// All State Data
final List<StateInfo> states = [
  StateInfo(name: 'Andhra Pradesh', dx: 0.44, dy: 0.75, status: StressStatus.high, expectedLoad: 480000, ),
  StateInfo(name: 'Arunachal Pradesh', dx: 0.65, dy: 0.28, status: StressStatus.low, expectedLoad: 90000),
  StateInfo(name: 'Assam', dx: 0.63, dy: 0.35, status: StressStatus.medium, expectedLoad: 210000),
  StateInfo(name: 'Bihar', dx: 0.54, dy: 0.39, status: StressStatus.high, expectedLoad: 360000),
  StateInfo(name: 'Chhattisgarh', dx: 0.48, dy: 0.53, status: StressStatus.medium, expectedLoad: 240000),
  StateInfo(name: 'Goa', dx: 0.35, dy: 0.72, status: StressStatus.low, expectedLoad: 80000),
  StateInfo(name: 'Gujarat', dx: 0.31, dy: 0.50, status: StressStatus.medium, expectedLoad: 310000),
  StateInfo(name: 'Haryana', dx: 0.39, dy: 0.26, status: StressStatus.medium, expectedLoad: 220000),
  StateInfo(name: 'Himachal Pradesh', dx: 0.41, dy: 0.17, status: StressStatus.low, expectedLoad: 110000),
  StateInfo(name: 'Jharkhand', dx: 0.53, dy: 0.45, status: StressStatus.medium, expectedLoad: 200000),
  StateInfo(name: 'Karnataka', dx: 0.39, dy: 0.73, status: StressStatus.high, expectedLoad: 420000),
  StateInfo(name: 'Kerala', dx: 0.39, dy: 0.90, status: StressStatus.medium, expectedLoad: 260000),
  StateInfo(name: 'Madhya Pradesh', dx: 0.44, dy: 0.49, status: StressStatus.high, expectedLoad: 390000),
  StateInfo(name: 'Maharashtra', dx: 0.38, dy: 0.62, status: StressStatus.high, expectedLoad: 520000),
  StateInfo(name: 'Manipur', dx: 0.65, dy: 0.41, status: StressStatus.low, expectedLoad: 70000),
  StateInfo(name: 'Meghalaya', dx: 0.61, dy: 0.38, status: StressStatus.low, expectedLoad: 65000),
  StateInfo(name: 'Mizoram', dx: 0.64, dy: 0.45, status: StressStatus.low, expectedLoad: 60000),
  StateInfo(name: 'Nagaland', dx: 0.66, dy: 0.35, status: StressStatus.low, expectedLoad: 60000),
  StateInfo(name: 'Odisha', dx: 0.53, dy: 0.53, status: StressStatus.medium, expectedLoad: 280000),
  StateInfo(name: 'Punjab', dx: 0.38, dy: 0.22, status: StressStatus.medium, expectedLoad: 230000),
  StateInfo(name: 'Rajasthan', dx: 0.35, dy: 0.39, status: StressStatus.high, expectedLoad: 410000),
  StateInfo(name: 'Sikkim', dx: 0.57, dy: 0.32, status: StressStatus.low, expectedLoad: 50000),
  StateInfo(name: 'Tamil Nadu', dx: 0.42, dy: 0.85, status: StressStatus.high, expectedLoad: 470000),
  StateInfo(name: 'Telangana', dx: 0.44, dy: 0.62, status: StressStatus.medium, expectedLoad: 320000),
  StateInfo(name: 'Tripura', dx: 0.62, dy: 0.44, status: StressStatus.low, expectedLoad: 75000),
  StateInfo(name: 'Uttar Pradesh', dx: 0.46, dy: 0.37, status: StressStatus.high, expectedLoad: 600000),
  StateInfo(name: 'Uttarakhand', dx: 0.44, dy: 0.25, status: StressStatus.medium, expectedLoad: 150000),
  StateInfo(name: 'West Bengal', dx: 0.57, dy: 0.47, status: StressStatus.high, expectedLoad: 450000),
  StateInfo(name: 'Delhi', dx: 0.41, dy: 0.29, status: StressStatus.high, expectedLoad: 1000000),
  StateInfo(name: 'Kashmir', dx: 0.38, dy: 0.13, status: StressStatus.low, expectedLoad: 21000),
  StateInfo(name: 'Ladakh', dx: 0.42, dy: 0.10, status: StressStatus.medium, expectedLoad: 320000),
];