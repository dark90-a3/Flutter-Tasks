import 'dart:io';

void main() {
  stdout.write("Enter the numerator: ");
  String numeratorInput = stdin.readLineSync()!;
  num numerator = num.parse(numeratorInput);
  stdout.write("Enter the denominator: ");
  String denominatorInput = stdin.readLineSync()!;
  num? denominator =
      denominatorInput.isEmpty ? null : num.parse(denominatorInput);
  DivisionResult result = safeDivide(numerator, denominator);
  print("Result: ${result.message}");
}

class DivisionResult {
  final double? value;
  final String message;

  DivisionResult.success(this.value) : message = "Division result: $value";

  DivisionResult.error(this.message) : value = null;
}

DivisionResult safeDivide(num numerator, num? denominator) {
  if (denominator == null || denominator == 0) {
    return DivisionResult.error("Cannot divide by zero!");
  }
  return DivisionResult.success(numerator / denominator);
}
