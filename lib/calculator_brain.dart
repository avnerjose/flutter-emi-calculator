import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi = 0;

  CalculatorBrain({required this.height, required this.weight});

  double calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi;
  }

  String getResult() {
    if (_bmi > 0 && _bmi < 18.5) {
      return "Abaixo do peso";
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return "Peso normal";
    } else if (_bmi >= 25 && _bmi < 30) {
      return "Sobrepeso";
    } else if (_bmi >= 30 && _bmi < 40) {
      return "Obesidade";
    } else if (_bmi >= 40) {
      return "Obesidade grave";
    }

    return "";
  }
}
