import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:multiple_bottomNavigationBar/storage/shared_preferences.dart';

class DI {
  DI();

  factory DI.initializeDependencies() {
    addDependency<Preferences>(PreferencesImpl(), true);
    addDependency<AddressFormRepository>(AddressFormRepositoryImpl(), true);
    addDependency<ConfirmAddressRepository>(
        ConfirmAddressRepositoryImpl(), true);
    addDependency<ChangeTenureRepository>(ChangeTenureRepositoryImpl(), true);
    addDependency<TransactionDetailRepository>(
        TransactionDetailRepositoryImpl(), true);
    addDependency<CardDetailsRepository>(CardDetailsRepositoryImpl(), true);
    addDependency<HomePageRepository>(HomePageRepositoryImpl(), true);
    addDependency<CardActivationRepository>(
        CardActivationRepositoryImpl(), true);
    addDependency<CardBlockingRepository>(CardBlockingRepositoryImpl(), true);
    addDependency<OtpRepository>(OtpRepositoryImpl(), true);
    addDependency<InstantKycRepository>(InstantKycRepositoryImpl(), true);
    addDependency<SalaryProofRepository>(SalaryProofRepositoryImpl(), true);
    addDependency<PanFormRepository>(PanFormRepositoryImpl(), true);
    addDependency<CurrentAddressRepository>(CurrentAddressRepositoryImpl(), true);
    return DI();
  }

  static addDependency<T>(T object, bool isSingleton) {
    Injector().map<T>((injector) => object, isSingleton: isSingleton);
  }

  static addStringDependency(String value, String key) {
    Injector().map<String>((injector) => value, key: key);
  }

  static addDependencyForKey<T>(T object, bool isSingleton, String key) {
    Injector().map<T>((injector) => object, isSingleton: isSingleton, key: key);
  }

  static T inject<T>() {
    return Injector().get<T>();
  }

  static T injectWithKey<T>(String key) {
    return Injector().get<T>(key: key);
  }

  static T injectWithAdditionalParams<T>(
      String key, Map<String, dynamic> additionalParameters) {
    return Injector()
        .get<T>(key: key, additionalParameters: additionalParameters);
  }
}

class DIKey {
  // DI Keys go here
}
