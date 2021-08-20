import 'package:flutter_mvvm_boilerplate/app/navigation_service.dart';
import 'package:flutter_mvvm_boilerplate/data/repository/user_repository.dart';
import 'package:flutter_mvvm_boilerplate/data/service/rest_api.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
void setupLocator() {
  locator.registerSingleton<NavigationService>(NavigationServiceImplementation());
  locator.registerSingleton<RestApi>(RestApiImplementation());
  locator.registerSingleton<UserRepository>(UserRepositoryImplementation());
}