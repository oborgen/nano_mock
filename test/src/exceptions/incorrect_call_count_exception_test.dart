import 'package:test/test.dart';

import '../../../lib/nano_mock.dart';

void main() {
  group("IncorrectCallCountException", () {
    test("can call toString", () {
      expect(
        const IncorrectCallCountException(1, 2).toString(),
        equals("Expected 1 call to have been made " +
            "but 2 calls has actually been made."),
      );
    });
  });
}
