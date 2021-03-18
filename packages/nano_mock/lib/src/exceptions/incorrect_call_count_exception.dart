/// Thrown when a test expects `expectedCalls` call(s) to have been made
/// but the actual number of calls is `actualCalls`,
/// which differs from `expectedCalls`.
class IncorrectCallCountException implements Exception {
  /// The number of call expected to have been made to the mock.
  final int expectedCalls;

  /// The actual number of calls made to the mock.
  final int actualCalls;

  /// Creates a new [IncorrectCallCountException] describing that
  /// `expectedCalls` call(s) were expected but `actualCalls` call(s) have
  /// actually been made.
  const IncorrectCallCountException(
    this.expectedCalls,
    this.actualCalls,
  );

  /// Creates a string representation of the [IncorrectCallCountException].
  @override
  String toString() {
    return "Expected ${_formatCalls(expectedCalls)} to have been made " +
        "but ${_formatCalls(actualCalls)} has actually been made.";
  }

  static String _formatCalls(int count) {
    return count.toString() + " " + _pluralize(count, "call", "calls");
  }

  static String _pluralize(int count, String onSingular, String onPlural) {
    return count == 1 ? onSingular : onPlural;
  }
}
