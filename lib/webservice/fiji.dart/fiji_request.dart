import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:multiple_bottomNavigationBar/generated/l10n.dart';
import 'package:multiple_bottomNavigationBar/models/fiji_model.dart';
import 'package:multiple_bottomNavigationBar/resources/strings/app_strings.dart';
import 'package:multiple_bottomNavigationBar/webservice/base_request.dart';
import '../../webservice/extensions.dart';

class FijiRequest extends BaseRequest {
  Future<FijiModel> getFiji(String transactionId) async {
    var response = await this.constructAndExecuteRequest(
        method: HttpMethod.get,
        authenticated: true,
        endpoint: Endpoints.getLoanPlans + transactionId);

    if (response.isSuccessful()) {
      return json
          .decode(utf8.decode(response.bodyBytes))
          .map<FijiModel>(
              (dynamic loanPlan) => FijiModel.fromJson(loanPlan))
          .toList();
    } else {
      throw Exception(response.body);
    }
  }

  Future<FijiModel> postFiji(FijiModel fijiModel) async {
    http.Response response = await constructAndExecuteRequest(
        method: HttpMethod.post,
        endpoint: Endpoints.evaluateLoan,
        authenticated: true,
        body: jsonEncode(fijiModel.toJson()));

    if (response.isSuccessful()) {
      return FijiModel.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      // TODO parse error
      throw Exception(Strings.current.genericWebRequestError);
    }
  }
}
