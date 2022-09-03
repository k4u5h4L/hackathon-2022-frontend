import 'dart:convert';

import 'package:dr_jadoo/model/model_utilities.dart';

class AssetCreate {
  const AssetCreate({
    required this.name,
    required this.serialNumber,
    required this.model,
    required this.amount,
    required this.category,
    required this.categoryType,
    required this.purchaseDate,
    required this.manufacturedDate,
  });

  factory AssetCreate.fromJson(Map<String, dynamic> json) => AssetCreate(
        name: asT<String>(json['name'])!,
        serialNumber: asT<String>(json['serial_number'])!,
        model: asT<String>(json['model'])!,
        amount: asT<int>(json['amount'])!,
        category: asT<String>(json['category'])!,
        categoryType: asT<String>(json['category_type'])!,
        purchaseDate: asT<String>(json['purchase_date'])!,
        manufacturedDate: asT<String>(json['manufactured_date'])!,
      );

  final String name;
  final String serialNumber;
  final String model;
  final int amount;
  final String category;
  final String categoryType;
  final String purchaseDate;
  final String manufacturedDate;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'serial_number': serialNumber,
        'model': model,
        'amount': amount,
        'category': category,
        'category_type': categoryType,
        'purchase_date': purchaseDate,
        'manufactured_date': manufacturedDate,
      };
}