part of 'bottom_navigation_cubit.dart';

class BottomNavigationState extends Equatable {
  late final int currentPage;
  late final bool isScrollToTop;

  BottomNavigationState(
      {required this.currentPage, this.isScrollToTop = false});

  BottomNavigationState copyWith({int? currentPage, bool? isScrollToTop}) {
    return BottomNavigationState(
      currentPage: currentPage ?? this.currentPage,
      isScrollToTop: isScrollToTop ?? this.isScrollToTop,
    );
  }

  @override
  List<Object?> get props => [currentPage, isScrollToTop];
}
