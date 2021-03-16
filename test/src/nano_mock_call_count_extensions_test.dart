import 'package:test/test.dart';

import '../../lib/nano_mock.dart';

void main() {
  group("NanoMock", () {
    group("called", () {
      test(
          "can mock one call and correctly assert that the function has " +
              "been called", () {
        // Create a NanoMock instance.
        final mock = NanoMock<bool>();

        // Mock the instance.
        final verify = mock.when(false, []);

        // Call the function and assert that false is returned.
        expect(
          mock([]),
          equals(false),
        );

        // Call called to assert that the function has been called once.
        verify.called(1);
      });

      test(
          "throws an exception if a test expects the function to have been " +
              "called once when it has never been called", () {
        // Create a NanoMock instance.
        final mock = NanoMock<bool>();

        // Mock the instance.
        final verify = mock.when(false, []);

        expect(
          () => verify.called(1),
          throwsA(TypeMatcher<IncorrectCallCountException>()),
        );
      });
    });

    group("neverCalled", () {
      test("can mock one call and report that no calls have been made", () {
        // Create a NanoMock instance.
        final mock = NanoMock<bool>();

        // Mock the instance.
        final verify = mock.when(false, []);

        // Call neverCalled to assert that the function never has been called.
        verify.neverCalled();
      });
    });
  });
}
