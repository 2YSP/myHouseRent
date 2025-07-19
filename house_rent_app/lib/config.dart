
import 'models/general_type.dart';

class Config{
  static const CommonIcon = 'CommonIcon';
  static const BaseUrl = 'http://localhost:8080';

  static List<GeneralType> availableCityList = [
    GeneralType('北京','111'),
    GeneralType('上海','222'),
    GeneralType('广州','333'),
    GeneralType('深圳','444'),
  ];
}