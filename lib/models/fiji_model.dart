import 'package:json_annotation/json_annotation.dart';
part 'fiji_model.g.dart';

@JsonSerializable()
class FijiModel {
  String type;
  String name;
  String country;
  String capital;
  String currency;
  String population;

  FijiModel({this.type, this.capital, this.country, this.currency, this.name, this.population});

    factory FijiModel.fromJson(Map<String, dynamic> json) =>
      _$FijiModelFromJson(json);
  Map<String, dynamic> toJson() => _$FijiModelToJson(this);
}