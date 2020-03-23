import 'package:cs2dart/parser.dart';
import 'package:cs2dart/tokens.dart';
import 'package:cs2dart/expr.dart';

class Parser {

    Parser(this._tokens);

    final List<Token> _tokens;
    int _position;

    Token peek(int offset) {
      var index = _position + offset;
      if (index >= _tokens.length) {
        return _tokens[_tokens.length - 1];
      }
      return _tokens[index];
    }

    void checkTokenIs(int position, Token input){
      //equals written, need to test, unsure why error
      if(!_tokens[_position].equals(input))
      {
        throw ParseException('Expected: ' + input.toString() + 'Received: ' + _tokens[position].toString());
      }
    }
    
    // ParseResult parseAdditiveExpHelper(final int startPos){
    //   final List<Exp> resultList  = new List<Exp>;
    //   int curPos = startPos;
    //   while(curPos < _tokens.length){
    //     try{
    //       checkTokenIs(curPos, new PlusToken)
    //     }
    //   }
    // }

    ParseResult<Exp> parseAdditiveExp(final int startPos) {
      final ParseResult<Exp> starting = parsePrimary(startPos);
      return null;
    }
    ParseResult parsePrimary(int startPos){
      return null;
    }
  }
