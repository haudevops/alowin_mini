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

class Products extends _Products
    with RealmEntity, RealmObjectBase, RealmObject {
  Products(
    String id,
    String sku,
    String name,
    String baseUOM,
    String baseUOMName, {
    Iterable<String> keywords = const [],
    Iterable<ProductUnits> units = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'sku', sku);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'baseUOM', baseUOM);
    RealmObjectBase.set(this, 'baseUOMName', baseUOMName);
    RealmObjectBase.set<RealmList<String>>(
        this, 'keywords', RealmList<String>(keywords));
    RealmObjectBase.set<RealmList<ProductUnits>>(
        this, 'units', RealmList<ProductUnits>(units));
  }

  Products._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;

  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get sku => RealmObjectBase.get<String>(this, 'sku') as String;

  @override
  set sku(String value) => RealmObjectBase.set(this, 'sku', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;

  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get baseUOM => RealmObjectBase.get<String>(this, 'baseUOM') as String;

  @override
  set baseUOM(String value) => RealmObjectBase.set(this, 'baseUOM', value);

  @override
  String get baseUOMName =>
      RealmObjectBase.get<String>(this, 'baseUOMName') as String;

  @override
  set baseUOMName(String value) =>
      RealmObjectBase.set(this, 'baseUOMName', value);

  @override
  RealmList<String> get keywords =>
      RealmObjectBase.get<String>(this, 'keywords') as RealmList<String>;

  @override
  set keywords(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<ProductUnits> get units =>
      RealmObjectBase.get<ProductUnits>(this, 'units')
          as RealmList<ProductUnits>;

  @override
  set units(covariant RealmList<ProductUnits> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Products>> get changes =>
      RealmObjectBase.getChanges<Products>(this);

  @override
  Products freeze() => RealmObjectBase.freezeObject<Products>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;

  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Products._);
    return const SchemaObject(ObjectType.realmObject, Products, 'Products', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('sku', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('baseUOM', RealmPropertyType.string),
      SchemaProperty('baseUOMName', RealmPropertyType.string),
      SchemaProperty('keywords', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('units', RealmPropertyType.object,
          linkTarget: 'ProductUnits', collectionType: RealmCollectionType.list),
    ]);
  }
}

class ProductUnits extends _ProductUnits
    with RealmEntity, RealmObjectBase, RealmObject {
  ProductUnits(
    String id,
    String code,
    String name,
    double sellPrice,
    double memberPrice,
    double wholesalePrice,
    double wholesaleMinQty,
    double wholeSaleBillMinQty,
    int numerator,
    int denominator,
    int baseUnit,
    int vatGroup,
    int vatRate, {
    Iterable<String> keywords = const [],
    Iterable<String> productBarcodes = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'code', code);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'sellPrice', sellPrice);
    RealmObjectBase.set(this, 'memberPrice', memberPrice);
    RealmObjectBase.set(this, 'wholesalePrice', wholesalePrice);
    RealmObjectBase.set(this, 'wholesaleMinQty', wholesaleMinQty);
    RealmObjectBase.set(this, 'wholeSaleBillMinQty', wholeSaleBillMinQty);
    RealmObjectBase.set(this, 'numerator', numerator);
    RealmObjectBase.set(this, 'denominator', denominator);
    RealmObjectBase.set(this, 'baseUnit', baseUnit);
    RealmObjectBase.set(this, 'vatGroup', vatGroup);
    RealmObjectBase.set(this, 'vatRate', vatRate);
    RealmObjectBase.set<RealmList<String>>(
        this, 'keywords', RealmList<String>(keywords));
    RealmObjectBase.set<RealmList<String>>(
        this, 'productBarcodes', RealmList<String>(productBarcodes));
  }

  ProductUnits._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;

  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get code => RealmObjectBase.get<String>(this, 'code') as String;

  @override
  set code(String value) => RealmObjectBase.set(this, 'code', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;

  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  double get sellPrice =>
      RealmObjectBase.get<double>(this, 'sellPrice') as double;

  @override
  set sellPrice(double value) => RealmObjectBase.set(this, 'sellPrice', value);

  @override
  double get memberPrice =>
      RealmObjectBase.get<double>(this, 'memberPrice') as double;

  @override
  set memberPrice(double value) =>
      RealmObjectBase.set(this, 'memberPrice', value);

  @override
  double get wholesalePrice =>
      RealmObjectBase.get<double>(this, 'wholesalePrice') as double;

  @override
  set wholesalePrice(double value) =>
      RealmObjectBase.set(this, 'wholesalePrice', value);

  @override
  double get wholesaleMinQty =>
      RealmObjectBase.get<double>(this, 'wholesaleMinQty') as double;

  @override
  set wholesaleMinQty(double value) =>
      RealmObjectBase.set(this, 'wholesaleMinQty', value);

  @override
  double get wholeSaleBillMinQty =>
      RealmObjectBase.get<double>(this, 'wholeSaleBillMinQty') as double;

  @override
  set wholeSaleBillMinQty(double value) =>
      RealmObjectBase.set(this, 'wholeSaleBillMinQty', value);

  @override
  int get numerator => RealmObjectBase.get<int>(this, 'numerator') as int;

  @override
  set numerator(int value) => RealmObjectBase.set(this, 'numerator', value);

  @override
  int get denominator => RealmObjectBase.get<int>(this, 'denominator') as int;

  @override
  set denominator(int value) => RealmObjectBase.set(this, 'denominator', value);

  @override
  int get baseUnit => RealmObjectBase.get<int>(this, 'baseUnit') as int;

  @override
  set baseUnit(int value) => RealmObjectBase.set(this, 'baseUnit', value);

  @override
  int get vatGroup => RealmObjectBase.get<int>(this, 'vatGroup') as int;

  @override
  set vatGroup(int value) => RealmObjectBase.set(this, 'vatGroup', value);

  @override
  int get vatRate => RealmObjectBase.get<int>(this, 'vatRate') as int;

  @override
  set vatRate(int value) => RealmObjectBase.set(this, 'vatRate', value);

  @override
  RealmList<String> get keywords =>
      RealmObjectBase.get<String>(this, 'keywords') as RealmList<String>;

  @override
  set keywords(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<String> get productBarcodes =>
      RealmObjectBase.get<String>(this, 'productBarcodes') as RealmList<String>;

  @override
  set productBarcodes(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<ProductUnits>> get changes =>
      RealmObjectBase.getChanges<ProductUnits>(this);

  @override
  ProductUnits freeze() => RealmObjectBase.freezeObject<ProductUnits>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;

  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ProductUnits._);
    return const SchemaObject(
        ObjectType.realmObject, ProductUnits, 'ProductUnits', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('code', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('sellPrice', RealmPropertyType.double),
      SchemaProperty('memberPrice', RealmPropertyType.double),
      SchemaProperty('wholesalePrice', RealmPropertyType.double),
      SchemaProperty('wholesaleMinQty', RealmPropertyType.double),
      SchemaProperty('wholeSaleBillMinQty', RealmPropertyType.double),
      SchemaProperty('numerator', RealmPropertyType.int),
      SchemaProperty('denominator', RealmPropertyType.int),
      SchemaProperty('baseUnit', RealmPropertyType.int),
      SchemaProperty('vatGroup', RealmPropertyType.int),
      SchemaProperty('vatRate', RealmPropertyType.int),
      SchemaProperty('keywords', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('productBarcodes', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }
}

class Settings extends _Settings
    with RealmEntity, RealmObjectBase, RealmObject {
  Settings(
    String id,
    String siteId,
    String siteName,
    String siteAddress,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'siteId', siteId);
    RealmObjectBase.set(this, 'siteName', siteName);
    RealmObjectBase.set(this, 'siteAddress', siteAddress);
  }

  Settings._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;

  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get siteId => RealmObjectBase.get<String>(this, 'siteId') as String;

  @override
  set siteId(String value) => RealmObjectBase.set(this, 'siteId', value);

  @override
  String get siteName =>
      RealmObjectBase.get<String>(this, 'siteName') as String;

  @override
  set siteName(String value) => RealmObjectBase.set(this, 'siteName', value);

  @override
  String get siteAddress =>
      RealmObjectBase.get<String>(this, 'siteAddress') as String;

  @override
  set siteAddress(String value) =>
      RealmObjectBase.set(this, 'siteAddress', value);

  @override
  Stream<RealmObjectChanges<Settings>> get changes =>
      RealmObjectBase.getChanges<Settings>(this);

  @override
  Settings freeze() => RealmObjectBase.freezeObject<Settings>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;

  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Settings._);
    return const SchemaObject(ObjectType.realmObject, Settings, 'Settings', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('siteId', RealmPropertyType.string),
      SchemaProperty('siteName', RealmPropertyType.string),
      SchemaProperty('siteAddress', RealmPropertyType.string),
    ]);
  }
}
