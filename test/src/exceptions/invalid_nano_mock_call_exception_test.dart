import 'package:test/test.dart';

import '../../../lib/nano_mock.dart';

void main() {
  group("InvalidNanoMockCallException", () {
    test("can call toString", () {
      expect(
        const InvalidNanoMockCallException([1, 2]).toString(),
        equals("The NanoMock has not been configured to handle the " +
            "following arguments: [1, 2]"),
      );
    });
  });
}
