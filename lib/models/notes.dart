/*
  steps
  Creating a model class 
  creating a varable requirwd to db 
  creating getter and setter
  converting the Note object to Map Object 
  because the SQFlite accepet Map And return Map
  
 */

class Notes {
  late int _id;
  late String _title;
  String? _description;
  late String _date;
  late int _priorrity;

  Notes(this._title, this._date, this._priorrity, [this._description]);

  Notes.withId(this._id, this._title, this._date, this._priorrity,
      [this._description]);

  int get id => _id;

  String get title => _title;

  String? get description => _description;

  String get date => _date;

  int get priority => _priorrity;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      _priorrity = newPriority;
    }
  }

  set date(String newData) {
    _date = newData;
  }

  // Converting a Note object into Map object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['descrioption'] = _description;
    map['priority'] = _priorrity;
    map['date'] = _date;

    return map;
  }

  // Exteact a Note object from a Map object
  Notes.formMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _title = map['title'];
    _description = map['descrioption'];
    _priorrity = map['priority'];
    _date = map['date'];
  }
}
