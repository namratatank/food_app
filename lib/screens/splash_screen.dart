import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/screens.dart';

import '../blocs/auth/auth_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SplashScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthBloc bloc) => bloc.state.userModel);
    Timer(const Duration(seconds: 3), () {
      user != null
          ? Navigator.pushNamed(context, '/home')
          : Navigator.pushNamed(context, '/login');
    });
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        print('Splash screen auth listener');
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/logo.svg'),
              const SizedBox(height: 10),
              Text('Eat More', style: Theme
                  .of(context)
                  .textTheme
                  .headline1),
            ],
          ),
        ),
      ),
    );
  }
}
