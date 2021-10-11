import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationState(currentPage: 0));

  void pageChanged(int page) => emit(BottomNavigationState(currentPage: page));

  void scrollTopPage() => emit(state.copyWith(isScrollToTop: true));

  void pageScrolled() => emit(state.copyWith(isScrollToTop: false));
}
