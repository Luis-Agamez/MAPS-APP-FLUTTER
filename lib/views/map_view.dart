import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mpas_app_bloc/blocs/map/map_bloc.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;
  final Set<Polyline> polylines;
  final Set<Marker> markers;

  const MapView(
      {Key? key,
      required this.initialLocation,
      required this.polylines,
      required this.markers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final CameraPosition initialCameraPosition =
        CameraPosition(target: initialLocation, zoom: 15);

    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        height: size.height,
        child: Listener(
          onPointerMove: (pointerMoveEvent) =>
              mapBloc.add(OnStopFollowingUserEvent()),
          child: GoogleMap(
              compassEnabled: false,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              polylines: polylines,
              markers: markers,
              onCameraMove: (position) => mapBloc.mapCenter = position.target,
              onMapCreated: (controller) =>
                  mapBloc.add(OnMapInitializedEvent(controller)),
              initialCameraPosition: initialCameraPosition),
        ));
  }
}
