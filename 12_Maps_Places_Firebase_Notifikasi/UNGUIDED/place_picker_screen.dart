import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlacePickerScreen extends StatefulWidget {
  const PlacePickerScreen({super.key});

  @override
  State<PlacePickerScreen> createState() => PlacePickerScreenState();
}

class PlacePickerScreenState extends State<PlacePickerScreen> {
  String? _pickedAddress;
  List<String> _nearbyPlaces = [];

  Future<void> _fetchNearbyPlaces(LatLng location) async {
    const apiKey = "AIzaSyCk-Xn1tjqaWbwJGw1h9HBxHuXJuUUQCt8";
    final url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${location.latitude},${location.longitude}&radius=500&key=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _nearbyPlaces = (data['results'] as List)
              .map((place) => place['name'] as String)
              .toList();
        });
      } else {
        throw Exception('Failed to load nearby places');
      }
    } catch (e) {
      debugPrint("Error fetching nearby places: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Picker'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: PlacePicker(
              apiKey: "AIzaSyCk-Xn1tjqaWbwJGw1h9HBxHuXJuUUQCt8",
              onPlacePicked: (LocationResult result) {
                setState(() {
                  _pickedAddress = result.formattedAddress ?? "No Address Available";
                });

                
                if (result.latLng != null) {
                  _fetchNearbyPlaces(result.latLng!);
                }
              },
              initialLocation: const LatLng(
                -7.4350662019925515,
                109.24915663879061,
              ),
              searchInputConfig: const SearchInputConfig(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                autofocus: false,
                textDirection: TextDirection.ltr,
              ),
              searchInputDecorationConfig: const SearchInputDecorationConfig(
                hintText: "Search for a building, street or ...",
              ),
              enableNearbyPlaces: true,
              showSearchInput: true,
            ),
          ),
          if (_pickedAddress != null || _nearbyPlaces.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Picked Location:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(_pickedAddress ?? "Loading address..."),
                  const SizedBox(height: 8),
                  const Text(
                    "Nearby Places:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  ..._nearbyPlaces.map((place) => Text("- $place")).toList(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
