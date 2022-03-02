import 'package:bloc/bloc.dart';
import 'package:test_app/bloc/theme_state.dart';

class ThemeBloc extends Cubit<ThemeState> {
  ThemeBloc()
      : super(ThemeState(
          false,
        ));

  Future changeIsDark() async {
    emit (ThemeState(!state.isDark));
  }
}
