import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/cubits/login/login_cubit.dart';
import 'package:food_app/repositories/auth_repository.dart';
import 'package:food_app/widgets/custom_appbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LoginScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: Theme.of(context)
              .textTheme
              .headline2
              ?.copyWith(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: BlocProvider(
                create: (context) => LoginCubit(context.read<AuthRepository>()),
                child: BlocListener<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state.status == LoginStatus.error) {
                      // Do something if there is an error
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (previous, current) =>
                            previous.email != current.email,
                        builder: (context, state) {
                          return TextFormField(
                            controller: emailController,
                            onChanged: (email) {
                              context.read<LoginCubit>().emailChanged(email);
                            },
                            decoration: const InputDecoration(
                              hintText: 'Email',
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (previous, current) =>
                            previous.password != current.password,
                        builder: (context, state) {
                          return TextFormField(
                            controller: passwordController,
                            onChanged: (password) {
                              context
                                  .read<LoginCubit>()
                                  .passwordChanged(password);
                            },
                            decoration: const InputDecoration(
                              hintText: 'Password',
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (previous, current) =>
                            previous.status != current.status,
                        builder: (context, state) {
                          return state.status == LoginStatus.submitting
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<LoginCubit>()
                                        .loginWithCredentials()
                                        .then((value) => Navigator.pushNamed(
                                            context, '/home'));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).primaryColor),
                                  child: const Text('Login'),
                                );
                        },
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (previous, current) =>
                            previous.status != current.status,
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () {
                              context.read<LoginCubit>().loginWithGoogle().then(
                                  (value) =>
                                      Navigator.pushNamed(context, '/home'));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).primaryColorLight),
                            child: const Text(
                              'Sign in with Google',
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            child: Text('Sign up',
                                style: Theme.of(context).textTheme.headline5),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor),
              child: const Text(
                'Skip',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
