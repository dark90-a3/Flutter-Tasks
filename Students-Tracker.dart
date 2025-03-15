import 'dart:io';

void main() {
  Map<String, double> studentGrades = {};
  while (true) {
    stdout.write("Enter student name (or 'done' to finish): ");
    String name = stdin.readLineSync()!.trim();
    if (name.toLowerCase() == 'done') {
      break;
    }
    stdout.write("Enter $name's grade: ");
    String gradeInput = stdin.readLineSync()!.trim();

    try {
      double grade = double.parse(gradeInput);
      if (grade < 0 || grade > 100) {
        print("Invalid grade. Please enter a value between 0 and 100.");
        continue;
      }
      studentGrades[name] = grade;
    } catch (e) {
      print("Invalid input. Please enter a numeric value.");
    }
  }

  if (studentGrades.isEmpty) {
    print("No students entered.");
    return;
  }

  Set<double> uniqueGrades = studentGrades.values.toSet();

  double highestGrade = uniqueGrades.reduce((a, b) => a > b ? a : b);
  double lowestGrade = uniqueGrades.reduce((a, b) => a < b ? a : b);

  double averageGrade =
      studentGrades.values.reduce((a, b) => a + b) / studentGrades.length;

  var sortedStudents =
      studentGrades.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

  var aboveAverageStudents =
      studentGrades.entries
          .where((entry) => entry.value > averageGrade)
          .map((entry) => entry.key)
          .toList();

  print("\nResults:");
  print(
    "Highest Grade: $highestGrade (${studentGrades.entries.firstWhere((entry) => entry.value == highestGrade).key})",
  );
  print(
    "Lowest Grade: $lowestGrade (${studentGrades.entries.firstWhere((entry) => entry.value == lowestGrade).key})",
  );
  print("Average Grade: ${averageGrade.toStringAsFixed(2)}");
  print(
    "Sorted Grades (High to Low): ${sortedStudents.map((e) => '${e.key} (${e.value})').join(', ')}",
  );
  print("Students Above Average: ${aboveAverageStudents.join(', ')}");
}
