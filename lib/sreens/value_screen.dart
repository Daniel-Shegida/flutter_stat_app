import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import '../utils/global_data.dart';

class strInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text("Медиана - $mediana", style: TextStyle(fontSize: 26)),
        ),
        Container(
          child: Text("Мода - $Moda", style: TextStyle(fontSize: 26)),
        ),
        Container(
          child: Text("Среднее значение - $midle", style: TextStyle(fontSize: 26)),
        ),
        Container(
          child: Text("Дисперсия - $disp", style: TextStyle(fontSize: 26)),
        ),
        Container(
          child: Text("Отклонение - $deviation", style: TextStyle(fontSize: 26)),
        ),
      ],
    );

    throw UnimplementedError();
  }
}
