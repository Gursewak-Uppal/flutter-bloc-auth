import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_auth/blocs/login/log_in_bloc.dart';
import 'package:flutter_bloc_auth/core/styles.dart';
import 'package:flutter_bloc_auth/screens/home_page.dart';
import '../core/colors.dart';
import '../common/common_ui.dart';
import '../core/constants.dart';
import '../common/edit_text.dart';

@immutable
class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocConsumer<LogInBloc, LogInState>(
        listener: (context, state) {
          if (state is LogInErrorState) {
            showToastMsg(state.errorMsg, hasErrorMessage: true);
          } else if (state is LogInSuccessState) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => HomeScreen(state.username)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(child: extendedHeader(text: AppConstants.login, context: context, backNavigation: false)),
                  const SizedBox(height: 40.0),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 5.0, top: 40.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(33),
                          topRight: Radius.circular(33),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppConstants.welcome,
                              style: AppStyles.darkText,
                            ),
                            Text(
                              AppConstants.loginMsg,
                              style: AppStyles.lightText,
                            ),
                            const SizedBox(height: 30.0),
                            MyEditText(AppConstants.emailHint, false, TextInputType.emailAddress, TextCapitalization.none, 10.0, _emailController, Colours.hintColor.code, true),
                            const SizedBox(height: 30.0),
                            MyEditText(
                              AppConstants.passwordHint,
                              true,
                              TextInputType.text,
                              TextCapitalization.none,
                              10.0,
                              _passwordController,
                              Colours.hintColor.code,
                              true,
                              textInputAction: TextInputAction.done,
                            ),
                            const SizedBox(height: 30.0),
                            state is LogInLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      context.read<LogInBloc>().add(LogInUserEvent(_emailController.text, _passwordController.text));
                                    },
                                    child: appButton(bkColor: Colours.blue.code, text: AppConstants.login1)),
                            const SizedBox(height: 30.0),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
