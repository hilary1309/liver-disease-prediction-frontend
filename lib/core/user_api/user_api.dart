//import 'package:ldp_prediction/core/model/api_response.dart';
import 'package:ldp_prediction/core/model/api_response.dart';
import 'package:ldp_prediction/core/model/fetch_result.dart';
import 'package:ldp_prediction/core/model/image_response.dart';

abstract class UserApi {
    Future<ImageResponseModel> uploadImage({
    String image
  });

   Future<FetchResultsModel> fetchResults();

   Future<ApiResponse> deleteResult({
    String id
  });
}