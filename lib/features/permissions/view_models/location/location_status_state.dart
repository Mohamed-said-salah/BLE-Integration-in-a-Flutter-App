part of 'location_status_cubit.dart';

sealed class LocationStatusState extends Equatable {
  const LocationStatusState();

  @override
  List<Object> get props => [];
}

final class LocationStatusInitial extends LocationStatusState {}

final class LocationEnabled extends LocationStatusState {}

final class LocationDisabled extends LocationStatusState {}
