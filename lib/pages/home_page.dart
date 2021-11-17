import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            /// [O bloc também pode ser passado diretamente dentro do construtor]
            /// [do BlocBuilder sem precisar ter sido criado anteriormente]
            bloc: BlocProvider.of<HomeBloc>(context),
            // bloc: bloc,
            builder: (context, state) {
              if (state is HomeSucessState) {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${state.list.elementAt(index)}'),
                    );
                  },
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
          Positioned(
            bottom: 30,
            right: 30,
            child: FloatingActionButton(
              onPressed: () {
                
              },
            ),
          )
        ],
      ),
    );
  }
}
