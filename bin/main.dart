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


import 'dart:math';

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

bool isOverlapping(List<int> CoOrdsOfRectOne, List<int> CoOrdsOfRectTwo) {
  return CoOrdsOfRectOne
      .reduce(min) >
      CoOrdsOfRectTwo
          .reduce(max) ||
      CoOrdsOfRectOne.reduce(max) >
          CoOrdsOfRectTwo
              .reduce(min);
}

int overlappingRectangles(
    List<Map<String, int>> rectOne, List<Map<String, int>> rectTwo) {
  List<int> xCoOrdsOfRectOne = []..addAll(rectOne.map((Map point) => point['x']));
  List<int> xCoOrdsOfRectTwo = []..addAll(rectTwo.map((Map point) => point['x']));
  List<int> yCoOrdsOfRectOne = []..addAll(rectOne.map((Map point) => point['y']));
  List<int> yCoOrdsOfRectTwo = []..addAll(rectTwo.map((Map point) => point['y']));


  if ((isOverlapping(xCoOrdsOfRectOne, xCoOrdsOfRectTwo) && isOverlapping(yCoOrdsOfRectOne, yCoOrdsOfRectTwo))) {
    xCoOrdsOfRectOne.addAll(xCoOrdsOfRectTwo);
    yCoOrdsOfRectOne.addAll(yCoOrdsOfRectTwo);
    xCoOrdsOfRectOne.sort();
    yCoOrdsOfRectOne.sort();

    return ((xCoOrdsOfRectOne[2] - xCoOrdsOfRectOne[1])) *
        ((yCoOrdsOfRectOne[2] - yCoOrdsOfRectOne[1]));
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
