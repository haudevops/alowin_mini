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

part of 'realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ProductPTM extends _ProductPTM with RealmEntity, RealmObjectBase, RealmObject {
  ProductPTM(
      String id,
      String sku,
      String skuName,
      String location,
      String pickQty,
      String suggestName
      ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'sku', sku);
    RealmObjectBase.set(this, 'skuName', skuName);
    RealmObjectBase.set(this, 'location', location);
    RealmObjectBase.set(this, 'pickQty', pickQty);
    RealmObjectBase.set(this, 'suggestName', suggestName);
  }

  ProductPTM._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;

  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get sku => RealmObjectBase.get<String>(this, 'sku') as String;

  @override
  set sku(String value) => RealmObjectBase.set(this, 'sku', value);

  @override
  String get skuName => RealmObjectBase.get<String>(this, 'skuName') as String;

  @override
  set skuName(String value) => RealmObjectBase.set(this, 'skuName', value);

  @override
  String get location => RealmObjectBase.get<String>(this, 'location') as String;

  @override
  set location(String value) => RealmObjectBase.set(this, 'location', value);

  @override
  String get pickQty => RealmObjectBase.get<String>(this, 'pickQty') as String;

  @override
  set pickQty(String value) => RealmObjectBase.set(this, 'pickQty', value);

  @override
  String get suggestName => RealmObjectBase.get<String>(this, 'suggestName') as String;

  @override
  set suggestName(String value) => RealmObjectBase.set(this, 'suggestName', value);

  @override
  ProductPTM freeze() => RealmObjectBase.freezeObject<ProductPTM>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;

  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ProductPTM._);
    return const SchemaObject(ObjectType.realmObject, ProductPTM, 'ProductPTM', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('sku', RealmPropertyType.string),
      SchemaProperty('skuName', RealmPropertyType.string),
      SchemaProperty('location', RealmPropertyType.string),
      SchemaProperty('pickQty', RealmPropertyType.string),
      SchemaProperty('suggestName', RealmPropertyType.string),
    ]);
  }
}
