part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState({required this.error});
}

final class HomeSuccessState extends HomeState {}
