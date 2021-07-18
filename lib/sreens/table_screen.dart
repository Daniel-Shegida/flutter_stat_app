import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_stat_app/widgets/scrollable_widget.dart';
import '../utils/global_data.dart';

class TableScreen extends StatefulWidget {
  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final colums = ['Знач', 'Част', 'Отн.част', 'Нак.част',
    ];
    return DataTable(columns: getColums(colums), rows: getRows(table_data));
  }

  List<DataColumn> getColums(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column, style: TextStyle(fontSize: 14)),
          ))
      .toList();

  List<DataRow> getRows(List<List<dynamic>> users) =>
      users.map((List<dynamic> list) {
        final cells = [list[0], list[1], list[2], list[3]];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();
}
