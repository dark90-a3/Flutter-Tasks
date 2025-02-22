import 'dart:io';

void main() {
  int remainingSeats = 12;
  int busCount = 1;
  int groupSize;
  do {
    print("Enter the group size: ");
    groupSize = int.parse(stdin.readLineSync()!);
    if (groupSize == 0) {
      print("All buses are handled. Program ended.");
      return;
    } else if (groupSize > remainingSeats) {
      print("Not enough seats! Moving to the next bus.");
      busCount++;
      remainingSeats = 12 - groupSize;
      print("New Bus started: $busCount");
      print("Remaining seats: $remainingSeats");
    } else {
      print("Group of $groupSize seats on Bus $busCount");
      remainingSeats -= groupSize;
      print("Remaining seats: $remainingSeats");
    }
  } while (groupSize > 0);
}
