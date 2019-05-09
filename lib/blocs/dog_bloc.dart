import 'package:bloc_pattern_sample/models/dog_model.dart';
import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class DogBloc {
  final _repository = Repository();
  final _dogFetcher = PublishSubject<Dog>();

  Observable<Dog> get dog => _dogFetcher.stream;

  fetchDog() async {
    Dog itemModel = await _repository.fetchDog();
    _dogFetcher.sink.add(itemModel);
  }

  dispose() {
    _dogFetcher.close();
  }
}

final dogBloc = DogBloc();
