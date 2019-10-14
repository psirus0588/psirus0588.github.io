# bash

### Bash tab autocomplition - Advanced mode
* Ubuntu
        
        sudo apt install bash-completion
    
* MacOS
    
        brew install bash-completion@2
    
* Source
    
        https://github.com/scop/bash-completion
    

### Find and delete files created more then 30 days
    find /path/to/dir -mindepth 1 -mtime +30
    

### Bash script for generate SSH RSA keys
    #!/bin/bash

    if [[ $1 && $2 ]]
    then
        ssh-keygen -t rsa -f ./$1 -b 2048  -C "$2"
    else
        echo 'Usage: ./keygen.sh filename-for-key comment-for-key';
    fi


### Get count unique lines of output
    printf ' a \n b \n b ' | sort | uniq -c


### Html to pdf download and open
    # sudo apt-get install wkhtmltopdf chromium
    wkhtmltopdf https://wkhtmltopdf.org/ output.pdf && chromium output.pdf

#### Links
[write iso linux to usb](write_iso_linux_to_usb.md)
