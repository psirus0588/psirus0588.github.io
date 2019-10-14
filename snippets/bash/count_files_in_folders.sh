for i in */ .*/ ; do 
    echo -n $i": " ; 
    (find "$i" -type f | wc -l) ; 
done


#OR
#find . -type d -print0 | while read -d '' -r dir; do
#    files=("$dir"/*)
#    printf "%5d files in directory %s\n" "${#files[@]}" "$dir"
#done
#
