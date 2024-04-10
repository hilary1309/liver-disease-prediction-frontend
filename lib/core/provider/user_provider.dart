import 'dart:developer';

import 'package:ldp_prediction/constant/view_state.dart';
import 'package:ldp_prediction/core/api/api_utils/network_exception.dart';
import 'package:ldp_prediction/core/model/fetch_result.dart';
import 'package:ldp_prediction/core/model/image_response.dart';
import 'package:ldp_prediction/core/user_api/user_api.dart';
import 'package:ldp_prediction/shared/base_view_model.dart';
import 'package:ldp_prediction/shared/locator.dart';

class UserProvider extends BaseNotifier {
  var userApi = locator<UserApi>();
  var imageResponse = ImageResponseModel(); // added
  int selectedIndex = 0;
  List<PredictionElement> resultList = [];
  //List<FetchResultsModel> resultList = [];

  updateSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  ViewState uploadImageState = ViewState.Idle;
  
  Future<bool> uplaodImage(String image) async {
 

    setCustomState(ViewState state) {
      uploadImageState = state;
      
      notifyListeners();
    }
    

    setCustomState(ViewState.Busy);

    try {
      // uncomment this to load make api request
       //userApi.uploadImage(image: image);
       imageResponse  = await userApi.uploadImage(image: image); //added
       log("imageResponse");

      // this is just to mimic loading
      //await Future.delayed(const Duration(seconds: 5)); // commented out
      setCustomState(ViewState.Success);

      return true;
    } on NetworkException {
      log("CHECK INTERNET CONNECTION");
    } catch (e) {
      print("$e");
    }
    setCustomState(ViewState.Error);
    return false;
  }





  ViewState fetchResultState = ViewState.Idle;
  
  Future<bool> fetchResult() async {
 

    setCustomState(ViewState state) {
      fetchResultState = state;
      
      notifyListeners();
    }
    

    setCustomState(ViewState.Busy);

    try {
      // uncomment this to load make api request
       //userApi.uploadImage(image: image);
      var response = await userApi.fetchResults();//added
      if (response.predictions?.isNotEmpty??false){
        resultList = response.predictions??[];
        notifyListeners();
      }
      
       log("imageResponse");

      // this is just to mimic loading
      //await Future.delayed(const Duration(seconds: 5)); // commented out
      setCustomState(ViewState.Success);

      return true;
    } on NetworkException {
      log("CHECK INTERNET CONNECTION");
    } catch (e) {
      print("$e");
    }
    setCustomState(ViewState.Error);
    return false;
  }





   ViewState deleteResultState = ViewState.Idle;
  
  Future<bool> deleteResult( {String? id}) async {
 

    setCustomState(ViewState state) {
      deleteResultState = state;
      
      notifyListeners();
    }
    

    setCustomState(ViewState.Busy);

    try {
      // uncomment this to load make api request
       //userApi.uploadImage(image: image);
       await userApi.deleteResult(id:id!);//added
     
      // this is just to mimic loading
      //await Future.delayed(const Duration(seconds: 5)); // commented out
      setCustomState(ViewState.Success);

      return true;
    } on NetworkException {
      log("CHECK INTERNET CONNECTION");
    } catch (e) {
      print("$e");
    }
    setCustomState(ViewState.Error);
    return false;
  }
}



