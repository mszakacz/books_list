import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:books_list/main.dart';

void main() {
  group(
    'main',
    () {
      group('bookCatalog', () {
        test('length equals 3', () {
          int length = bookCatalog.length;
          equals(length, 3);
        });
      });

      group('BookListPage', () {
        const book1 = Book(
          title: 'Flutter In Action',
          author: Author('Eric Windmill', 23),
          publishingYear: 2019,
          totalPages: 312,
        );
        const book2 = Book(
          title: 'Flutter For Beginners',
          author: Author('Alessandro Biessek', 45),
          publishingYear: 2018,
          totalPages: 198,
        );
        const book3 = Book(
          title: 'Programming Flutter',
          author: Author('Carmine Zaccagnino', 33),
          publishingYear: 2020,
          totalPages: 422,
        );

        testWidgets('displays 3 books', (WidgetTester tester) async {
          await tester.pumpWidget(
              const MaterialApp(home: BookListPage(books: bookCatalog)));

          var booksListItem = find.byType(BooksListItem);
          expect(booksListItem, findsNWidgets(3));
        });

        testWidgets('displays first book title', (WidgetTester tester) async {
          await tester.pumpWidget(
              const MaterialApp(home: BookListPage(books: bookCatalog)));
          final titleFinder = find.text('Flutter In Action');
          expect(titleFinder, findsOneWidget);
        });

        testWidgets('displays first book author', (WidgetTester tester) async {
          await tester.pumpWidget(
              const MaterialApp(home: BookListPage(books: bookCatalog)));

          final authorFinder = find.text('Eric Windmill');
          expect(authorFinder, findsOneWidget);
        });

        testWidgets('displays second book title', (WidgetTester tester) async {
          await tester.pumpWidget(
              const MaterialApp(home: BookListPage(books: bookCatalog)));
          final titleFinder = find.text('Flutter For Beginners');
          expect(titleFinder, findsOneWidget);
        });

        testWidgets('displays second book author', (WidgetTester tester) async {
          await tester.pumpWidget(
              const MaterialApp(home: BookListPage(books: bookCatalog)));

          final authorFinder = find.text('Alessandro Biessek');
          expect(authorFinder, findsOneWidget);
        });

        testWidgets('displays third book title', (WidgetTester tester) async {
          await tester.pumpWidget(
              const MaterialApp(home: BookListPage(books: bookCatalog)));
          final titleFinder = find.text('Programming Flutter');
          expect(titleFinder, findsOneWidget);
        });

        testWidgets('displays third book author', (WidgetTester tester) async {
          await tester.pumpWidget(
              const MaterialApp(home: BookListPage(books: bookCatalog)));

          final authorFinder = find.text('Carmine Zaccagnino');
          expect(authorFinder, findsOneWidget);
        });
      });
    },
  );
}
