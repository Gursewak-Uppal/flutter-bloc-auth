import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_auth/blocs/login/log_in_bloc.dart';
import 'package:flutter_bloc_auth/screens/login_screen.dart';
import '../core/constants.dart';
import '../core/styles.dart';
import 'medication_screen.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen(this.username, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppConstants.home),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              context.read<LogInBloc>().add(LogOutEvent());
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => LoginScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "${AppConstants.hi} ",
                style: AppStyles.darkText,
              ),
              TextSpan(
                text: username,
                style: AppStyles.textBlueUnderline,
              ),
              TextSpan(
                text: ", ${AppConstants.greetingText}!",
                style: AppStyles.darkText,
              ),
            ])),
            const Expanded(child: MedicationScreen())
          ],
        ),
      ),
    );
  }
}
