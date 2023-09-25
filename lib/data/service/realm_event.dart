import 'dart:async';
import 'package:alowin_mini/data/model/realm/realm_model.dart';
import 'package:alowin_mini/data/service/other_service.dart';
import 'package:alowin_mini/data/service/stream_event.dart';
import 'package:alowin_mini/utils/common/convert_util.dart';
import 'package:realm/realm.dart';

// class ProductItem {
//   String label;
//   String sku;
//   String uom;
//   double price;
//   String? barcode;
//
//   ProductItem(
//       {required this.label,
//       required this.sku,
//       required this.uom,
//       required this.price,
//       this.barcode});
//
//   factory ProductItem.fromJson(Map<String, dynamic> json) {
//     return ProductItem(
//         label: json['label'],
//         sku: json['sku'],
//         uom: json['uom'],
//         price: json['price'],
//         barcode: json['barcode']);
//   }
// }
//
// class ProductPurchaseItem {
//   String label;
//   String sku;
//   List<String>? uom;
//   List<String>? uomName;
//
//   ProductPurchaseItem(
//       {required this.label,
//       required this.sku,
//       required this.uom,
//       required this.uomName
//       });
//
//   factory ProductPurchaseItem.fromJson(Map<String, dynamic> json) {
//     return ProductPurchaseItem(
//         label: json['label'],
//         sku: json['sku'],
//         uom: json['uom'] != null ? List.from(json['uom']) : null,
//         uomName: json['uomName'] != null ? List.from(json['uomName']) : null,
//         );
//   }
// }

class RealmEvent {
  static Timer? schedule;
  static Realm realm = Realm(Configuration.local(
      [ProductPTM.schema],
      isReadOnly: false, schemaVersion: 4));

  static Future<void> startSchedule() async {
    RealmEvent.schedule ??=
        Timer.periodic(const Duration(minutes: 30), (timer) {
      // syncLastUpdated();
    });
  }

