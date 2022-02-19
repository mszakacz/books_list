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
            BooksPopulated(catalog: bookCatalog),
          );

          whenListen<BooksState>(
            booksBloc,
            Stream<BooksState>.fromIterable([
              const BooksLoading(),
              BooksPopulated(
                catalog: bookCatalog,
              )
            ]),
          );
          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<BooksBloc>(
                create: (c) => booksBloc,
                child: BooksListPage(books: bookCatalog),
              ),
            ),
          );
          expect(find.byType(BooksListView), findsOneWidget);
        });

        // testWidgets('displays all the books passed in from bookCatalog.',
        //     (WidgetTester tester) async {
        //   final booksBloc = BooksBlocMock();
        //   when(() => booksBloc.state).thenReturn(
        //     BooksPopulated(catalog: bookCatalog),
        //   );

        //   whenListen<BooksState>(
        //     booksBloc,
        //     Stream<BooksState>.fromIterable([
        //       const BooksLoading(),
        //       BooksPopulated(
        //         catalog: bookCatalog,
        //       )
        //     ]),
        //   );
        //   await tester.pumpWidget(
        //     MaterialApp(
        //       home: BlocProvider<BooksBloc>(
        //         create: (c) => booksBloc,
        //         child: BooksListPage(books: bookCatalog),
        //       ),
        //     ),
        //   );
        //   expect(
        //     find.byType(BooksListItem),
        //     findsNWidgets(bookCatalog.length),
        //   );
        // });

        testWidgets('displays last item', (WidgetTester tester) async {
          final booksBloc = BooksBlocMock();

          // final books = List<Book>.generate(
          //   10,
          //   (index) => Book(
          //     title: 'title${(index + 1)}',
          //     author: const Author(
          //       'name',
          //       7,
          //     ),
          //     publishingYear: 1900 + index,
          //     totalPages: 200 + 3 * index,
          //   ),
          // );

          when(() => booksBloc.state).thenReturn(
            BooksPopulated(catalog: bookCatalog),
          );

          whenListen<BooksState>(
            booksBloc,
            Stream<BooksState>.fromIterable([
              const BooksLoading(),
              BooksPopulated(
                catalog: bookCatalog,
              )
            ]),
          );
          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<BooksBloc>(
                create: (c) => booksBloc,
                child: BooksListPage(books: bookCatalog),
              ),
            ),
          );

          final listFinder = find.byType(Scrollable);
          final itemFinder = find.byKey(
            ValueKey('booksListItem${bookCatalog.length - 1}'),
          );

          // Scroll until the item to be found appears.
          await tester.scrollUntilVisible(
            itemFinder,
            500.0,
            scrollable: listFinder,
          );

          expect(itemFinder, findsOneWidget);
        });

        testWidgets('displays all list items', (WidgetTester tester) async {
          final booksBloc = BooksBlocMock();

          when(() => booksBloc.state).thenReturn(
            BooksPopulated(catalog: bookCatalog),
          );

          whenListen<BooksState>(
            booksBloc,
            Stream<BooksState>.fromIterable([
              const BooksLoading(),
              BooksPopulated(
                catalog: bookCatalog,
              )
            ]),
          );
          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<BooksBloc>(
                create: (c) => booksBloc,
                child: BooksListPage(books: bookCatalog),
              ),
            ),
          );

          final listFinder = find.byType(Scrollable);
          for (var i = 0; i < bookCatalog.length; i++) {
            final itemFinder = find.byKey(ValueKey('booksListItem$i'));
            await tester.scrollUntilVisible(
              itemFinder,
              50,
              scrollable: listFinder,
            );
            expect(itemFinder, findsOneWidget);
          }
        });
      });
    },
  );
}
