import 'package:flutter/foundation.dart';

class NumberGridModel extends ChangeNotifier {
  String _currentRule = 'None';
  String get currentRule => _currentRule;

  void changeRule(String rule) {
    _currentRule = rule;
    notifyListeners();
  }

  bool isHighlighted(int number) {
    switch (_currentRule) {
      case 'Odd':
        return number % 2 != 0;
      case 'Even':
        return number % 2 == 0;
      case 'Prime':
        return _isPrime(number);
      case 'Fibonacci':
        return _isFibonacci(number);

      default:
        return false;
    }
  }

  void resetGrid() {
    _currentRule = 'None';
    notifyListeners();
  }

  bool _isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  bool _isFibonacci(int number) {
    int a = 0, b = 1;
    while (b < number) {
      int temp = b;
      b = a + b;
      a = temp;
    }
    return b == number;
  }
}