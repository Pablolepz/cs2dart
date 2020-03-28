enum NodeType {
  typeLiteral,
  expressionLiteral,
  statementLiteral,
  namespaceLiteral,
  classLiteral,
  interfaceLiteral,
}

abstract class Node {

  Node(
    this._type,
    this._value,
    this._lChild,
    this._rChild
  );

  final NodeType _type;
  final String _value;
  final Node _lChild;
  final Node _rChild;


  NodeType get type {
    return _type;
  }

  String get value {
    return _value;
  }

  Node get lChild {
    return _lChild;
  }
  Node get rChild {
    return _rChild;
  }
}
