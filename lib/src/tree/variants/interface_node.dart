import 'dart:io';

import '../node.dart';

class InterfaceNode implements Node {

  InterfaceNode(
    this._value,
    this._lChild,
    this._rChild
  ): super();

  static final NodeType _type = NodeType.interfaceLiteral;
  final String _value;
  final Node _lChild;
  final Node _rChild;

  @override
  NodeType get type {
    assert(_type == NodeType.interfaceLiteral);
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
