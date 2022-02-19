import 'package:flutter_test/flutter_test.dart';
import 'package:books_list/main.dart';

void main() {
  group('main', () {
    group('bookCatalog', () {
      test('length equals 3', () {
        int length = bookCatalog.length;
        equals(length, 3);
      });
    });
  });
}
