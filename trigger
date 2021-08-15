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
#dim. 15 août 2021 12:21:50 CEST upload build prop (canceled previous build)
#dim. 15 août 2021 22:34:48 CEST build vanilla official
#dim. 15 août 2021 22:35:44 CEST build vanilla official
