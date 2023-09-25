class DataProductModel {
  DataProductModel({this.productItem});

  factory DataProductModel.fromJson(Map<String, dynamic> json) {
    return DataProductModel(
      productItem: json['data'] != null
          ? List<ProductItem>.from(
          json['data'].map((x) => ProductItem.fromJson(x)))
          : [],
    );
  }

  List<ProductItem>? productItem;
}

class ProductItem {
  ProductItem({this.sku, this.skuName, this.location, this.pickQty, this.suggestionName});

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      sku: json['sku'],
      skuName: json['skuName'],
      location: json['location'],
      pickQty: json['pickQty'],
      suggestionName: json['suggestName']
    );
  }

  String? sku;
  String? skuName;
  String? location;
  String? pickQty;
  String? suggestionName;
}