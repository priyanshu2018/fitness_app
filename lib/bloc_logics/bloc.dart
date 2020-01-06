import 'dart:async';

class MyHomePageBloc{
  DateTime selected_date = DateTime.now();
  StreamController<DateTime> _dataStreamController = StreamController<DateTime>();

  Stream<DateTime> get dateStream {
    return _dataStreamController.stream;
  }

  void addDate(){
    selected_date = selected_date.add(Duration(days: 1));
    _dataStreamController.sink.add(selected_date);
  }
  void subtractDate(){
    selected_date = selected_date.subtract(Duration(days: 1));
    _dataStreamController.sink.add(selected_date);

  }


  dispose(){
   _dataStreamController.close();
 }
}