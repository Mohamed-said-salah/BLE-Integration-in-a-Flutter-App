import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_status_state.dart';

class LocationStatusCubit extends Cubit<LocationStatusState> {
  LocationStatusCubit._internal() : super(LocationStatusInitial()) {
    _locationStateSubscription =
        Geolocator.getServiceStatusStream().listen((locationState) {
      if (locationState == ServiceStatus.disabled) {
        emit(LocationDisabled());
      } else {
        emit(LocationEnabled());
      }
    });

    // get the location state when app starts
    Geolocator.isLocationServiceEnabled().then((locationState) {
      // and if location is turned off the app will start with
      // enable location screen as home
      if (locationState) {
        emit(LocationEnabled());
      } else {
        emit(LocationDisabled());
      }
    });
  }

  // Singleton instance
  static final LocationStatusCubit _instance = LocationStatusCubit._internal();
  factory LocationStatusCubit() => _instance;

  // Initialize Location status listener
  StreamSubscription? _locationStateSubscription;

  @override
  Future<void> close() {
    _locationStateSubscription?.cancel();
    return super.close();
  }
}
