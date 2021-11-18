import 'package:equatable/equatable.dart';

/// [Serve para criar os estados que a aplicação pode ter]

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}
// home init state

/// [Estado de carregamento da aplicação]
class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

/// [Estado de erro da aplicação]
class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

/// [Estado de sucesso da aplicação]
class HomeSucessState extends HomeState {
  final List<String> list;

  HomeSucessState({required this.list});
  @override
  List<Object?> get props => [list];
}

/// [Estado de carregamento vazio da aplicação]
class HomeEmptyListState extends HomeState {
  @override
  List<Object?> get props => [];
}