  static Future<ProductPTM?> getProduct(String sku) async {
    var results = realm.query<ProductPTM>('sku == \$0', [sku]);
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  static Future<List<ProductPTM>?> getAllProduct() async {
    var results = realm.all<ProductPTM>();
    if (results.isNotEmpty) {
      return results.toList();
    }
    return [];
  }

  // static Future<ProductUnits?> getProductUnitByUomInSaleOrder(
  //     Products product, String uom) async {
  //   ProductUnits? results;
  //   for (var item in product.units) {
  //     if (item.code == uom) {
  //       results = item;
  //       break;
  //     }
  //   }
  //   return results;
  // }

  // static Future<ProductUnits?> getProductUnitByUom(
  //     Products product, String uomName) async {
  //   // var results = product.realm.query<ProductUnits>('code == \$0', [uom]);
  //   // return results.first;
  //
  //   ProductUnits? results;
  //   for (var item in product.units) {
  //     if (item.name == uomName) {
  //       results = item;
  //       break;
  //     }
  //   }
  //   // var results = product.units.firstWhere((element) => element.keywords.contains(uom));//   realm.query<ProductUnits>('keywords == \$0', [uom]);
  //   return results;
  // }

  // static Future<Products?> search(String keywords, {String? uom}) async {
  //   if (uom == null) {
  //     var results = realm.query<Products>('keywords == \$0', [keywords]);
  //     if (results.isNotEmpty) {
  //       return results.first;
  //     }
  //   } else {
  //     var results = realm.query<Products>(
  //         'keywords == \$0 and units.keywords == \$1', [keywords, uom]);
  //     if (results.isNotEmpty) {
  //       return results.first;
  //     }
  //   }
  //   return null;
  // }

  // static Future<List> searchProductList(String keywords) async {
  //   List list = [];
  //   if (keywords.isEmpty) {
  //     return list;
  //   }
  //   if (keywords.length < 3) {
  //     return list;
  //   }
  //   var cursor = realm.query<Products>('keywords LIKE[c] \$0', ['*$keywords*']);
  //   if (cursor.isEmpty) {
  //     cursor = realm.query<Products>('name LIKE[c] \$0', ['*$keywords*']);
  //   }
  //   if (cursor.isEmpty && ConvertUtil.isNumeric(keywords) && keywords.length > 2) {
  //     cursor = realm.query<Products>('sku LIKE[c] \$0', ['*$keywords*']);
  //   }
  //   if (cursor.isEmpty && keywords.length > 8) {
  //     cursor = realm.query<Products>('units.productBarcodes LIKE[c] \$0', ['*$keywords*']);
  //     for (var item in cursor) {
  //       for (var item2 in item.units) {
  //         if(item2.productBarcodes.isNotEmpty){
  //           for (int i = 0; i < item2.productBarcodes.length; i++){
  //             list.add(ProductItem.fromJson({
  //               'label': '${item.name} - [${item2.code}] - ${item2.productBarcodes[i]}',
  //               'sku': item.sku,
  //               'uom': item2.code,
  //               'price': item2.sellPrice,
  //               'barcode': item2.productBarcodes[i]
  //             }));
  //           }
  //         }
  //       }
  //     }
  //
  //     return list;
  //   }
  //
  //   for (var item in cursor) {
  //     for (var item2 in item.units) {
  //       var labelProducts = '${item.sku} - ${item.name} - [${item2.code}]';
  //       list.add(ProductItem.fromJson({
  //         'label': labelProducts,
  //         'sku': item.sku,
  //         'uom': item2.code,
  //         'price': item2.sellPrice
  //       }));
  //     }
  //   }
  //   return list;
  // }

  // static Future<List> searchProductInPurchase(String keywords) async {
  //   List list = [];
  //   if (keywords.length < 3) {
  //     return list;
  //   }
  //   var cursor = realm.query<Products>('keywords LIKE[c] \$0', ['*$keywords*']);
  //   if (cursor.isEmpty) {
  //     cursor = realm.query<Products>('name LIKE[c] \$0', ['*$keywords*']);
  //   }
  //   if (cursor.isEmpty && ConvertUtil.isNumeric(keywords) && keywords.length > 2) {
  //     cursor = realm.query<Products>('sku LIKE[c] \$0', ['*$keywords*']);
  //   }
  //
  //   for (var item in cursor) {
  //     var labelProducts = '${item.sku} - ${item.name}';
  //     var listUom = [];
  //     var listUomName = [];
  //     for (var item2 in item.units) {
  //       listUom.add(item2.code);
  //     }
  //     for (var item2 in item.units) {
  //       listUomName.add(item2.name);
  //     }
  //     list.add(ProductPurchaseItem.fromJson({
  //       'label': labelProducts,
  //       'sku': item.sku,
  //       'uom': listUom,
  //       'uomName': listUomName,
  //     }));
  //   }
  //   return list;
  // }

  // static Future<ProductUnits?> getProductUnit(
  //     Products product, String uom) async {
  //   ProductUnits? results;
  //   for (var item in product.units) {
  //     if (item.keywords.contains(uom)) {
  //       results = item;
  //       break;
  //     }
  //   }
  //   // var results = product.units.firstWhere((element) => element.keywords.contains(uom));//   realm.query<ProductUnits>('keywords == \$0', [uom]);
  //   return results;
  // }

  static Future<void> syncFile() async {
    int maxLimit = 100;
    int runUnit = 0;
    List<String> skus = [];

    await Future.delayed(const Duration(seconds: 2));

    realm.write(
        () => {realm.deleteAll<ProductPTM>()});

    // realm.close();
    // if(realm.isClosed) {
    //   realm = Realm(Configuration.local(
    //       [Products.schema, ProductUnits.schema, Settings.schema],
    //       isReadOnly: false));
    // }
    while (true) {
      if (runUnit >= maxLimit) {
        break;
      }
      runUnit += 1;
      var result = await syncProduct();
      if (result.isEmpty) {
        break;
      }
      skus.addAll(result); // + result;
    }

    startSchedule();
  }

  // static Future<void> syncLastUpdated() async {
  //   await syncLastUpdateProduct(StreamEvent.siteId, "");
  // }

  static Future<List<String>> syncProduct() async {
    List<String> resp = [];
    var result = await OtherService.getProducts();
    if (result.productPTM!.isNotEmpty) {
      for (var item in result.productPTM!) {
        resp.add(item.sku);
      }

      final transaction = realm.beginWrite();
      try {
        //add new keys
        realm.addAll(result.productPTM!);

        transaction.commit();
      } catch (e) {
        transaction.rollback();
      }
    }
    return resp;
  }

  // static Future<void> syncLastUpdateProduct(String siteId, String skus) async {
  //   var result = await HttpRealmService.getProducts(siteId, skus, "OK");
  //   if (result.products!.isNotEmpty) {
  //     final transaction = realm.beginWrite();
  //     try {
  //       for (var item in result.products!) {
  //         var realmItems = realm.query<Products>('sku == \$0', [item.sku]);
  //         if (realmItems.isNotEmpty) {
  //           realm.deleteMany(realmItems.first.units);
  //           realm.delete(realmItems.first);
  //         }
  //         if (item.units.isNotEmpty) {
  //           realm.add(item);
  //         }
  //       }
  //       transaction.commit();
  //     } catch (e) {
  //       transaction.rollback();
  //     }
  //   }
  // }
}
