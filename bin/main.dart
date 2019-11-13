// Challenge 1
// Write test cases for the given challenges

// Challenge 2
// Pandigital Numbers
// A pandigital number contains all digits (0-9) at least once. Write a function
// that takes an integer, returning true if the integer is pandigital, and false otherwise.
//  Examples
//  isPandigital(98140723568910) ➞ true

// Challenge 3
// Area of Overlapping Rectangles
// Create a function that returns the area of the overlap between two rectangles.
// The function will receive two rectangles, each with the coordinates of two of
// its opposite angles.
//
// Examples
// overlappingRectangles(
//    [{ x: 2, y: 1 }, { x: 5, y: 5 }],
//    [{ x: 3, y: 2 }, { x: 5, y: 7 }]
//  ) ➞ 6


bool isPandigital(int number) {
//  String numberString = number.toString();
//  Map numberMap = {};
//  int allDigitsPresent = 0;
//  for (int i = 0; i < numberString.length; i++) {
//    if (numberMap.containsKey(numberString[i])) {
//      numberMap.update(numberString[i], (e) => e + 1);
//    } else {
//      numberMap.putIfAbsent(numberString[i], () => 1);
//    }
//  }
//  for (int i = 0; i < 10; i++) {
//    if (numberMap.containsKey(i.toString())) {
//      allDigitsPresent++;
//    }
//  }
//  return allDigitsPresent == 10 ? true : false;
  List numbersList = number.toString().split('');
  return numbersList.toSet().length == numbersList.length;
}

int overlappingRectangles(
    List<Map<String, int>> rectOne, List<Map<String, int>> rectTwo) {
  List xCoOrdsOfRectOne = [rectOne[0]['x'], rectOne[1]['x']];
  List xCoOrdsOfRectTwo = [rectTwo[0]['x'], rectTwo[1]['x']];
  List yCoOrdsOfRectOne = [rectOne[0]['y'], rectOne[1]['y']];
  List yCoOrdsOfRectTwo = [rectTwo[0]['y'], rectTwo[1]['y']];

  bool isOverlapping() {
    bool xCheck = xCoOrdsOfRectOne
                    .reduce((curr, next) => curr < next ? curr : next) >
                xCoOrdsOfRectTwo
                    .reduce((curr, next) => curr > next ? curr : next) ||
            xCoOrdsOfRectOne.reduce((curr, next) => curr > next ? curr : next) >
                xCoOrdsOfRectTwo
                    .reduce((curr, next) => curr < next ? curr : next)
        ? false
        : true;
    bool yCheck = yCoOrdsOfRectOne
                    .reduce((curr, next) => curr < next ? curr : next) >
                yCoOrdsOfRectTwo
                    .reduce((curr, next) => curr > next ? curr : next) ||
            yCoOrdsOfRectOne.reduce((curr, next) => curr > next ? curr : next) >
                yCoOrdsOfRectTwo
                    .reduce((curr, next) => curr < next ? curr : next)
        ? false
        : true;
    return xCheck && yCheck;
  }

  if (!isOverlapping()) {
    xCoOrdsOfRectOne.addAll(xCoOrdsOfRectTwo);
    yCoOrdsOfRectOne.addAll(yCoOrdsOfRectTwo);
    xCoOrdsOfRectOne.sort();
    yCoOrdsOfRectOne.sort();

    return ((xCoOrdsOfRectOne[1] - xCoOrdsOfRectOne[2]).abs()) *
        ((yCoOrdsOfRectOne[1] - yCoOrdsOfRectOne[2]).abs());
  }

  return 0;
}

main() {
  print(isPandigital(0123456789));
//  print(overlappingRectangles([
//    {'x': 2, 'y': 1},
//    {'x': 5, 'y': 5}
//  ], [
//    {'x': 3, 'y': 2},
//    {'x': 5, 'y': 7}
//  ]));
//  print(overlappingRectangles([
//    {'x': 5, 'y': 0},
//    {'x': 0, 'y': 10}
//  ], [
//    {'x': 15, 'y': 15},
//    {'x': 20, 'y': 20}
//  ]));
}
