import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_assesment/utils/validator.dart';

void main() {
  group('Validator', () {
    test('Validate name', () {
      final validator = Validator();
      const name = 'Majid';
      expect(validator.validateName(name), null);
    });

    test('Validate password', () {
      final validator = Validator();
      const password = '1234567';
      expect(validator.validatePassword(password), null);
    });

    test('Validate email', () {
      final validator = Validator();
      const email = 'wazziri145@gmail.com';
      expect(validator.validateEmail(email), null);
    });
  });
}
