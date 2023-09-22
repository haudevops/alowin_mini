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

import 'package:realm/realm.dart';
part 'realm_model.g.dart';

@RealmModel()
class _Products {
  @PrimaryKey()
  late String id;

  late String sku;
  late String name;
  late String baseUOM;
  late String baseUOMName;
  List<String> keywords = const [];
  List<_ProductUnits> units = const [];
}

@RealmModel()
class _ProductUnits {
  @PrimaryKey()
  late String id;
  late String code;
  late String name;
  late double sellPrice;
  late double memberPrice;
  late double wholesalePrice;
  late double wholesaleMinQty;
  late double wholeSaleBillMinQty;
  late int numerator;
  late int denominator;
  late int baseUnit;
  late int vatGroup;
  late int vatRate;
  late List<String> keywords;
  late List<String> productBarcodes;
}

@RealmModel()
class _Settings {
  @PrimaryKey()
  late String id;

  late String siteId;
  late String siteName;
  late String siteAddress;
}