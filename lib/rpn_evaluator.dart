class RpnEvaluator{
  final List<String> rpn;
  RpnEvaluator(this.rpn);

  double evaluate(Map<String,double>variables){
    List<double>stack = [];

  for (String token in rpn) {
      // Число
      if (double.tryParse(token) != null) {
        stack.add(double.parse(token));
      }
      // Переменная
      else if (variables.containsKey(token)) {
        stack.add(variables[token]!);
      }
      // Оператор
      else {
        double b = stack.removeLast();
        double a = stack.removeLast();

        switch (token) {
          case '+':
            stack.add(a + b);
            break;
          case '-':
            stack.add(a - b);
            break;
          case '*':
            stack.add(a * b);
            break;
          case '/':
            stack.add(a / b);
            break;
        }
      }
    }  
    return stack.single;   

    }
  }
