headerdoc2html -o ./help/ ./TerminalColorLog_Objc/*.h -X
headerdoc2html -o ./help/ ./TerminalColorLog_Objc/*.h
gatherheaderdoc ./help/VMLogUtility_h/

mv -f ./help/VMLogUtility_h/*.html ./help
rm -rf ./help/VMLogUtility_h/

