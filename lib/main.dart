import 'package:flutter/material.dart';

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

void main() => runApp(BookCatalogApp(books: bookCatalog));

class BookCatalogApp extends StatelessWidget {
  const BookCatalogApp({Key? key, required this.books});

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
  const BookListPage({Key? key, required this.books}) : super(key: key);

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Library')),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            BooksListItem(book: bookCatalog[index]),
        itemCount: bookCatalog.length,
      ),
    );
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
          Navigator.of(context).push(BookDetailsPage.route());
        });
  }
}

class BookDetailsPage extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => BookDetailsPage(),
    );
  }

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
