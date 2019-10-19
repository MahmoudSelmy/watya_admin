import 'package:get_it/get_it.dart';
import 'package:watya_app/core/services/firestore_api.dart';

import 'core/viewmodels/products_curd_model.dart';


GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => FireStoreAPI());
  locator.registerLazySingleton(() => ProductsCRUDModel()) ;
}