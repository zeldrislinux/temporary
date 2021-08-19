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
#lun. 16 août 2021 22:12:04 CEST try fix kernel build error
#mar. 17 août 2021 10:20:29 CEST update kernel
#mar. 17 août 2021 12:19:53 CEST fix clang location
#mar. 17 août 2021 14:51:32 CEST fix vintf issue
#mar. 17 août 2021 15:29:52 CEST try to fix vintf issue
#mar. 17 août 2021 20:10:15 CEST try fix wfd
#mer. 18 août 2021 00:30:10 CEST fix tree issue on lunch
#mer. 18 août 2021 01:01:21 CEST try to fix target product
#mer. 18 août 2021 01:01:55 CEST try to fix target product
#mer. 18 août 2021 01:15:12 CEST fix arch variant
#mer. 18 août 2021 10:24:45 CEST fix parts preferences
#mer. 18 août 2021 12:14:01 CEST fix import issue in parts
#mer. 18 août 2021 14:43:52 CEST fix parts imports
#jeu. 19 août 2021 11:42:11 CEST use pe hals
#jeu. 19 août 2021 13:14:49 CEST fix hals remote
#jeu. 19 août 2021 15:13:49 CEST fix xml parsing
#jeu. 19 août 2021 18:25:52 CEST add refresh rate settings to part
#jeu. 19 août 2021 18:26:35 CEST build gapps
#jeu. 19 août 2021 20:36:10 CEST fix refresh  rate settings
