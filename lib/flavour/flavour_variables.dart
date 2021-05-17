import 'package:flutter_flavor/flutter_flavor.dart';

class FlavourVariable {
  static const String flavour = "flavour";
  static const String baseUrl = "baseUrl";
  static const String appName = "appName";
  static const String iconUrl = "iconUrl";
}

class ProductFlavour {
  static const String Dev = "Dev";
  static const String Prod = "Prod";
}

/*===============================
          DEVELOPMENT
  ==============================*/

class Dev {
  static Map<String, String> _strings = {
    FlavourVariable.flavour: "Dev",
    FlavourVariable.baseUrl: "demo.moneytap.com",
    FlavourVariable.appName: "ChillPay"
  };

  static Map<String, String> _assets = {
    FlavourVariable.iconUrl: "https://dummyimage.com/100x50/000/fff&text=Dev",
  };

  static Map<String, String> flavourVariables = Map()
    ..addAll(_strings)
    ..addAll(_assets);
}

/*===============================
          PRODUCTION
  ==============================*/

class Prod {
  static Map<String, String> _strings = {
    FlavourVariable.flavour: "Prod",
    FlavourVariable.baseUrl: "app.moneytap.com",
    FlavourVariable.appName: "ChillPay"
  };

  static Map<String, String> _assets = {
    FlavourVariable.iconUrl: "https://dummyimage.com/100x50/000/fff&text=Prod"
  };

  static Map<String, String> flavourVariables = Map()
    ..addAll(_strings)
    ..addAll(_assets);
}

isDev() =>
    FlavorConfig.instance.variables[FlavourVariable.flavour] ==
    ProductFlavour.Dev;

isProd() =>
    FlavorConfig.instance.variables[FlavourVariable.flavour] ==
    ProductFlavour.Prod;

getFlavourVariable(String flavourVariable) =>
    FlavorConfig.instance.variables[flavourVariable];
