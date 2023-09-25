import 'dart:convert';
import 'dart:developer';
import 'package:alowin_mini/data/model/realm/realm_cloud.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class OtherService {
  OtherService._internal();

  static final OtherService instance = OtherService._internal();

  final commandFileURi =
      'https://api-supra.winmart.vn/mnt/mobile/iot/uat/commands_iot6.json';

  Future<void> getDataCommand() async {
    final dio = Dio();
    final response = await dio.get(commandFileURi);
    log('Data Response: ${response.data}');

    if (response.statusCode != 200) {
      print('Fail');
    }

    return response.data!;
  }

  static Future<HttpRealmResult> getProducts() async {
    final data = await rootBundle.loadString("assets/json/product_data.json");
    final jsonResult = jsonDecode(data);
    if (kDebugMode) print(jsonResult);
    return HttpRealmResult.fromJson(jsonResult);
  }

}
