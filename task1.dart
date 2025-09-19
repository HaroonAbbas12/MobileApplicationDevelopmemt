import 'dart:io';

void main() {
  stdout.write('Enter your name: ');
  String name = stdin.readLineSync() ?? 'User';

  stdout.write('Enter your age: ');
  int age = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  if (age < 18) {
    print('Sorry $name, you are not eligible to register.');
    return;
  }

  stdout.write('How many numbers will you enter? ');
  int n = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  List<int> numbers = [];
  for (int i = 0; i < n; i++) {
    stdout.write('Enter number ${i + 1}: ');
    numbers.add(int.tryParse(stdin.readLineSync() ?? '') ?? 0);
  }

  int sumEven = 0, sumOdd = 0;
  int largest = numbers[0], smallest = numbers[0];

  for (var num in numbers) {
    if (num % 2 == 0) sumEven += num;
    else sumOdd += num;

    if (num > largest) largest = num;
    if (num < smallest) smallest = num;
  }

  print('\n--- Results ---');
  print('Name: $name');
  print('Age: $age');
  print('Numbers: $numbers');
  print('Sum of even numbers: $sumEven');
  print('Sum of odd numbers: $sumOdd');
  print('Largest number: $largest');
  print('Smallest number: $smallest');
}
