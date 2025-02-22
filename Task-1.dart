import 'dart:io';

void main() {
  String input;
  var num1 , num2 , result;
  String operator = "";
  do {
    print("Enter first number : ");
    input = stdin.readLineSync()!;
    if (input == "exit")
      break;
    num1 = int.parse(input);
    print("Enter second number : ");
    input = stdin.readLineSync()!;
    num2 = int.parse(input);
    print("Enter an operator (+, -, *, /): ");
    operator = stdin.readLineSync()!;
    switch (operator) {
      case '+':
        result = num1 + num2;
        print("Sum: ${result}");
        break;
      case '-':
        result = num1 - num2;
        print("Difference: ${result}");
        break;
      case '*':
        result = num1 * num2;
        print("Product: ${result}");
        break;
      case '/':
        if (num2 == 0) {
          print("Error: Division by zero is not allowed");
        } else {
          result = num1 / num2 ;
          print("Quotient: ${result}");
        }
        break;
    }
  } while (input != "exit");
  print("Program Ended!");
}
