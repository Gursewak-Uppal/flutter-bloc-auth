import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_auth/blocs/login/log_in_bloc.dart';
import 'package:flutter_bloc_auth/enums/app_routes.dart';
import 'package:flutter_bloc_auth/routes/routes.dart';

import 'blocs/medication/medication_bloc.dart';
import 'network/medications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LogInBloc>(
          create: (BuildContext context) => LogInBloc(),
        ),
        BlocProvider<MedicationBloc>(
          create: (BuildContext context) => MedicationBloc(MedicationNetwork()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoutes,
        initialRoute: AppRoutes.splash.name,
      ),
    );
  }
}
