import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import '../utils/calculation.dart';

class GetScreen extends StatelessWidget {
  final TextEditingController intervalController = new TextEditingController();
  final TextEditingController minController = new TextEditingController();
  final TextEditingController maxController = new TextEditingController();
  final TextEditingController statController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                    controller: intervalController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Интервал",
                    ),
                    keyboardType: TextInputType.number),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: minController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Минимум",
                  ),
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: maxController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Максимум",
                  ),
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                ),
              ),
            ),
          ],
        ),
        Container(
          child: TextField(
            controller: statController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Выборка",
              hintStyle: TextStyle(
                height: 2.8,
              ),
            ),

            keyboardType:
                TextInputType.numberWithOptions(signed: true, decimal: true),
            minLines: 3,
            //Normal textInputField will be displayed
            maxLines: 6,
          ),
        ),
        Container(
            child: TextButton(
          onPressed: () => {
            calculate(
              intervalController.text,
              minController.text,
              maxController.text,
              statController.text,
            )
          },
          child: Text("обработка данных"),
        )),
      ],
    );
  }
}
