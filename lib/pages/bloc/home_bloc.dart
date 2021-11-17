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
    }
  }

  /// [O que existe aqui é uma função onde cria uma lista de dados e, no final dela, retorna nosso estado,]
  /// [por isso é necessário que o estado seja um "HomeState" e que haja um return no final]

  Future<HomeState> _fetchList() async {
    int count = 0;
    List<String> list = await Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () => <String>[
        'Item 1',
        'Item 2',
        'Item 3',
        'Item 4',
        'Item 5',
        'Item 6',
        'Item 7',
        'Item 8',
        'Item 9',
        'Item 10',
      ],
    );
    return HomeSucessState(list: list);
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
}
