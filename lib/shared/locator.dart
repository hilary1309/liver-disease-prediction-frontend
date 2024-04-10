// import 'package:get_it/get_it.dart';

import 'package:get_it/get_it.dart';
import 'package:ldp_prediction/core/api/api_utils/api_helper.dart';
import 'package:ldp_prediction/core/user_api/user_api.dart';

import '../core/user_api/user_api_impl.dart';
 

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<API>(() => API());
  locator.registerLazySingleton<UserApi>(() => UserApiImpl());


  // // API
  // // locator.registerLazySingleton<AuthenticationApi>(() => AuthenticationApiImpl());

  // // Infrastructure
  // locator.registerLazySingleton<UserInfoCache>(() => UserInfoCache());
}
