import 'dart:io';

void main() {
  int bid = 100; // starting bid

  while (true) {
    print('\nYour Current Maximum Bid: \$${bid}');
    stdout.write('Press Enter to increase by \$50 or type "q" to quit: ');
    String? input = stdin.readLineSync();

    if (input != null && input.toLowerCase() == 'q') {
      print('Exiting... Final Bid: \$${bid}');
      break;
    }
    bid += 50;
  }
}
