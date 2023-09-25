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
         this.productPTM
      });

  factory HttpRealmResult.fromJson(Map<String, dynamic> json) {
    ProductPTM parseProduct(dynamic json) {
      return ProductPTM(
          json["id"],
          json["sku"],
          json["skuName"],
          json["location"],
          json["pickQty"],
          json["suggestName"]);
    }

    return HttpRealmResult(
        productPTM: List<ProductPTM>.from(json["data"].map((x1) => parseProduct(x1)))
    );

  }

  List<ProductPTM>? productPTM = [];
}