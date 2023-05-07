import 'package:counter/interface.dart';

class HomePresenter {

  final Interface _interface;
  HomePresenter(this._interface);

   changeNumber(int number) {
     _interface.updateNumber(number);
  }
  
}