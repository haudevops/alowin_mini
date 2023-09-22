/*
 * @copyright
 * Copyright (c) 2023 OVTeam
 *
 * All Rights Reserved
 *
 * Licensed under the MIT License;
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * https://choosealicense.com/licenses/mit/
 *
 */


import 'package:alowin_mini/data/model/realm/realm_model.dart';

class HttpRealmResult {
  HttpRealmResult(
      {
         this.products
      });

  factory HttpRealmResult.fromJson(Map<String, dynamic> json) {
    ProductUnits parseProductUnits(dynamic json) {
      List<String> keys = <String>[];
      List<String> listBarcode = <String>[];
      if(json["keywords"] != null) {
        keys = List<String>.from(json["keywords"].map((x) => x));
      }
      if(json["productBarcodes"] != null) {
        listBarcode = List<String>.from(json["productBarcodes"].map((x) => x));
      }
      double? sellPrice = double.tryParse(json['sellPrice'].toString());
      double? memberPrice = double.tryParse(json['memberPrice'].toString());
      double? wholesalePrice = double.tryParse(json['wholesalePrice'].toString());
      double? wholesaleMinQty = double.tryParse(json['wholesaleMinQty'].toString());
      double? wholeSaleBillMinQty = double.tryParse(json['wholeSaleBillMinQty'].toString());
      return ProductUnits(
          json["code"],
          json["uom"],
          json["name"],
          sellPrice??0.0,
          memberPrice??0.0,
          wholesalePrice??0.0,
          wholesaleMinQty??0.0,
          wholeSaleBillMinQty??0.0,
          json["numerator"],
          json["denominator"],
          int.tryParse(json["baseUnit"].toString()) ?? 0,
          json["vatGroup"],
          json["VatRate"], keywords: keys, productBarcodes: listBarcode);
    }
    Products parseProduct(dynamic json) {
      List<String> keys = <String>[];
      if(json["keywords"] != null) {
        keys = List<String>.from(json["keywords"].map((x) => x));
      }
      List<ProductUnits> units = List<ProductUnits>.from(json["units"].map((x) => parseProductUnits(x)));
      return Products(
          json["sku"], json["sku"], json["name"],
          json["baseUOM"]??"", json["baseUOMName"]??"",
          keywords: keys, units: units);
    }

    return HttpRealmResult(
        products: List<Products>.from(json["products"].map((x1) => parseProduct(x1)))
    );

  }

  List<Products>? products = [];
}