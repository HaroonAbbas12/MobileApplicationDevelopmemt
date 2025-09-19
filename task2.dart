import 'dart:io';

void main() {
  stdout.write('Enter n: ');
  int n = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  for (int i = 1; i <= n; i++) {
    String row = '';
    for (int j = 1; j <= i; j++) {
      row += '$j ';
    }
    print(row.trim());
  }
}
