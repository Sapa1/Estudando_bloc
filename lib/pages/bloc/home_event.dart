import 'package:equatable/equatable.dart';

/// [Esse arquivo é por onde são passados os eventos da Home]

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// [Evento de carregar a lista]
class HomeFetchListEvent extends HomeEvent {}

/// [Evento para caso ocorra algum erro no carregamento da lista]
class HomeFetchListWithErrorEvent extends HomeEvent {}

/// [Evento para caso a lista esteja vazia]
class HomeFetchListWithEmptyListEvent extends HomeEvent {}

class HomeAddEvent extends HomeEvent {}
