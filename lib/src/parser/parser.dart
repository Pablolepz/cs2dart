import 'package:cs2dart/parser.dart';
import 'package:cs2dart/tokens.dart';
import 'package:cs2dart/expressions.dart';
import 'package:cs2dart/statement.dart';
import 'package:cs2dart/tree.dart';

import 'dart:io';
import '../../parser.dart';
import '../tokens/variants/integer_literal_token.dart';
import '../tokens/variants/operator_or_punctuator_token.dart';

class Parser {
  Parser(this._tokens);
  final List<Token> _tokens;
  int _position;

  void _next() {
    _position++;
  }
  // int _position = 0;

  // Token peek(int offset) {
  //   var index = _position + offset;
  //   if (index >= _tokens.length) {
  //     return _tokens[_tokens.length - 1];
  //   }
  //   return _tokens[index];
  // }

  void checkTokenIs(int position, Token input){
    // equals written, need to test, unsure why error
    if(!_tokens[position].equals(input)) {
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

  ParseResult<Exp> _parseType(final int startPos) {

  }

  ParseResult<Exp> parseExp(final int startPos) {
    // if (_tokens[startPos] is IdentifierToken) {

    // } else if (_tokens[startPos] is KeywordToken) {

    // } else if (_tokens[startPos] is RealLiteralToken) {

    // } else if (_tokens[startPos] is IntegerLiteralToken) {

    // } else if (_tokens[startPos] is InterpolatedStringLiteralToken) {

    // } else if (_tokens[startPos] is StringLiteralToken) {

    // } else if (_tokens[startPos] is CharacterLiteralToken) {

    // } else if (_tokens[startPos] is OperatorOrPunctuatorToken) {

    // }
    var result = _parseType(startPos);

    if (result != null) {
      return result;
    }

    else {
      throw ParseException('Unrecognized token in parser.');
    }
  }

  // Top level expressions file entrance
  Exp parseToplevelExp() {
    try {
      final result = parseExp(0);

      if (result.nextPos == _tokens.length) {
        return result.result;
      } else {
          throw ParseException('Extra tokens at end');
      }
    } on ParseException catch (e) {
      stdout.writeln('$e');
      exit(1);
    }
  }


  //Statements


  StatementNode parseStatementStart(int startPos) {
    var currPos = startPos;
    //labeled_statement
    if (_tokens[currPos].type is IdentifierToken)
    {
      Node rightC = parseStatementLabeled(currPos++);
      return StatementNode(_tokens[currPos].value, null, rightC);
    }

    //declaration_statement
    // if (_tokens[currPos].type is )
    // Node rightC = parseStatementDeclaration(currPos++);)
    //
    // return StatementNode(_tokens[currPos].value, null, rightC);

    //empty_statement
    if (_tokens[currPos].value == ';')
    {
      return StatementNode(_tokens[currPos].value, null, null);
    }

    //embedded_statement
    if (_tokens[currPos].type == KeywordToken)
    {
      Node rightC = parseStatementEmbedded(currPos);
      return StatementNode(_tokens[currPos].value, null, rightC);
    }
  }

  StatementNode parseStatementLabeled(int startPos) {
    var currPos = startPos;
    if (_tokens[currPos].value == ':')
    {
      return StatementNode(_tokens[currPos].value, null, parseStatementStart(currPos++));
    }
  }

  StatementNode parseStatementDeclaration(int startPos) {
    var currPos = startPos;
    // variable parsing required
  }

  StatementNode parseStatementEmbedded(int startPos) {
    var currPos = startPos;
    

  }
}
