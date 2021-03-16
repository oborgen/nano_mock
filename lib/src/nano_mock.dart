import 'exceptions/invalid_nano_mock_call_exception.dart';
import 'list.dart';
import 'nano_mock_call_count.dart';

class NanoMock<T> {
  final List<_Mock<T>> _mocks;

  NanoMock() : _mocks = [];

  NanoMockCallCount when(T result, List<dynamic> arguments) {
    final mock = _Mock(result, arguments);
    _mocks.add(mock);
    return mock;
  }

  T call(List<dynamic> arguments) {
    for (_Mock<T> mock in _mocks) {
      if (listsEqual(arguments, mock.arguments)) {
        mock.calls++;
        return mock.result;
      }
    }
    throw InvalidNanoMockCallException(arguments);
  }
}

class _Mock<T> implements NanoMockCallCount {
  final T result;
  final List<dynamic> arguments;
  int calls;

  _Mock(
    this.result,
    this.arguments,
  ) : calls = 0;
}
