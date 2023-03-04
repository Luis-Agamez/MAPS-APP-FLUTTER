part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMpaInitialized;
  final bool isFollowingUser;
  final bool showMyRoute;

  // Polylines
  /* 
 'my_route : {
   id : polyneID Google,
   points : [lat,lng] , [1223,2131312] , [121,213121],
   width : 3
   color:black067
 }
  */

  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;

  const MapState(
      {this.isMpaInitialized = false,
      this.isFollowingUser = true,
      this.showMyRoute = true,
      Map<String, Marker>? markers,
      Map<String, Polyline>? polylines})
      : polylines = polylines ?? const {},
        markers = markers ?? const {};

  MapState copyWith(
          {bool? isMpaInitialized,
          bool? isFollowingUser,
          bool? showMyRoute,
          Map<String, Polyline>? polylines,
          Map<String, Marker>? markers}) =>
      MapState(
          isMpaInitialized: isMpaInitialized ?? this.isMpaInitialized,
          isFollowingUser: isFollowingUser ?? this.isFollowingUser,
          showMyRoute: showMyRoute ?? this.showMyRoute,
          polylines: polylines ?? this.polylines,
          markers: markers ?? this.markers);

  @override
  List<Object> get props =>
      [isMpaInitialized, isFollowingUser, showMyRoute, polylines, markers];
}
