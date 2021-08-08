if [[ $1 == "" ]]
then
    echo "must mention trigger reason"
else
    echo "#$(date) $1" >> trigger
    git add *
    git commit -m "$1"
    git push
fi

#dim. 01 août 2021 19:07:49 CEST upload trigger script [skip ci]
#mer. 04 août 2021 19:33:11 CEST test pixel powerhal
#jeu. 05 août 2021 02:45:17 CEST fix build error
#sam. 07 août 2021 22:30:26 CEST update vibration config, test fix asus specific partitons logspam and increase mic sensivity
#dim. 08 août 2021 07:02:07 CEST fix xml parsing error
