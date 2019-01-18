#!/bin/bash
function ergodic(){
for file in ` ls $1`
do
                 if [ -d $1"/"$file ]
                 then
                       ergodic $1"/"$file
                 else
                       local path=$1"/"$file #得到文件的完整的目录
                       local name=$file       #得到文件的名字
                       #做自己的工作.
                    if [ "${file##*.}" = "m" ]; then
                            #echo $1"/"$file >>a.txt
                            # echo -e "* [$(basename $name .md)]($1"/"$file)\n"    >>  $INIT_PATH/index.md
                            mv $1"/"$file  $1"/"$file.md
                    elif [ "${file##*.}" = "h" ]; then
                            #echo $1"/"$file >>a.txt
                            # echo -e "* [$(basename $name .html)]($1"/"$file)\n"  >>  $INIT_PATH/Index.md
                            mv $1"/"$file  $1"/"$file.md
                    elif [ "${file##*.}" = "swift" ]; then
                            mv $1"/"$file  $1"/"$file.md
                   fi
                fi
done
}
INIT_PATH="."
ergodic $INIT_PATH
