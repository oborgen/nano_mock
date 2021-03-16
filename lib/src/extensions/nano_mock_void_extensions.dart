import '../nano_mock.dart';
import '../nano_mock_call_count.dart';

/// Utility extensions on [NanoMock].
extension NanoMockVoidExtensions on NanoMock<void> {
  /// A `void` reference.
  static final void _void = (() {})();

  /// Adds a mock to the [NanoMock] instance, which makes it so if the instance
  /// is called with `arguments`, the instance will return `void`.
  ///
  /// The returned [NanoMockCallCount] can be used to access how many times the
  /// mock has been called.
  NanoMockCallCount whenVoid(List<dynamic> arguments) {
    // Call when with the given arguments and a void reference.
    return when(_void, arguments);
  }
}
