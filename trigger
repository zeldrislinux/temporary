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
