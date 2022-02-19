/// Questions:
///
/// 1. In the `BooksListPage`, replace the body of the `Scaffold` with a
/// `ListView` that displays each one of the books injected in the constructor
///
/// 2. In the new `ListView` created, add the ability on each item to navigate
/// to `BookDetailsPage` when the item is pressed.
///
/// 3. Modify `BookDetailsPage` to receive a single `Book` as an argument, and
/// replace the different `Text` widgets with the injected `Book` properties.
///
/// 4. Object comparison:
/// ```dart
/// final a1 = Author('Dash', 21);
/// final a2 = Author('Dash', 21);
/// ```
/// Is `a1 == a2` `true` or `false`? Ask the candidate to explain why
///
/// 5. Testing.
/// Write a unit tests that asserts that the length of `bookCatalog` is 3.
/// Write a widget test that asserts that `BookListPage` is displaying all the
/// books passed in from `bookCatalog`.
///
/// 6. Extra (if there is enough time)
/// Create a new global method called `getBookCatalog()` that returns a
/// `Future<List<Book>>`. Return the existing `bookCatalog` after a hardcoded
/// delay of 1 second.
/// Modify the app to consume the new `getBookCatalog` method, making sure that
/// while loading there's a loading indicator. You can use `FutureBuilder`.
/// You can decide to use a different state management solution than `setState`
/// as well.

class Author {
  const Author(this.fullName, this.age);

  final String fullName;
  final int age;
}

class Book {
  const Book({
    @required this.title,
    @required this.author,
    @required this.publishingYear,
    @required this.totalPages,
  });

  final String title;
  final Author author;
  final int publishingYear;
  final int totalPages;
}

const bookCatalog = [
  Book(
    title: 'Flutter In Action',
    author: Author('Eric Windmill', 23),
    publishingYear: 2019,
    totalPages: 312,
  ),
  Book(
    title: 'Flutter For Beginners',
    author: Author('Alessandro Biessek', 45),
    publishingYear: 2018,
    totalPages: 198,
  ),
  Book(
    title: 'Programming Flutter',
    author: Author('Carmine Zaccagnino', 33),
    publishingYear: 2020,
    totalPages: 422,
  ),
];

void main() => runApp(BookCatalogApp(books: bookCatalog));

class BookCatalogApp extends StatelessWidget {
  const BookCatalogApp({Key key, @required this.books});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Catalog',
      home: BookListPage(books: books),
    );
  }
}

class BookListPage extends StatelessWidget {
  const BookListPage({Key key, @required this.books}) : super(key: key);

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Library')),
      body: Text('List of books goes here!'),
    );
  }
}

class BookDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book title goes here')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('[.headline4] Author name and age goes here'),
            Text('[.headline6] Publishing year goes here'),
            Text('[.caption] Amount of pages goes here'),
          ],
        ),
      ),
    );
  }
}