//обратную польскую запись (RPN)

class ShuntingYard {
  final List<String> tokens;

 ShuntingYard(this.tokens);

  static const Map<String, int> priority = {'+': 1, '-': 1, '*': 2, '/': 2};

  List<String> toRPN() {
    List<String> output = [];
    List<String> operators = [];

    for (String token in tokens) {
      if (double.tryParse(token) != null) {
        output.add(token);
      } else if (RegExp(r"[a-zA-Z_]").hasMatch(token)) {
        output.add(token);
      } else if (priority.containsKey(token)) {
        while (operators.isNotEmpty &&
            priority.containsKey(operators.last) &&
            priority[operators.last]! >= priority[token]!) {
          output.add(operators.removeLast());
        }
        operators.add(token);
      } else if (token == '(') {
        operators.add(token);
      } else if (token == ')') {
        while (operators.isNotEmpty && operators.last != '(') {
          output.add(operators.removeLast());
        }
        operators.removeLast(); // удаляем "("
      }
    }
    while (operators.isNotEmpty) {
      output.add(operators.removeLast());
    }
    return output;
  }
}
