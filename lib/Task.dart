class Task {
  bool _checked = false;
  String _description;

  bool get checked {
    return _checked;
  }

  String get description {
    return _description;
  }

  Task(this._description);

  void change() {
    _checked = !_checked;
  }

}