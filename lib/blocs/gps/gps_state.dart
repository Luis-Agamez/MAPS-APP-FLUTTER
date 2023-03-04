part of 'gps_bloc.dart';

class GpsState extends Equatable {
  final bool isGpsEnabled;
  final bool isGpsPermission;

  bool get isAllGranted => isGpsEnabled && isGpsPermission;

  const GpsState({required this.isGpsEnabled, required this.isGpsPermission});

  GpsState copyWith({
    final bool? isGpsEnabled,
    final bool? isGpsPermission,
  }) =>
      GpsState(
          isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
          isGpsPermission: isGpsPermission ?? this.isGpsPermission);

  @override
  List<Object> get props => [isGpsEnabled, isGpsPermission];
}
