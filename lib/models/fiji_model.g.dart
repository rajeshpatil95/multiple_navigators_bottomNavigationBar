// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiji_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FijiModel _$FijiModelFromJson(Map<String, dynamic> json) {
  return FijiModel(
    type: json['type'] as String,
    capital: json['capital'] as String,
    country: json['country'] as String,
    currency: json['currency'] as String,
    name: json['name'] as String,
    population: json['population'] as String,
  );
}

Map<String, dynamic> _$FijiModelToJson(FijiModel instance) => <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'country': instance.country,
      'capital': instance.capital,
      'currency': instance.currency,
      'population': instance.population,
    };
