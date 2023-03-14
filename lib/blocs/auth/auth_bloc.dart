import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/models/models.dart';

import '../../repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<auth.User?>? _authUserSubscription;
  StreamSubscription<UserModel?>? _userModelSubscription;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(authRepository.currentUser.isNotEmpty
            ? AuthState.authenticated(userModel: authRepository.currentUser)
            : AuthState.unauthenticated()) {
    on<AuthUserChanged>(_onAuthUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);

    _userModelSubscription = _authRepository.user.listen((user) => add(AuthUserChanged(userModel: user)));
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    emit(event.userModel!.isNotEmpty
        ? AuthState.authenticated(userModel: event.userModel!)
        : AuthState.unauthenticated());
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AuthState> emit){
unawaited(_authRepository.signOut());
  }

  @override
  Future<void> close() {
    _authUserSubscription?.cancel();
    _userModelSubscription?.cancel();
    return super.close();
  }
}
