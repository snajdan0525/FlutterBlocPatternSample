import 'dart:async';
import 'package:bloc_pattern_sample/models/dog_model.dart';
import 'package:http/http.dart' show Client;

class DogApiProvider {
  Client client = Client();

  Future<Dog> fetchDog() async {
    print("Starting fetch dog..");
    final response = await client.get("https://dog.ceo/api/breeds/image/random");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return dogFromJson(response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load dog');
    }
  }
}
