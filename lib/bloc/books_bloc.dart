import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:books_list/main.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc() : super(const BooksInitial()) {
    on<GetBookCatalog>(_onGetBookCatalog);
  }

  void _onGetBookCatalog(GetBookCatalog event, Emitter<BooksState> emit) async {
    emit(const BooksLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(BooksPopulated(catalog: event.books));
  }
}
