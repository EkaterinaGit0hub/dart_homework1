class Tokenizer {
  final String expression;
  Tokenizer(this.expression);

  List<String> tokenize() {
    List<String> tokens = [];
    StringBuffer buffer = StringBuffer();

    void flush() {
      if (buffer.isNotEmpty) {
        tokens.add(buffer.toString());
        buffer.clear();
      }
    }

    for (int i = 0; i < expression.length; i++) {
      String char = expression[i];

      if (char.trim().isEmpty) {
        // пробелы — завершают текущий токен
        flush();
        continue;
      }

      if (RegExp(r'[0-9.]').hasMatch(char)) {
        buffer.write(char);
      } else if (RegExp(r'[a-zA-Z_]').hasMatch(char)) {
        buffer.write(char);
      } else if ('+-*/()'.contains(char)) {
        flush();
        tokens.add(char);
      } else {
        throw Exception('Недопустимый символ: $char');
      }
    }
    flush();
    return tokens;
  }
}
