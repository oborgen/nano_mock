/// Thrown when a [NanoMock] instance has been called with arguments that have
/// not been mocked.
class InvalidNanoMockCallException implements Exception {
  /// The arguments that did not match any mock.
  final List<dynamic> arguments;

  /// Creates a new [InvalidNanoMockCallException] describing that the given
  /// `arguments` are invalid.
  const InvalidNanoMockCallException(
    this.arguments,
  );

  /// Creates a string representation of the [InvalidNanoMockCallException].
  @override
  String toString() {
    return "The NanoMock has not been configured to handle the following " +
        "arguments: $arguments";
  }
}
