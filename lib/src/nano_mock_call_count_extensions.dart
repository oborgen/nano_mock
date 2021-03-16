import '../nano_mock.dart';
import 'nano_mock_call_count.dart';

/// Utility extensions on [NanoMockCallCount].
extension NanoMockCallCountExtensions on NanoMockCallCount {
  /// Asserts that the mock has been called `expectedCalls` time(s).
  void called(int expectedCalls) {
    if (expectedCalls != calls) {
      throw IncorrectCallCountException(expectedCalls, calls);
    }
  }

  /// Asserts that the mock has never been called.
  void neverCalled() {
    called(0);
  }
}
