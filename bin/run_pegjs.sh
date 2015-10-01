#!/bin/sh
# Should run in './grammar/pegjs' directory

HEADER="(function(f){if(typeof exports===\"object\"&&typeof module!==\"undefined\"){module.exports=f()}else if(typeof define===\"function\"&&define.amd){define([],f)}else{var g;if(typeof window!==\"undefined\"){g=window}else if(typeof global!==\"undefined\"){g=global}else if(typeof self!==\"undefined\"){g=self}else{g=this}g.JavaParser = f()}})(function(){var define,module,exports;module={exports:(exports={})};"
FOOTER="return module.exports;});"

# generate parser
pegjs Java.1.8.peg parser.js

# Use the following for parsing method body
# pegjs --allowed-start-rules BlockStatements Java.1.8.peg parser.js
# or
# pegjs --allowed-start-rules BlockStatements,CompilationUnit Java.1.8.peg parser.js
# and pass option, {startRule : 'BlockStatements'}.

echo $HEADER >| Java.1.8.js
cat parser.js >> Java.1.8.js
echo $FOOTER >> Java.1.8.js
