// This module should not be viewed as a test of the library but rather as an
// example of how the library can be used when writing tests.
// However, it's run together with the actual tests.

import 'package:test/test.dart';

import '../lib/nano_mock.dart';

/// An example of an implemented function accepting a callback that is
/// optionally called.
T? _exampleImplementation<T>(int x, int y, T Function(int x, int y) callback) {
  if (x + y > 10) {
    return callback(x, y);
  } else {
    return null;
  }
}

void main() {
  group("_exampleImplementation", () {
    test("the function calls the callback when the sum is greater than 10", () {
      // Create a NanoMock instance.
      final mock = NanoMock<bool>();

      // Mock the instance to return true when called with 5 and 7.
      final verify = mock.when(true, [5, 7]);

      // Call the function with 5 and 7 and assert that true is returned.
      expect(
        _exampleImplementation(5, 7, (x, y) => mock([x, y])),
        true,
      );

      // Assert that the function has been called once.
      verify.called(1);
    });

    test("the function does not call the callback when the sum is less than 10",
        () {
      // Create a NanoMock instance.
      final mock = NanoMock<bool>();

      // Mock the instance to return false when called with 3 and 5.
      final verify = mock.when(false, [3, 5]);

      // Call the function with 3 and 5 and assert that null is returned.
      expect(
        _exampleImplementation(3, 5, (x, y) => mock([x, y])),
        null,
      );

      // Assert that the function has never been called.
      verify.neverCalled();
    });
  });
}
