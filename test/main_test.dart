import 'package:bloc_test/bloc_test.dart';
import 'package:books_list/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/material.dart';
import 'package:books_list/bloc/books_bloc.dart';
import 'package:mocktail/mocktail.dart';

class BooksBlocMock extends MockBloc<BooksEvent, BooksState>
    implements BooksBloc {}

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

      group('BooksListPage', () {
        testWidgets('renders BooksListView', (WidgetTester tester) async {
          final booksBloc = BooksBlocMock();
          when(() => booksBloc.state).thenReturn(
            const BooksPopulated(catalog: bookCatalog),
          );

          whenListen<BooksState>(
            booksBloc,
            Stream<BooksState>.fromIterable([
              const BooksLoading(),
              const BooksPopulated(
                catalog: bookCatalog,
              )
            ]),
          );
          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<BooksBloc>(
                create: (c) => booksBloc,
                child: const BooksListPage(books: bookCatalog),
              ),
            ),
          );
          expect(find.byType(BooksListView), findsOneWidget);
        });

        testWidgets('displays all the books passed in from bookCatalog.',
            (WidgetTester tester) async {
          final booksBloc = BooksBlocMock();
          when(() => booksBloc.state).thenReturn(
            const BooksPopulated(catalog: bookCatalog),
          );

          whenListen<BooksState>(
            booksBloc,
            Stream<BooksState>.fromIterable([
              const BooksLoading(),
              const BooksPopulated(
                catalog: bookCatalog,
              )
            ]),
          );
          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<BooksBloc>(
                create: (c) => booksBloc,
                child: const BooksListPage(books: bookCatalog),
              ),
            ),
          );
          expect(
            find.byType(BooksListItem),
            findsNWidgets(bookCatalog.length),
          );
        });
      });
    },
  );
}
