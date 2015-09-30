#!/bin/sh
# Should run in './grammar' directory

# set class path
CLASSPATH=".:../lib/antlr-4.5.1-complete.jar:$CLASSPATH"

# generate parser written in JavaScript
java -jar ../lib/antlr-4.5.1-complete.jar -Dlanguage=JavaScript Java.g4
