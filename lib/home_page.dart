import 'dart:ui';

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'components/custom_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int height = 0;
  int weight = 0;
  double emi = 0;
  String emiResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Calculadora de IMC"),
        backgroundColor: const Color(0xFF0A0E22),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCard(
              title: "Altura",
              child: Column(children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "$height",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                      )),
                  const TextSpan(text: "cm"),
                ])),
                Slider(
                    min: 0,
                    max: 220,
                    thumbColor: const Color(0xFFe60645),
                    activeColor: Colors.white,
                    value: height.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        height = value.round();
                      });
                    }),
              ]),
            ),
            CustomCard(
              title: "Peso",
              child: Column(
                children: <Widget>[
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "$weight",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30,
                        )),
                    const TextSpan(text: "kg"),
                  ])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          child: const Icon(Icons.add),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            fixedSize: const Size(40, 40),
                            primary: const Color(0xFF4d4a5d),
                          ),
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          }),
                      ElevatedButton(
                          child: const Icon(Icons.remove),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            fixedSize: const Size(40, 40),
                            primary: const Color(0xFF4d4a5d),
                          ),
                          onPressed: () {
                            setState(() {
                              if (weight - 1 >= 0) {
                                weight--;
                              }
                            });
                          }),
                    ],
                  )
                ],
              ),
            ),
            if (emiResult != "")
              CustomCard(
                  title: "Resultado",
                  child: Column(
                    children: [
                      Text(emi.toStringAsFixed(2),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30,
                          )),
                      const SizedBox(height: 10),
                      Text(emiResult,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ))
                    ],
                  ))
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        child: Text("Calcular".toUpperCase()),
        style: ElevatedButton.styleFrom(
            primary: const Color(0xFFe60645),
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            )),
        onPressed: (height == 0 || weight == 0)
            ? null
            : () {
                CalculatorBrain calculatorBrain =
                    CalculatorBrain(height: height, weight: weight);
                setState(() {
                  emi = calculatorBrain.calculateBMI();
                  emiResult = calculatorBrain.getResult();
                });
              },
      ),
    );
  }
}
