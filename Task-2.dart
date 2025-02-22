import 'dart:io';

void main() {
  print("Enter the number of rows : ");
  int rows = int.parse(stdin.readLineSync()!);
  for (int i = 1; i <= rows; i++) {
    String pattern = "";
    for (int j = 1; j <= i; j++) {
      pattern += "* ";
    }
    print(pattern);
  }
}
