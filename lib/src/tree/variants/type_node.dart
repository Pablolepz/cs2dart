import 'dart:io';

import '../node.dart';

class TypeNode implements Node {

  TypeNode(
    this._value,
    this._lChild,
    this._rChild
  ): super();

  static final NodeType _type = NodeType.typeLiteral;
  final String _value;
  final Node _lChild;
  final Node _rChild;

  @override
  NodeType get type {
    assert(_type == NodeType.typeLiteral);
    return _type;
  }

  @override
  String get value {
    return _value;
  }

  @override
  Node get lChild {
    return _lChild;
  }
  Node get rChild {
    return _rChild;
  }
}
