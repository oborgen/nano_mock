class IncorrectCallCountException implements Exception {
  final expectedCalls;
  final actualCalls;

  const IncorrectCallCountException(
    this.expectedCalls,
    this.actualCalls,
  );

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
