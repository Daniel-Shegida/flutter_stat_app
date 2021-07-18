import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../utils/global_data.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  late List<Data> _data;
  late TooltipBehavior _tooltipBegavior;

  @override
  void initState() {
    _data = getChartData();
    _tooltipBegavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SfCartesianChart(
            title: ChartTitle(text: "Гистограмма"),
            tooltipBehavior: _tooltipBegavior,
            series: <ChartSeries>[
              LineSeries<Data, double>(
                  name: 'точка',
                  dataSource: _data,
                  xValueMapper: (Data dotes, _) => dotes.value,
                  yValueMapper: (Data dotes, _) => dotes.number,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  enableTooltip: true)
            ],
            primaryXAxis: NumericAxis(
                edgeLabelPlacement: EdgeLabelPlacement.shift),
          ),
        ));
  }

  List<Data> getChartData() {
    List<Data> chartData = [
      for (int index = 0; index < table_data.length; index++) Data
      (double.parse(table_data[index][0]),
          int.parse(table_data[index][0]))
    ];

    return chartData;
  }
}

class Data {
  Data(this.value, this.number);

  final double value;
  final int number;
}
