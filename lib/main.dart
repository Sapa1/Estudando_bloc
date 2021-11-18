import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_aprendendo/pages/bloc/home_bloc.dart';
import 'package:flutter_bloc_aprendendo/pages/bloc/home_event.dart';
import 'package:flutter_bloc_aprendendo/pages/home_page.dart';

import 'pages/bloc/home_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),

      /// [É passado na home o BlocProvider com o estado inicial do bloc]
      /// [( que foi criado no "super" do home_bloc)]
      home: BlocProvider<HomeBloc>(
        create: (BuildContext context) =>

            /// [Assim que o bloc for criado, ele é passado como parâmetro para o home_page]
            HomeBloc(HomeLoadingState())

              ///[O ..add() é o que faz o bloc receber o evento assim que for criado]
              ..add(HomeFetchListEvent()),
        child: const HomePage(),
      ),
    );
  }
}
