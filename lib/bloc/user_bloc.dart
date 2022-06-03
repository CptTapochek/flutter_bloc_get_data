import 'package:flutter_bloc_get_data/bloc/user_bloc_event.dart';
import 'package:flutter_bloc_get_data/bloc/user_bloc_state.dart';
import 'package:flutter_bloc_get_data/model/user.dart';
import 'package:flutter_bloc_get_data/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserEmptyState()) {
    on<UserLoadEvent>(
          (event, emit) async {
        emit(UserLoadingState());

        try {
          final List<User> loadedUserList = await userRepository.getAllUsers();
          emit(UserLoadedState(loadedUser: loadedUserList));
        } catch (_) {
          emit(UserErrorState());
        }
      },
    );
    on<UserClearEvent>(
          (event, emit) async {
        emit(UserEmptyState());
      },
    );
  }
}