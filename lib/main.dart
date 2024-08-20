import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibl_app/features/courses/presentation/bloc/ai_bloc.dart';
import 'package:ibl_app/features/courses/presentation/bloc/ai_events.dart';
import 'package:ibl_app/features/courses/presentation/bloc/ai_states.dart';
import 'package:ibl_app/features/home/home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NetworkBloc>(
          create: (context) => NetworkBloc()..add(Disconnected()),
        ),
        BlocProvider<AISearchBloc>(
            create: (context) => AISearchBloc(AiLoading())..add(LoadAI())),
      ],
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'ibl App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.white,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                color: Colors.white,
              )),
          home: const GetStartedScreen(),
        );
      }),
    );
  }
}
