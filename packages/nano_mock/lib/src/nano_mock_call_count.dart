/// Interface for accessing the number of calls made to a mock.
abstract class NanoMockCallCount {
  /// Creates a [NanoMockCallCount].
  const NanoMockCallCount();

  /// The number of calls made to the mock.
  int get calls;
}
