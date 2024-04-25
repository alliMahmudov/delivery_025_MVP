/*
import 'package:delivery_025/constants/imports.dart';
import 'package:delivery_025/model/address_detail_model.dart';
import 'package:delivery_025/yandex_map/repository/address_detail_repo.dart';
import 'package:delivery_025/yandex_map/service.dart';
import 'package:dio/dio.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatefulWidget {
  static String id = "/map";

  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final mapControllerCompleter = Completer<YandexMapController>();
  String addressDetail = "";

  //final AddressDetailRepository repository = AddressDetailRepository();

  @override
  void initState() {
    _initPermission().ignore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(addressDetail),
        ),
        body: Stack(
          children: [
            */
/*YandexMap(
                onCameraPositionChanged: (cameraPosition, reason, finished) {},
                onMapCreated: (controller) {
                  mapControllerCompleter.complete(controller);
                }),*//*

            YandexMap(
              onCameraPositionChanged: (cameraPosition, reason, finished) async {
                // You can add code here to handle camera position changes if needed
                // Function to fetch address using reverse geocoding
                Future<String> getAddress(double latitude, double longitude) async {
                  String apiKey = '3f949ddb-76a8-409a-b0fb-b3e69b3d9bc6';
                  String url = 'https://geocode-maps.yandex.ru/1.x/?apikey=$apiKey&format=json&geocode=$longitude,$latitude';

                  // Create a Dio instance
                  Dio dio = Dio();

                  try {
                    // Make a GET request using Dio
                    Response response = await dio.get(url);

                    if (response.statusCode == 200) {
                      // Parse the response and extract the address
                      var data = response.data;
                      String address = data['response']['GeoObjectCollection']['featureMember'][0]['GeoObject']['metaDataProperty']['GeocoderMetaData']['text'];

                      return address;
                    } else {
                      // Handle error scenario
                      return 'Address not found';
                    }
                  } catch (e) {
                    // Handle Dio request exception
                    return 'Failed to fetch address: $e';
                  }
                }

                // Function to update the interface with the address
                void updateAddressDisplay(String address) {
                  // Update the UI with the fetched address, e.g., set a text label to display the address
                  // Example: addressLabel.text = address;
                }

                // Event listener/handler for when user sets their location on the map
                void onUserLocationSet(double latitude, double longitude) async {
                  // Call the getAddress function to fetch the address
                  String userLocationAddress = await getAddress(latitude, longitude);

                  // Update the UI to display the address to the user
                  updateAddressDisplay(userLocationAddress);
                }

                // Example usage of onUserLocationSet when the location is set by the user
                double userLatitude = 0.0; // Replace with actual latitude obtained from user interaction
                double userLongitude = 0.0; // Replace with actual longitude obtained from user interaction
                onUserLocationSet(userLatitude, userLongitude);
              },
              onMapCreated: (controller) {
                mapControllerCompleter.complete(controller);
              },
            ),
            Center(
                child: Icon(
              Icons.location_on,
              color: AppColors.mainColor,
              size: 40,
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          _fetchCurrentLocation();
        }),
      );
  }

  Future<void> updateAddressDetail(AppLatLong latLong) async {
    addressDetail = "...loading";
    setState(() {});
    AddressDetailModel? data = await repository.getAddressDetail(latLong);
    addressDetail = data !.responset!.geoObjectCollection!.featureMember!.isEmpty
        ? "unknown_place"
        : data.responset!.geoObjectCollection!.featureMember![0].geoObject!
            .metaDataProperty!.geocoderMetaData!.address!.formatted
            .toString();
    setState(() {});
    print(addressDetail);
  }

  Future<String> getAddress(double latitude, double longitude) async {
    String apiKey = '3f949ddb-76a8-409a-b0fb-b3e69b3d9bc6';
    String url =
        'https://geocode-maps.yandex.ru/1.x/?apikey=$apiKey&format=json&geocode=$longitude,$latitude';

    // Create a Dio instance
    Dio dio = Dio();

    try {
      // Make a GET request using Dio
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        // Parse the response and extract the address
        var data = response.data;
        String address = data['response']['GeoObjectCollection']['featureMember'][0]['GeoObject']['metaDataProperty']['GeocoderMetaData']['text'];

        return address;
      } else {
        // Handle error scenario
        return 'Address not found';
      }
    } catch (e) {
      // Handle Dio request exception
      return 'Failed to fetch address: $e';
    }
  }

  void onUserLocationSet(double latitude, double longitude) async {
    // Call the getAddress function to fetch the address
    String userLocationAddress = await getAddress(latitude, longitude);

    // Update the UI to display the address to the user
    updateAddressDisplay(userLocationAddress);
  }

// Function to update the user interface with the fetched address
  void updateAddressDisplay(String address) {
    // Update the UI with the fetched address, e.g., set a text label to display the address
    addressLabel.text = address;
  }

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = TashkentLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    location = defLocation;
    //updateAddressDetail(location);
    _moveToCurrentLocation(location);
  }

  Future<void> _moveToCurrentLocation(
    AppLatLong appLatLong,
  ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 15,
        ),
      ),
    );
  }
}
*/
