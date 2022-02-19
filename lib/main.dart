import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc/books_bloc.dart';

class Author {
  const Author(this.fullName, this.age);

  final String fullName;
  final int age;
}

class Book {
  const Book({
    required this.title,
    required this.author,
    required this.publishingYear,
    required this.totalPages,
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

void main() => runApp(const BookCatalogApp(books: bookCatalog));

class BookCatalogApp extends StatelessWidget {
  const BookCatalogApp({Key? key, required this.books}) : super(key: key);

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksBloc()..add(const GetBookCatalog()),
      child: MaterialApp(
        title: 'Book Catalog',
        home: BookListPage(key: const Key('bookListPage'), books: books),
      ),
    );
  }
}

class BookListPage extends StatelessWidget {
  const BookListPage({Key? key, required this.books}) : super(key: key);

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        actions: const <Widget>[UpdateButton()],
      ),
      body: BlocBuilder<BooksBloc, BooksState>(
        builder: (context, state) {
          if (state is HasBooksCatalog) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) => BooksListItem(
                key: Key('booksListItem$index'),
                book: bookCatalog[index],
              ),
              itemCount: bookCatalog.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  const UpdateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(
          Icons.get_app,
          color: Colors.white,
        ),
        onPressed: () => context.read<BooksBloc>().add(const GetBookCatalog()));
  }
}

class BooksListItem extends StatelessWidget {
  const BooksListItem({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(book.title),
        subtitle: Text(book.author.fullName),
        onTap: () {
          Navigator.of(context).push(BookDetailsPage.route(book));
        });
  }
}

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({Key? key, required this.book}) : super(key: key);
  final Book book;

  static Route<void> route(Book book) {
    return MaterialPageRoute(
      builder: (context) => BookDetailsPage(book: book),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.author.fullName,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$book.publishingYear',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '$book.totalPages pages',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
