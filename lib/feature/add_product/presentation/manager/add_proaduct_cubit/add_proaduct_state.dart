part of 'add_proaduct_cubit.dart';

@immutable
sealed class AddProaductState {}

final class AddProaductInitial extends AddProaductState {}

final class AddProaductLoading extends AddProaductState {}

final class AddProaductSuccess extends AddProaductState {}

final class AddProaductFailure extends AddProaductState {
  AddProaductFailure({required this.message});
  final String message;
}
