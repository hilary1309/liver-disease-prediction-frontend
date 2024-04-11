//import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ldp_prediction/core/api/api_utils/api_helper.dart';
import 'package:ldp_prediction/core/model/api_response.dart';
import 'package:ldp_prediction/core/model/fetch_result.dart';
//import 'package:ldp_prediction/core/model/api_response.dart';
import 'package:ldp_prediction/core/model/image_response.dart';
import 'package:ldp_prediction/core/user_api/user_api.dart';
import 'package:ldp_prediction/shared/locator.dart';

class UserApiImpl implements UserApi {
  Map<String, String> get header => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };

  Future<Map<String, String>> headerWithToken() async {
    // String accessToken = await getAuthorization();
    Map<String, String> headerToken = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': "",
    };

    return headerToken;
  }

  var server = locator<API>();

  @override
  Future<ImageResponseModel> uploadImage({String? image}) async {
    //Map<String, dynamic> val = {"val": "val"};
    Map<String, dynamic> val = {};
    FormData formData;
    MultipartFile diseasesImage;

    String id = DateTime.now().millisecondsSinceEpoch.toString();

    diseasesImage = await MultipartFile.fromFile(
      image!,
      filename: '$id/$image',
    );
    formData = FormData.fromMap(val..addAll({"file": diseasesImage}));
    //log("$val");   
     var responsebody = await server.post(
       // "http://127.0.0.1:8000/detection", headerWithToken(), val,
       // "http://10.0.2.2:8000/detection", header, "",
        "https://liver-disease-prediction-backend-1.onrender.com/detection", header, "",
        multimediaRequest: formData);
    ImageResponseModel response = imageResponseModelFromJson(responsebody);
    return response;
  }

  @override
  Future<FetchResultsModel> fetchResults() async {
  
     var responsebody = await server.get(
       // "http://127.0.0.1:8000/detection", headerWithToken(), val,
       // "http://10.0.2.2:8000/get_predictions", header
        "https://liver-disease-prediction-backend-1.onrender.com/get_predictions", header
  );
    FetchResultsModel response = fetchResultsModelFromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> deleteResult({String? id}) async {
   
     var responsebody = await server.delete(
       // "http://127.0.0.1:8000/detection", headerWithToken(), val,
       // "http://10.0.2.2:8000/delete_prediction/$id", header, ""
       "https://liver-disease-prediction-backend-1.onrender.com/delete_prediction/$id", header, ""
  );
    ApiResponse response = apiResponseFromJson(responsebody);
    return response;
  }
}
