import 'dart:async';

import 'package:bloc_pattern_sample/models/dog_model.dart';

import 'dog_api_provider.dart';

class Repository {
  final dogApiProvider = DogApiProvider();

  Future<Dog> fetchDog() => dogApiProvider.fetchDog();
}
