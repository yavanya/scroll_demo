import 'package:scroll_demo/data/localdata/localdata.dart';
import 'package:scroll_demo/models/options.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FutureViewModel {
  LocalData data = LocalData(jsonPath: 'assets/data/strings.json');

  Options _options;
  Options get options => _options;
  void changeOptions(int i) {
    _options.changeActiveOption(i);
    notifyListeners();
  }

  void resetOptions() {
    _options.resetOptions();
    notifyListeners();
  }

  @override
  Future futureToRun() async {
    _options = await data.getDataFromJson();
  }
}
