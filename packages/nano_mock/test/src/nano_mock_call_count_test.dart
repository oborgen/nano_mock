import 'package:nano_mock/nano_mock.dart';
import 'package:test/test.dart';

class _NanoMockCallCount extends NanoMockCallCount {
  @override
  int get calls => throw UnimplementedError();
}

void main() {
  group("NanoMockCallCount", () {
    test("can call the constructor", () {
      _NanoMockCallCount();
    });
  });
}
