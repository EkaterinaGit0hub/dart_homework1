//интерпретатор математических выражений

import 'package:homework_1/expression_evaluator.dart';

void main(List<String> arguments) {
  final expression = arguments.isNotEmpty ? arguments.join(' ') : '10*5+4/2-1';

  final evaluator = ExpressionEvaluator(expression);

  final result = evaluator.evaluate(<String, double>{});

  print('Expression: $expression -> $result');
}
