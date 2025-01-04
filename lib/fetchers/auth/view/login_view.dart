import 'package:chating_app/core/app_snack_bar.dart';
import 'package:chating_app/fetchers/auth/view/phone_view.dart';
import 'package:chating_app/fetchers/auth/view/register_view.dart';
import 'package:chating_app/fetchers/home/home/home_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_const.dart';
import '../../../core/spacer.dart';
import '../widget/custom_text_field.dart';
import 'manager/auth__cubit.dart';

import 'manager/auth_states.dart';

class LoginView extends StatelessWidget {
  static const String id = 'login_view';

  LoginView({super.key});

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isSecured = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthStates>(
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 75,
                    ),
                    Center(
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40.0)),
                          border: Border.all(
                              color: const Color(0xff0a2d40), width: 2),
                          image: const DecorationImage(
                            image: AssetImage("asset/image/logo2.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // color: Colors.black,

                        // color: Colors.black12,
                      ),
                    ),
                    spacerH12,
                    Center(
                      child: Text(
                        "sign in to continue",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    spacerH20,
                    CustomTextField(
                      hint: "email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      myController: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String? value) {
                        print("onSaved value is : $value");
                      },
                      validator: (String? value) {
                        return (value != null &&
                                AppConst.emailRegExp.hasMatch(value))
                            ? null
                            : "error do not contain @gmail.com ";
                      },
                    ),
                    spacerH20,
                    CustomTextField(
                      hint: "password ",
                      prefixIcon: const Icon(Icons.lock),
                      myController: passwordController,
                      validator: (String? value) {
                        return (value!.isEmpty || value.length <= 6)
                            ? "should_be_less_that_8_character"
                            : null;
                      },
                      isSecure: isSecured,
                      suffixIcon: isSecured
                          ? IconButton(
                              onPressed: () {
                                isSecured = false;
                                // setState(() {});
                              },
                              icon: const Icon(Icons.visibility_off),
                            )
                          : IconButton(
                              onPressed: () {
                                isSecured = true;
                                // setState(() {});
                              },
                              icon: const Icon(Icons.remove_red_eye_outlined),
                            ),
                    ),
                    spacerH20,
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () async {
                          context.read<AuthCubit>().singInEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );

                          if (state is SignInSuccessState) {
                            AppSnackBar.success(context: context);
                            Navigator.pushNamed(context, HomeView.id);
                          }
                          if (state is SignInFailedState) {
                            // print("*** ${LoginUserFailedState().error}");

                            AppSnackBar.failure(context,
                                text: "Invalid login credentials");
                          }
                        },
                        child: Text(
                          "sign in",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),

                    spacerH20,
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text("Do not have account ? ",
                          style: Theme.of(context).textTheme.headlineMedium),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterView.id);
                        },
                        child: Text(
                          " register",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ]),
                    spacerH20,

                    ElevatedButton(
                      onPressed: () async {
                        //sing in with google
                        try {
                          context.read<AuthCubit>().signInWithGoogle();
                          if (state is SignedGoogleSuccessState) {
                            Navigator.pushNamed(context, HomeView.id);
                          }
                        } catch (e) {
                          AppSnackBar.failure(context, text: e.toString());
                        }
                      },
                      child: SizedBox(
                        height: 45,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 80,
                            ),
                            Image.asset("asset/image/google.png"),
                            const SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Sign in with google",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            spacerH20,
                          ],
                        ),
                      ),
                    ),
                    //phone num
                    spacerH20,

                    ElevatedButton(
                      onPressed: () {
                        //sing in with google
                        Navigator.of(context).pushNamed(PhoneView.id);
                      },
                      child: SizedBox(
                        height: 45,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 80,
                            ),
                            const Icon(Icons.phone_android_rounded),
                            const SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Text(
                                "Sign in with phone number",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            spacerH20,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
