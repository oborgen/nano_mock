/// Thrown when a mock instance has been called with arguments that have not
/// been mocked.
class InvalidNanoMockCallException implements Exception {
  /// The arguments that did not match any mock.
  final List<dynamic> arguments;

  const InvalidNanoMockCallException(
    this.arguments,
  );

  String toString() {
    return "The NanoMock has not been configured to handle the following " +
        "arguments: $arguments";
  }
}
