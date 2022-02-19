part of 'books_bloc.dart';

@immutable
abstract class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object?> get props => [];
}

class GetBookCatalog extends BooksEvent {
  const GetBookCatalog({required this.books});
  final List<Book> books;

  @override
  List<Object?> get props => [books];
}
