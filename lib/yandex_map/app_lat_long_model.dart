class AppLatLong {
  final double lat;
  final double long;

  const AppLatLong({
    required this.lat,
    required this.long,
  });
}

class TashkentLocation extends AppLatLong {
  const TashkentLocation({
    super.long = 69.26778,
    super.lat = 41.308932,
  });
}