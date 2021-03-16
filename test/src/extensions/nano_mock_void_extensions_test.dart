import 'package:test/test.dart';

import '../../../lib/nano_mock.dart';

void main() {
  group("NanoMockVoidExtensions", () {
    test(
        "can mock one void call and recognize that the function has been " +
            "called", () {
      // Create a NanoMock instance.
      final mock = NanoMock<void>();

      // Mock the instance to be callable without parameters.
      final verify = mock.whenVoid([]);

      // Call the function.
      mock([]);

      // Assert that verify reports that one call has been made.
      expect(
        verify.calls,
        equals(1),
      );
    });
  });
}
