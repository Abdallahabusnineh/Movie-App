import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/cach_helper/cached_helper.dart';
import 'package:moviesapp/core/network/ApiConstance.dart';
import 'package:moviesapp/core/services/services_locater.dart';
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/core/utils/enums.dart';
import 'package:moviesapp/core/utils/resubale.dart';
import 'package:moviesapp/movie/presentation/controller/login_bloc.dart';
import 'package:moviesapp/movie/presentation/controller/login_event.dart';
import 'package:moviesapp/movie/presentation/controller/login_state.dart';
import 'package:moviesapp/movie/presentation/screens/login/register_screen.dart';
import 'package:moviesapp/movie/presentation/screens/movies_screen.dart';

class LoginScreen extends StatelessWidget {

  LoginScreen({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if(state is LoginSuccessState)
            if(state.loginSuccess.status)
              CacheHelper.saveData(key: 'token', value: state.loginSuccess.data?.token).then((value) {
                navigateTo(context, const MoviesScreen());
              });
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.black,
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'LOGIN',
                          style: TextStyle(fontSize: 24),
                        ),
                        const Text(
                          'login now to brose our hot offers ',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultTextFromFiled(
                            Controller: emailController,
                            type: TextInputType.emailAddress,
                            preIcon: Icons.person,
                            lable: 'email address',
                            validate: (String? value) {
                              if (value!.isEmpty)
                                return 'please enter your email addrees';
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultTextFromFiled(
                          isPassword: LoginBloc.getBlocObject(context).showPassword,
                            Controller: passwordController,
                            sufIcon: LoginBloc.getBlocObject(context).iconData,

                            onTab: () {
                              LoginBloc.getBlocObject(context).add(ShowPassWordEvent());
                              //print('youseffff habbbeebbbiiiiiiiiiiii');
                            },
                            type: TextInputType.visiblePassword,
                            preIcon: Icons.security,
                            lable: 'Password',
                            validate: (String? value) {
                              if (value!.isEmpty) return 'password is too short';
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(condition: state is ! LoginLoadingState, builder:(context){
                      return    defaultButton(text: 'login', onpressed: () {
                            if (formKey.currentState!.validate()) {
                              LoginBloc.getBlocObject(context)..add(LoginEventSuccess(email: emailController.text, password: passwordController.text));
                            }
                          });

                        } , fallback:(context)=>const Center(child: CircularProgressIndicator())),
                         const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account ?"),
                            TextButton(
                                onPressed: () {
                                  navigateTo(context,  RegisterScreen());
                                },
                                child: const Text('Reigster'))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
