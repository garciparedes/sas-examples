{"version":2,"type":"import","id":"f0ae20b8-5adb-4aa9-8ec0-f6b87da0e803","name":"Import Data 1","label":"Import Data 1","description":"","created":1505390074315,"modified":1505390119608,"notes":"","parameters":{"server":"","target":"com.sas.ep.sascoder.execution.producers.VPP","action":"runSASCode","priority":"Reserved","code":"/* Generated Code (IMPORT) */\r\n/* Source File: olympic-2016-v2.txt */\r\n/* Source Path: /folders/myshortcuts/sas/sas-examples/data/olympic-2016-v2 */\r\n/* Code generated on: 9/14/17, 1:55 PM */\r\n\r\n%web_drop_table(WORK.Olympicv2);\r\n\r\n\r\nFILENAME REFFILE '/folders/myshortcuts/sas/sas-examples/data/olympic-2016-v2/olympic-2016-v2.txt';\r\n\r\nPROC IMPORT DATAFILE=REFFILE\r\n\tDBMS=DLM\r\n\tOUT=WORK.Olympicv2;\r\n\tDELIMITER=\",\";\r\n\tGETNAMES=YES;\r\nRUN;\r\n\r\nPROC CONTENTS DATA=WORK.Olympicv2; RUN;\r\n\r\n\r\n%web_open_table(WORK.Olympicv2);","resource":false,"outputType":"TABLE","outputName":"Olympicv2","outputLocation":"WORK","fileName":"olympic-2016-v2.txt","filePath":"/folders/myshortcuts/sas/sas-examples/data/olympic-2016-v2","fileType":"","fileSheet":"","fileTable":"","delimiterOption":",","dataRowOption":-1,"guessingRowsOption":-1,"getnamesOption":true,"quoteDelimiterOption":true,"eolDelimiterOption":""},"properties":{"left":"20","top":"20","width":"100","height":"60","region":"output","fillcolor":"#E0E6F1","linecolor":"#6882a3","tooltip":"","portsonly":false,"key":"control","visible":true}}