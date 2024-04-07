import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/cach_helper/cached_helper.dart';
import 'package:moviesapp/core/services/services_locater.dart';
import 'package:moviesapp/core/utils/resubale.dart';
import 'package:moviesapp/movie/presentation/controller/register_bloc.dart';
import 'package:moviesapp/movie/presentation/controller/register_event.dart';
import 'package:moviesapp/movie/presentation/controller/register_state.dart';
import 'package:moviesapp/movie/presentation/screens/movies_screen.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneNumberController = TextEditingController();
    return BlocProvider(
      create: (context) => sl<RegisterBloc>(),
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) if (state.loginSuccess.status) {
            CacheHelper.saveData(
                    key: 'token', value: state.loginSuccess.data?.token)
                .then((value) {
              navigateTo(context, const MoviesScreen());
            });
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                elevation: 0,
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(fontSize: 24),
                        ),
                        const Text(
                          'Register now to enjoy in Movie app ',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultTextFromFiled(
                            Controller: emailController,
                            type: TextInputType.emailAddress,
                            preIcon: Icons.email_outlined,
                            lable: 'email',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your email addrees';
                              }
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        defaultTextFromFiled(
                            isPassword: RegisterBloc.getBlocObject(context)
                                .showPassword,
                            sufIcon:
                                RegisterBloc.getBlocObject(context).iconData,
                            Controller: passwordController,
                            type: TextInputType.visiblePassword,
                            preIcon: Icons.security,
                            lable: 'Password',
                            onTab: () {
                              RegisterBloc.getBlocObject(context)
                                  .add(RegisterShowPassWordEvent());
                              //print('youseffff habbbeebbbiiiiiiiiiiii');
                            },
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'password is too short';
                              }
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        defaultTextFromFiled(
                            Controller: nameController,
                            type: TextInputType.name,
                            preIcon: Icons.person,
                            lable: 'enter Your name',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your name';
                              }
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        defaultTextFromFiled(
                            Controller: phoneNumberController,
                            type: TextInputType.number,
                            preIcon: Icons.phone,
                            lable: 'enter Your Phone Number',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your Phone Number';
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (BuildContext context) {
                            return defaultButton(
                                text: 'Regsiter',
                                onpressed: () {
                                  if (formKey.currentState!.validate()) {
                                    print('abood');
                                    RegisterBloc.getBlocObject(context)
                                      ..add(RegisterEventSuccess(
                                          emailController.text,
                                          passwordController.text,
                                          nameController.text,
                                          phoneNumberController.text));
                                  }
                                });
                          },
                          fallback: (BuildContext context) {
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
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
