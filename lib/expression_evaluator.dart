import 'tokenizer.dart';
import 'shunting_yard.dart';
import 'rpn_evaluator.dart';

class ExpressionEvaluator {
  final String expression;
  ExpressionEvaluator(this.expression);

  double evaluate(Map<String, double> variables) {
    final tokens = Tokenizer(expression).tokenize();
    final rpn = ShuntingYard(tokens).toRPN();
    return RpnEvaluator(rpn).evaluate(variables);
  }
}
