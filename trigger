if [[ $1 == "" ]]
then
    echo "must mention trigger reason"
else
    echo "#$(date) $1" >> trigger
    git add *
    git commit -m "$1"
    git push
fi
#lun. 16 août 2021 14:03:52 CEST initial radiant build for vayu
#lun. 16 août 2021 16:45:31 CEST fix sync
#lun. 16 août 2021 18:15:13 CEST fix kernel build
#lun. 16 août 2021 20:40:10 CEST try building kernel with proton clang
