import '../nano_mock.dart';
import 'nano_mock_call_count.dart';

extension NanoMockCallCountExtensions on NanoMockCallCount {
  void called(int expectedCalls) {
    if (expectedCalls != calls) {
      throw IncorrectCallCountException(expectedCalls, calls);
    }
  }

  void neverCalled() {
    called(0);
  }
}
