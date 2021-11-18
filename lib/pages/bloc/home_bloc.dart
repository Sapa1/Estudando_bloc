import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_aprendendo/pages/bloc/home_event.dart';
import 'package:flutter_bloc_aprendendo/pages/bloc/home_state.dart';

/// [Aqui é onde ocorre a lógica do bloc]
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(HomeLoadingState());

  @override

  ///[Esse evento chamado é o evento que foi passado lá na main, o HomeFetchListEvent]
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    ///[Aqui estamos lidando com os possíveis eventos criados no HomeEvent]
    ///[Quando o tipo do evento for HomeFetchListEvent, executa o case e chama o _fetchList()]
    switch (event.runtimeType) {
      case HomeFetchListEvent:
        yield await _fetchList();
        break;
      case HomeFetchListWithErrorEvent:
        yield await _fetchListWithError();
        break;
      case HomeFetchListWithEmptyListEvent:
        yield await _fetchListWithEmptyList();
        break;
      case HomeAddListEvent:
        yield await _addItem(event as HomeAddListEvent);
        break;
      case HomeRemoveItemListEvent:
        yield await _removeItem(event as HomeRemoveItemListEvent);
        break;
    }
  }

  /// [O que existe aqui é uma função onde cria uma lista de dados e, no final dela, retorna nosso estado,]
  /// [por isso é necessário que o estado seja um "HomeState" e que haja um return no final]

  Future<HomeState> _fetchList() async {
    List<String> itens = await Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () => <String>[
        'Item 1',
      ],
    );
    return HomeSucessState(list: itens);
  }

  Future<HomeState> _fetchListWithError() async {
    return await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () => HomeErrorState(message: 'Erro ao carregar lista'),
    );
  }

  Future<HomeState> _fetchListWithEmptyList() async {
    return await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () => HomeEmptyListState(),
    );
  }

  Future<HomeState> _addItem(HomeAddListEvent event) async {
    final isSuccess = state is HomeSucessState;
    if (isSuccess) {
      final previousList = (state as HomeSucessState).list;
      final newList = List<String>.from(previousList);
      newList.add(event.item);
      return HomeSucessState(list: newList);
    }
    return state;
  }

  Future<HomeState> _removeItem(HomeRemoveItemListEvent removeEvent) async {
    final isSuccess = state is HomeSucessState;
    if (isSuccess) {
      final previousRemoveItemList = (state as HomeSucessState).list;
      final newRemoveItemList = List<String>.from(previousRemoveItemList);
      newRemoveItemList.remove(removeEvent.itemRemove);
      return HomeSucessState(list: newRemoveItemList);
    }
    return state;
  }
}
