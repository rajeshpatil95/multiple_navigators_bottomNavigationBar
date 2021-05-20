import 'dart:convert';
import 'dart:core';
import 'package:multiple_bottomNavigationBar/generated/l10n.dart';
import 'package:multiple_bottomNavigationBar/models/fiji_model.dart';
import 'package:multiple_bottomNavigationBar/utils/mock_server.dart';
import 'package:multiple_bottomNavigationBar/utils/test_response.dart';
import 'package:multiple_bottomNavigationBar/webservice/base_request.dart';
import '../../webservice/extensions.dart';

class FijiRequest extends BaseRequest {
  Future<FijiModel> getFiji() async {
     final response = await mockApiCall(
        body: TestResponse.testFiji,
        method: HttpMethod.get,
        callBackDelay: CallBackDelay.CALLBACK_DELAY_SHORT);
    if (response.isSuccessful()) {
      return FijiModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(Strings.current.genericWebRequestError);
    }
  }

  Future<FijiModel> postFiji(FijiModel fijiModel) async {
     final response = await mockApiCall(
        body: fijiModel.toJson(),
        method: HttpMethod.get,
        callBackDelay: CallBackDelay.CALLBACK_DELAY_SHORT);
    if (response.isSuccessful()) {
      return FijiModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(Strings.current.genericWebRequestError);
    }
  }
}
