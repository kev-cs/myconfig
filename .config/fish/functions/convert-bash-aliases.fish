function convert-bash-aliases --description 'bash aliases to abbr'
    for a in (cat $argv[1]  | grep "^alias")
        set aname (echo $a | sed 's/alias \(.*\)=".*/\1/' | sed 's/\'//g')
        set command (echo $a | sed 's/alias.*="\(.*\)"/\1/')

        abbr -a $aname $command
    end
end
