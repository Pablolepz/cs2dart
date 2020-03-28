// stmt.dart obj class file
enum stateKind {
  labeled,
  declaration,
  embedded
}

abstract class Statement {

  Statement(this._value, this._kind);

  final String _value;
  final stateKind _kind;
}
