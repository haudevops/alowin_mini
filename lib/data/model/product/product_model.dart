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
  ProductItem({this.product, this.location, this.sku, this.unit, this.suggestionName});

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      product: json['product'],
      location: json['location'],
      sku: json['sku'],
      unit: json['unit'] != null
          ? List.from(json['unit'])
          : null,
      suggestionName: json['suggestionName'] != null
          ? List.from(json['suggestionName'])
          : null,
    );
  }

  String? product;
  String? location;
  String? sku;
  List<String>? unit;
  List<String>? suggestionName;
}