# XML

### view xml document structure in command line

	xmlstarlet el file.xml | sort  | uniq > file.xml.log
	xmlstarlet el -a file.xml | sort  | uniq >> file.xml.log
	sort file.xml.log | uniq -c
