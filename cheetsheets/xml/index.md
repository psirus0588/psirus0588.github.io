## XML


	xmlstarlet el file.xml | sort  | uniq > file.xml.log
	xmlstarlet el -a file.xml | sort  | uniq >> file.xml.log
	sort file.xml.log | uniq -c

	xml sel -T -t -m //goods -v "concat(val1,';',val2)" -n file.xml > output.csv
