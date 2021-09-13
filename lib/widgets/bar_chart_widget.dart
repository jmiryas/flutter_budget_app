import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

class _BarChart extends StatelessWidget {
  final List<double> expenses;

  const _BarChart({required this.expenses, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        alignment: BarChartAlignment.spaceAround,
        maxY: expenses.reduce(max),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: -4,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.y.round().toString(),
              const TextStyle(
                color: Color(0xff7589a2),
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff7589a2),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          margin: 20,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'Su';
              case 1:
                return 'Mo';
              case 2:
                return 'Tu';
              case 3:
                return 'We';
              case 4:
                return 'Th';
              case 5:
                return 'Fr';
              case 6:
                return 'Sa';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(showTitles: true),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => expenses.asMap().entries.map((e) {
        return BarChartGroupData(
          x: e.key,
          barRods: [
            BarChartRodData(y: e.value, colors: [Colors.green], width: 20.0)
          ],
          showingTooltipIndicators: [0],
        );
      }).toList();
}

class BarChartWidget extends StatelessWidget {
  final List<double> expenses;

  const BarChartWidget({required this.expenses, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const Text(
            "Weekly Spending",
            style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
                iconSize: 25.0,
              ),
              const Text(
                "10 Nov 2021 - 16 Nov 2021",
                style: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward),
                iconSize: 25.0,
              )
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          AspectRatio(
            aspectRatio: 1.4,
            child: _BarChart(expenses: expenses),
          )
        ],
      ),
    );
  }
}
