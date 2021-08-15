if [[ $1 == "" ]]
then
    echo "must mention trigger reason"
else
    echo "#$(date) $1" >> trigger
    git add *
    git commit -m "$1"
    git push
fi

#dim. 15 août 2021 12:13:58 CEST First Project Radiant build for X00QD
