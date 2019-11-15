import "package:test/test.dart";
import 'main.dart';

void main() {
  test("challenge 2 a", () {

    expect(isPandigital(98140723568910), equals(false));
  });

  test("challenge 3 a", () {

    expect(overlappingRectangles(
        [{'x' : 2, 'y' : 1}, {'x' : 5, 'y' : 5}],
        [{'x' : 3, 'y' : 2}, {'x' : 5, 'y' : 7}]
    ), equals(6));
  });

  test("challenge 3 b", () {

    expect(overlappingRectangles([
      {'x': 5, 'y': 0},
      {'x': 0, 'y': 10}
    ], [
      {'x': 15, 'y': 15},
      {'x': 20, 'y': 20}
    ]), equals(0));
  });
}