import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  StreamSubscription? gpsServiceSubscription;

  GpsBloc()
      : super(const GpsState(isGpsEnabled: false, isGpsPermission: false)) {
    on<GpsAndPermissionEvent>((event, emit) => emit(state.copyWith(
        isGpsEnabled: event.isGpsEnabled,
        isGpsPermission: event.isGpsPermission)));
    _init();
  }

  Future<void> _init() async {
    // final isEnable = await _chechGpsStatus();
    // final isGranted = await _isPermissionGranted();

    final gpsInitStatus =
        await Future.wait([_chechGpsStatus(), _isPermissionGranted()]);

    add(GpsAndPermissionEvent(
        isGpsEnabled: gpsInitStatus[0], isGpsPermission: gpsInitStatus[1]));
  }

  Future<bool> _isPermissionGranted() async {
    final isGranted = await Permission.location.isGranted;
    return isGranted;
  }

  Future<bool> _chechGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();

    gpsServiceSubscription =
        Geolocator.getServiceStatusStream().listen((event) {
      //Error ---------------------------------
      final isEnable = (event.index == 1) ? true : false;
      add(GpsAndPermissionEvent(
          isGpsEnabled: isEnable, isGpsPermission: state.isGpsPermission));
    });
    return isEnable;
  }

  Future<void> askGpsAccess() async {
    final status = await Permission.location.request();
    switch (status) {
      case PermissionStatus.granted:
        add(GpsAndPermissionEvent(
            isGpsEnabled: state.isGpsEnabled, isGpsPermission: true));
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        add(GpsAndPermissionEvent(
            isGpsEnabled: state.isGpsEnabled, isGpsPermission: false));
        openAppSettings();
    }
  }

  @override
  Future<void> close() {
    // TODO: Services Status Stream
    gpsServiceSubscription?.cancel();
    return super.close();
  }
}
