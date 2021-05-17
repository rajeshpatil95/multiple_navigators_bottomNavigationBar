import 'package:multiple_bottomNavigationBar/models/fiji_model.dart';
import 'package:multiple_bottomNavigationBar/webservice/base_repository.dart';
import 'package:multiple_bottomNavigationBar/webservice/fiji.dart/fiji_request.dart';

abstract class FijiRepository extends BaseRepository {
  Future<FijiModel> getFiji(String transactionId);
  Future<FijiModel> postFiji(FijiModel fijiModel);
}

class FijiRepositoryImpl extends FijiRepository {
  FijiRequest _request = FijiRequest();

  Future<FijiModel> getFiji(
      String transactionId) async {
    FijiModel response = await _request.getFiji(transactionId);
    if (response == null) {
      return null;
    }

    return response;
  }

  Future<FijiModel> postFiji(FijiModel fijiModel) async {
    FijiModel response = await _request.postFiji(fijiModel);
    if (response == null) {
      return null;
    }

    return response;
  }
}
