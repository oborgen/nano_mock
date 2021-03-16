class InvalidNanoMockCallException implements Exception {
  final List<dynamic> arguments;

  const InvalidNanoMockCallException(
    this.arguments,
  );

  String toString() {
    return "The NanoMock has not been configured to handle the following " +
        "arguments: $arguments";
  }
}
