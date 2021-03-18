import 'exceptions/invalid_nano_mock_call_exception.dart';
import 'list.dart';
import 'nano_mock_call_count.dart';

/// Holds information about a mock.
class _Mock<T> implements NanoMockCallCount {
  final T result;
  final List<dynamic> arguments;
  int calls;

  _Mock(
    this.result,
    this.arguments,
  ) : calls = 0;
}

/// Mocks a function that returns a value of type `T`.
class NanoMock<T> {
  /// The mocks set up for the [NanoMock] instance.
  final List<_Mock<T>> _mocks;

  /// Creates a new [NanoMock], which will not have any mocks yet.
  NanoMock() : _mocks = [];

  /// Adds a mock to the [NanoMock] instance, which makes it so if the instance
  /// is called with `arguments`, the instance will return `result`.
  ///
  /// The returned [NanoMockCallCount] can be used to access how many times the
  /// mock has been called.
  NanoMockCallCount when(T result, List<dynamic> arguments) {
    // Create an instance of _Mock with the given arguments and result.
    final mock = _Mock(result, arguments);

    // Add the mock to the list of mocks.
    _mocks.add(mock);

    // Return the mock, which is an instance of NanoMockCallCount.
    return mock;
  }

  /// Call the instance with `arguments`, which will try to match them with the
  /// existing mocks.
  ///
  /// Returns the previously provided return value of type `T` if a matching
  /// mock exists.
  ///
  /// Throws a [InvalidNanoMockCallException] if no mock exists.
  T call(List<dynamic> arguments) {
    // Process each mock.
    for (_Mock<T> mock in _mocks) {
      // Check if the arguments of the current mock matches the given arguments.
      if (listsEqual(arguments, mock.arguments)) {
        // A match has been found.

        // Increment the number of calls to the mock.
        mock.calls++;

        // Return the mock's result.
        return mock.result;
      }
    }

    // Throw an InvalidNanoMockCallException since no matching mock exists.
    throw InvalidNanoMockCallException(arguments);
  }
}
