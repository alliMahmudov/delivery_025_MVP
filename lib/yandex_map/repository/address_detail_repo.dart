/*
import 'package:delivery_025/model/address_detail_model.dart';
import 'package:delivery_025/yandex_map/app_lat_long_model.dart';
import 'package:dio/dio.dart';


class AddressDetailRepository {
  @override
  Future<AddressDetailModel?> getAddressDetail(AppLatLong latLong) async {
    String mapApiKey = "3f949ddb-76a8-409a-b0fb-b3e69b3d9bc6";
    try {
      Map<String, String> queryParams = {
        'apikey': "3f949ddb-76a8-409a-b0fb-b3e69b3d9bc6",
        'geocode': "${latLong.long},${latLong.lat}",
        'lang': 'uz',
        'format': 'json',
        'results': '1'
      };
      Dio yandexDio = Dio();
      var response = await yandexDio.get(
        "https://geocode-maps.yandex.ru/1.x/",
        queryParameters: queryParams,
      );
      return AddressDetailModel.fromJson(response.data);
    } catch (e) {
      print("Error $e");
    }
  }
}
*/
