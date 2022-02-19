part of 'books_bloc.dart';

@immutable
abstract class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object?> get props => [];
}

class GetBookCatalog extends BooksEvent {
  const GetBookCatalog();

  @override
  List<Object?> get props => [];
}
