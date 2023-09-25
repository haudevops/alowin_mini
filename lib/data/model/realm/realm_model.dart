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
class _ProductPTM{
  @PrimaryKey()
  late String id;

  late String sku;
  late String skuName;
  late String location;
  late String pickQty;
  late String suggestName;
}