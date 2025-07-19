import 'package:shared_preferences/shared_preferences.dart';

enum StoreKeys { TOKEN,CITY }

class Store {

  // static StoreKeys _storeKeys;
  final SharedPreferences _store;

  static Future<Store> getInstance() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return Store._internal(sharedPreferences);
  }

  Store._internal(this._store);

  getString(StoreKeys key) async{
    return _store.getString(key.toString());
  }

  setString(StoreKeys key, String value) async {
    _store.setString(key.toString(), value);
  }
}
