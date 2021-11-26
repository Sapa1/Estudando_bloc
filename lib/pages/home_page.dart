import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_aprendendo/pages/bloc/home_event.dart';
import 'package:flutter_bloc_aprendendo/pages/bloc/home_state.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///[Instancia uma variável 'X' como um Bloc que foi criado (HomeBloc nesse caso)]
  ///[e passa a variável no initState para que seja inicializado]
  ///[igualando a variável ao BlocProvider que foi criado na home da main]
  int countItem = 2;
  // HomeBloc? bloc;

  // @override
  // void initState() {
  //   bloc = BlocProvider.of<HomeBloc>(context);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treinando Bloc'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        /// [O bloc também pode ser passado diretamente dentro do construtor]
        /// [do BlocBuilder sem precisar ter sido criado anteriormente]
        // bloc: bloc,
        bloc: BlocProvider.of<HomeBloc>(context),
        builder: (context, state) {
          if (state is HomeSucessState) {
            return Stack(
              children: [
                ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    String item = state.list[index];
                    return ListTile(
                      title: Center(
                        child: Text(
                          item,
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 30,
                  right: 30,
                  child: FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      BlocProvider.of<HomeBloc>(context)
                          .add(HomeAddListEvent(item: 'Item ${countItem++}'));
                    },
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 30,
                  child: FloatingActionButton(
                    child: const Icon(Icons.remove),
                    onPressed: () {
                      countItem--;
                      BlocProvider.of<HomeBloc>(context).add(
                        HomeRemoveItemListEvent(
                          itemRemove: state.list.last,
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }
          if (state is HomeErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is HomeEmptyListState) {
            return const Center(
              child: Text('Não há dados disponíveis'),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          );
        },
      ),
    );
  }
}
