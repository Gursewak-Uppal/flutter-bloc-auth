import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_auth/enums/app_routes.dart';
import '../blocs/login/log_in_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    context.read<LogInBloc>().add(CheckLoginEvent());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocConsumer<LogInBloc, LogInState>(listener: (context, state) {
        if (state is LogInSuccessState) {
          Navigator.pushReplacementNamed(context, AppRoutes.home.name, arguments: state.username);
        } else if(state is LogInNeededState){
          Navigator.pushReplacementNamed(context, AppRoutes.login.name);
        }
      }, builder: (context, state) {
        return const SizedBox(

        );
      }),
    );
  }
}
