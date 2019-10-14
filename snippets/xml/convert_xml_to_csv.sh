#!/bin/bash 
#convert_xml_to_csv.sh input_file.xml output_file.csv
INPUTH_XML=$1
OUTPUT_CSV=$2

xmlstarlet el $INPUTH_XML | sort  | uniq > $INPUTH_XML.log
xmlstarlet el -a $INPUTH_XML | sort  | uniq >> $INPUTH_XML.log
mapfile -t XML_PATH < <( sort $INPUTH_XML.log | uniq -c )


##TODO GENERATE COMMAND EXAMPLE
##xmlstarlet sel -T -t -m //goods -v "concat(val1,';',val2)" -n $INPUTH_XML > $OUTPUT_CSV


##CHECK WORK
#printf "Line 1\nLine 2\nLine 3\n" | ( mapfile -t; echo "${MAPFILE[@]}" )
#FISRT_VAR=GET FISRT LINE
#VAR=concat(
#VAR+=printf "%s,';'," "${MAPFILE[@]}"
#VAR+=)
#xmlstarlet sel -T -t -m "//$FISRT_VAR" -v "$VAR" -n $INPUTH_XML > $OUTPUT_CSV
