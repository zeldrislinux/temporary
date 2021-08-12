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
#dim. 08 août 2021 14:47:43 CEST test fix bootloops
#lun. 09 août 2021 01:27:01 CEST try to fix asus partitions mounting
#lun. 09 août 2021 10:02:15 CEST try to fix bootloops caused by asus partitions (permissive)
#mar. 10 août 2021 09:56:05 CEST test asus specific partition changes on enforcing
#mar. 10 août 2021 13:35:25 CEST update kernel, update audio conf
#jeu. 12 août 2021 18:31:29 CEST test stock audio conf
