import 'package:homework_1/rpn_evaluator.dart';
import 'package:test/test.dart';
import 'package:homework_1/expression_evaluator.dart';

void main() {
  group('ExpressionEvaluator - базовые проверки', () {
    test('1) 10*5+4/2-1 = 51', () {
      final evaluator = ExpressionEvaluator('10*5+4/2-1');
      final result = evaluator.evaluate(<String, double>{});
      expect(result, closeTo(51.0, 1e-9));
    });
    test('2) (x*3-5)/5 при x=10 => 5', () {
      final evaluator = ExpressionEvaluator('(x*3-5)/5');
      final vars = <String, double>{'x': 10.0};
      final result = evaluator.evaluate(vars);
      expect(result, closeTo(5.0, 1e-9));
    });

    test('3)3*x+15/(3+2) при x=10 => 33', () {
      final evaluator = ExpressionEvaluator("3*x+15/(3+2)");
      final vars = <String, double>{'x': 10.0};
      final result = evaluator.evaluate(vars);
      expect(result, closeTo(33.0, 1e-9));
    });

    test('4) Приоритет операций: 2+3*4 = 14', () {
      final evaluator = ExpressionEvaluator('2+3*4');
      final result = evaluator.evaluate(<String, double>{});
      expect(result, closeTo(14.0, 1e-9));
    });
    test('5) Скобки меняют порядок: (2+3)*4 = 20', () {
      final evaluator = ExpressionEvaluator('(2+3)*4');
      final result = evaluator.evaluate(<String, double>{});
      expect(result, closeTo(20.0, 1e-9));
    });
  });
}
