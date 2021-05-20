import 'package:multiple_bottomNavigationBar/models/fiji_model.dart';
import 'package:multiple_bottomNavigationBar/webservice/base_repository.dart';
import 'package:multiple_bottomNavigationBar/webservice/fiji.dart/fiji_request.dart';

abstract class FijiRepository extends BaseRepository {
  Future<FijiModel> getFiji();
  Future<FijiModel> postFiji(FijiModel fijiModel);
}

class FijiRepositoryImpl extends FijiRepository {
  FijiRequest _request = FijiRequest();

  Future<FijiModel> getFiji() async {
    FijiModel response = await _request.getFiji();
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
