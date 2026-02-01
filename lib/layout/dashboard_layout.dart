import 'package:flutter/material.dart';

import '../widgets/sidebar.dart';
import '../widgets/topbar.dart';
import '../widgets/map_card.dart';
import '../widgets/right_panel.dart';
import '../widgets/bottom_dashboard.dart';

import '../pages/live_load_page.dart';
import '../pages/forecast_page.dart';
import '../pages/risk_zones_page.dart';
import '../pages/decision_page.dart';

import '../map/state_data.dart';

enum DashboardPage {
  overview,
  liveLoad,
  forecast,
  riskZones,
  decisions,
}

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({super.key});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  DashboardPage currentPage = DashboardPage.overview;
  StateInfo? selectedState;

  Widget _buildContent() {
    switch (currentPage) {
      case DashboardPage.liveLoad:
        return const LiveLoadPage();

      case DashboardPage.forecast:
        return const ForecastPage();

      case DashboardPage.riskZones:
        return const RiskZonesPage();

      case DashboardPage.decisions:
        return const DecisionsPage();

      case DashboardPage.overview:
      default:
        return Column(
          children: [
            // Right panel
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MapCard(
                      onStateSelected: (state) {
                        setState(() => selectedState = state);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 320,
                    child: RightPanel(
                      state: selectedState,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 6),

            // Bottom
            const SizedBox(
              height: 165,
              child: BottomDashboard(),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f5fb),
      body: Row(
        children: [
          // Sidebar
          Sidebar(
            selected: currentPage,
            onSelect: (page) {
              setState(() => currentPage = page);
            },
          ),

          Expanded(
            child: Column(
              children: [
                const TopBar(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: _buildContent(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
