class GraphData implements Comparable<GraphData>{
  String label;
  int value;
  GraphData({this.value,this.label});

  @override
  int compareTo(GraphData other) {
    
    return this.value.compareTo(other.value);
  }

}

List<GraphData> dayDate =[
  GraphData(label: '12am', value: 100),
  GraphData(label: '3am', value: 120),
  GraphData(label: '6am', value: 40),
  GraphData(label: '9am', value: 70),
  GraphData(label: '12pm', value: 150),
  GraphData(label: '3pm', value: 90),
  GraphData(label: '6pm', value: 20),
  GraphData(label: '9pm', value: 60),



];