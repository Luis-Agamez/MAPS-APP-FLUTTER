part of 'location_bloc.dart';

class LocationState extends Equatable {
  final bool followingUser;
  //TODO last location
  final LatLng? lastKnownLocation;
  final List<LatLng> myLocationHistory;

  const LocationState(
      {this.followingUser = false, myLocationHistory, this.lastKnownLocation})
      : myLocationHistory = myLocationHistory ?? const [];

  LocationState copyWith(
          {final bool? followingUser,
          final LatLng? lastKnownLocation,
          final List<LatLng>? myLocationHistory}) =>
      LocationState(
          followingUser: followingUser ?? this.followingUser,
          lastKnownLocation: lastKnownLocation ?? this.lastKnownLocation,
          myLocationHistory: myLocationHistory ?? this.myLocationHistory);

  @override
  List<Object?> get props =>
      [followingUser, lastKnownLocation, myLocationHistory];
}
