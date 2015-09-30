var antlr4 = require('antlr4/index');
var JavaLexer = require('./grammar/JavaLexer');
var JavaParser = require('./grammar/JavaParser');

function jp(input) {
    var chars = new antlr4.InputStream(input);
    var lexer = new JavaLexer.JavaLexer(chars);
    var tokens = new antlr4.CommonTokenStream(lexer);
    var parser = new JavaParser.JavaParser(tokens);
    parser.buildParseTrees = true;
    var tree = parser.blockStatements();
    return tree;
}

exports.jp = jp;
