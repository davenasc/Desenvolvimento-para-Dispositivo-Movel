import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MapScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  StreamSubscription<Position>? _positionSubscription;
  LatLng? _currentPosition;
  bool _permissionGranted = false;

  @override
  void initState() {
    super.initState();
    _initLocationTracking();
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _mapController?.dispose();
    super.dispose();
  }

  void _initLocationTracking() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    setState(() {
      _permissionGranted = true;
    });

    _positionSubscription = Geolocator.getPositionStream().listen((
      Position position,
    ) {
      final newLatLng = LatLng(position.latitude, position.longitude);

      setState(() {
        _currentPosition = newLatLng;
      });

      _mapController?.animateCamera(CameraUpdate.newLatLng(newLatLng));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Sample App'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: !_permissionGranted
          ? const Center(child: Text('Permissão de localização necessária'))
          : _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentPosition!,
                zoom: 16,
              ),
              onMapCreated: (controller) => _mapController = controller,
              markers: {
                Marker(
                  markerId: const MarkerId('current_location'),
                  position: _currentPosition!,
                ),
              },
            ),
    );
  }
}
