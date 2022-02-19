part of 'books_bloc.dart';

@immutable
abstract class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object?> get props => [];
}

class BooksLoading extends BooksState {
  const BooksLoading();

  @override
  List<Object?> get props => [];
}

class HasBooksCatalog extends BooksState {
  const HasBooksCatalog({required this.catalog});
  final List<Book> catalog;

  @override
  List<Object?> get props => [catalog];

  HasBooksCatalog copyWith({
    List<Book>? catalog,
  }) {
    return HasBooksCatalog(
      catalog: catalog ?? this.catalog,
    );
  }
}
