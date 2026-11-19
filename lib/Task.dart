class Task {
  bool _checked = false;
  String _description;
  DateTime? _deadline;

  bool get checked {
    return _checked;
  }

  String get description {
    return _description;
  }

  DateTime? get deadline {
    return _deadline;
  }

  Task(this._description);

  void change() {
    _checked = !_checked;
  }

}