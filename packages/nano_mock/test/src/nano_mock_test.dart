import 'package:test/test.dart';

import '../../lib/nano_mock.dart';

final _testParameters1 = [
  1,
  1.5,
  "test",
  false,
];
final _testResult1 = true;

final _testParameters2 = [
  "test",
  0.5,
];
final _testResult2 = false;

final _testParametersNever = [
  "test",
  0.75,
];
final _testResultNever = false;

void main() {
  group("NanoMock", () {
    test("can mock one call and report that no calls have been made", () {
      // Create a NanoMock instance.
      final mock = NanoMock<bool>();

      // Mock the instance to return _testResult1 when called with
      // _testParameters1.
      final verify = mock.when(_testResult1, _testParameters1);

      // Assert that verify reports that no calls have been made.
      expect(
        verify.calls,
        equals(0),
      );
    });

    test(
        "can mock one call and recognize that the function has been called " +
            "with the same parameter list as specified", () {
      // Create a NanoMock instance.
      final mock = NanoMock<bool>();

      // Mock the instance to return _testResult1 when called with
      // _testParameters1.
      final verify = mock.when(_testResult1, _testParameters1);

      // Call the function with _testParameters1 and assert that _testResult1
      // is returned.
      expect(
        mock(_testParameters1),
        equals(_testResult1),
      );

      // Assert that verify reports that one call has been made.
      expect(
        verify.calls,
        equals(1),
      );
    });

    test(
        "can mock one call and recognize that the function has been called " +
            "with an equal parameter list as specified", () {
      // Create a NanoMock instance.
      final mock = NanoMock<bool>();

      // Mock the instance to return _testResult1 when called with
      // _testParameters1.
      final verify = mock.when(_testResult1, _testParameters1);

      // Call the function with _testParameters1 and assert that _testResult1
      // is returned.
      expect(
        mock(_testParameters1.where((_) => true).toList()),
        equals(_testResult1),
      );

      // Assert that verify reports that one call has been made.
      expect(
        verify.calls,
        equals(1),
      );
    });

    test(
        "can mock one call and recognize when the function has been called " +
            "twice", () {
      // Create a NanoMock instance.
      final mock = NanoMock<bool>();

      // Mock the instance to return _testResult1 when called with
      // _testParameters1.
      final verify = mock.when(_testResult1, _testParameters1);

      // Call the function with _testParameters1 twice and assert that
      // _testResult1 is returned both times.
      for (int i = 0; i < 2; i++) {
        expect(
          mock(_testParameters1),
          equals(_testResult1),
        );
      }

      // Assert that verify reports that two calls has been made.
      expect(
        verify.calls,
        equals(2),
      );
    });

    test("calling an instance without any mocks throws an exception", () {
      // Create a NanoMock instance.
      final mock = NanoMock<bool>();

      expect(
        () => mock(_testParameters1),
        throwsA(TypeMatcher<InvalidNanoMockCallException>()),
      );
    });

    test("can mock two calls", () {
      // Create a NanoMock instance.
      final mock = NanoMock<bool>();

      // Mock the instance to return _testResultNever when called with
      // _testParametersNever, which should never happen.
      final verifyNever = mock.when(_testResultNever, _testParametersNever);

      // Mock the instance to return _testResult1 when called with
      // _testParameters1.
      final verify1 = mock.when(_testResult1, _testParameters1);

      // Mock the instance to return _testResult2 when called with
      // _testParameters2.
      final verify2 = mock.when(_testResult2, _testParameters2);

      // #region Call 1

      // Call the function with _testParameters1 and assert that _testResult1
      // is returned.
      expect(
        mock(_testParameters1),
        equals(_testResult1),
      );

      // Assert that verifyNever reports that no calls has been made to the
      // never mock.
      expect(
        verifyNever.calls,
        equals(0),
      );

      // Assert that verify1 reports that one call has been made to the first
      // mock.
      expect(
        verify1.calls,
        equals(1),
      );

      // Assert that verify2 reports that no calls has been made to the second
      // mock.
      expect(
        verify2.calls,
        equals(0),
      );
      // #endregion

      // #region Call 2

      // Call the function with _testParameters2 and assert that _testResult2
      // is returned.
      expect(
        mock(_testParameters2),
        equals(_testResult2),
      );

      // Assert that verifyNever reports that no calls has been made to the
      // never mock.
      expect(
        verifyNever.calls,
        equals(0),
      );

      // Assert that verify1 reports that one call has been made to the first
      // mock.
      expect(
        verify1.calls,
        equals(1),
      );

      // Assert that verify2 reports that one call has been made to the second
      // mock.
      expect(
        verify2.calls,
        equals(1),
      );
      // #endregion
    });
  });
}
