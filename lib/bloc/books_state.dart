part of 'books_bloc.dart';

@immutable
abstract class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object?> get props => [];
}

class BooksInitial extends BooksState {
  const BooksInitial();

  @override
  List<Object?> get props => [];
}

class BooksLoading extends BooksState {
  const BooksLoading();

  @override
  List<Object?> get props => [];
}

class BooksPopulated extends BooksState {
  const BooksPopulated({required this.catalog});
  final List<Book> catalog;

  @override
  List<Object?> get props => [catalog];

  BooksPopulated copyWith({
    List<Book>? catalog,
  }) {
    return BooksPopulated(
      catalog: catalog ?? this.catalog,
    );
  }
}
