#!/bin/bash
function ergodic(){
for file in ` ls $1`
do
                 if [ -d $1"/"$file ]
                 then
                       sudo cp ~/fileToMd.sh $1"/"$file
                       sudo cp ~/genIndex.sh $1"/"$file
                       bash fileToMd.sh
                       bash genIndex.sh
                       sudo rm -rf fileToMd.sh
                       sudo rm -rf genIndex.sh
                       ergodic $1"/"$file
                 else
                       local path=$1"/"$file #得到文件的完整的目录
                       local name=$file       #得到文件的名字
                       #做自己的工作.
                    if [ "${file##*.}" = "md" ]; then
                            #echo $1"/"$file >>a.txt
                            echo -e "* [$(basename $name .md)]($1"/"$file)\n"    >>  $INIT_PATH/index.md
                    elif [ "${file##*.}" = "html" ]; then
                            #echo $1"/"$file >>a.txt
                            echo -e "* [$(basename $name .html)]($1"/"$file)\n"  >>  $INIT_PATH/Index.md
find . -type f -name "*.html" | xargs perl -pi -e 's/width:70%/width:80%/g'
find . -type f -name "*.html" | xargs perl -pi -e 's/width:30px/10px/g'
find . -type f -name "*.html" | xargs perl -pi -e 's/width:25px/10px/g'
find -name 'name' | xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/style\/github-bf51422f4bb36427d391e4b75a1daa083c2d840e.css/toc\/style\/github-bf51422f4bb36427d391e4b75a1daa083c2d840e.css/g'
find -name 'name' | xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/style\/makedownpad.css/toc\/style\/makedownpad.css/g'
find -name 'name' | xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/style\/GitHub2.css/toc\/style\/GitHub2.css/g'
find -name 'name' | xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/style\/GitHub.css/toc\/style\/GitHub.css/g'
find -name 'name' | xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/style\/github2-d731afd4f624c99a4b19ad69f3083cd6d02b81d5.css/toc\/style\/github2-d731afd4f624c99a4b19ad69f3083cd6d02b81d5.css/g'
find -name 'name' | xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/style\/Clearness Dark.css/toc\/style\/Clearness Dark.css/g'
find -name 'name' | xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/style\/Clearness.css/toc\/style\/Clearness.css/g'
find -name 'name' | xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/css\/zTreeStyle\/zTreeStyle.css/toc\/css\/zTreeStyle\/zTreeStyle.css/g'
find -name 'name' | xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/js\/ztree_toc.js/toc\/js\/ztree_toc.js/g'
find -name 'name' | xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/js\/ztree_toc.min.js/toc\/js\/ztree_toc.min.js/g'
find -name 'name' | xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/js\/jquery-1.4.4.min.js/toc\/js\/jquery-1.4.4.min.js/g'
find -name 'name' | xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/js\/jquery.ztree.all-3.5.min.js/toc\/js\/jquery.ztree.all-3.5.min.js/g'
                   fi
                fi
done
}
INIT_PATH="."
# sudo rm -rf $INIT_PATH/preview/*
# sudo rm -rf $INIT_PATH/preview
sudo rm -rf $INIT_PATH/index.md
sudo rm Index.html
sudo rm preview/Index.html
sudo tocmd -d .
sudo chown qingkong preview
sudo chmod 777 preview
# echo -e '## ios开发技术\n'  >   $INIT_PATH/index.md ;
# echo -e '## ios开发技术\n'  >   $INIT_PATH/Index.md ;
ergodic $INIT_PATH
# sudo tocmd -f $INIT_PATH/Index.md
cp -r $INIT_PATH/images/ ./preview/
cp -r /var/lib/gems/2.5.0/gems/tocmd-0.4.3/vendor/toc/ $INIT_PATH/preview/
cd $INIT_PATH/
sudo mv preview/Index.html $INIT_PATH/
find . -type f -name "Index.html" | xargs perl -pi -e 's/preview\/Index.html/Index.html/g'
find . -type f -name "Index.html" | xargs perl -pi -e 's/<head>/<head>\n\t\t\t<base target=\"_blank\" \/>/g'
find . -type f -name "*.html" | xargs perl -pi -e 's/width:70%/width:80%/g'
find . -type f -name "*.html" | xargs perl -pi -e 's/width:30px/10px/g'
find . -type f -name "*.html" | xargs perl -pi -e 's/width:25px/10px/g'
find . -type f -name "*.html"| xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/style\/github-bf51422f4bb36427d391e4b75a1daa083c2d840e.css/toc\/style\/github-bf51422f4bb36427d391e4b75a1daa083c2d840e.css/g'
find . -type f -name "*.html"| xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/style\/makedownpad.css/toc\/style\/makedownpad.css/g'
find . -type f -name "*.html"| xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/style\/GitHub2.css/toc\/style\/GitHub2.css/g'
find . -type f -name "*.html"| xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/style\/GitHub.css/toc\/style\/GitHub.css/g'
find . -type f -name "*.html"| xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/style\/github2-d731afd4f624c99a4b19ad69f3083cd6d02b81d5.css/toc\/style\/github2-d731afd4f624c99a4b19ad69f3083cd6d02b81d5.css/g'
find . -type f -name "*.html"| xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/style\/Clearness Dark.css/toc\/style\/Clearness Dark.css/g'
find . -type f -name "*.html"| xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/style\/Clearness.css/toc\/style\/Clearness.css/g'
find . -type f -name "*.html"| xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/css\/zTreeStyle\/zTreeStyle.css/toc\/css\/zTreeStyle\/zTreeStyle.css/g'
find . -type f -name "*.html"| xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/js\/ztree_toc.js/toc\/js\/ztree_toc.js/g'
find . -type f -name "*.html"| xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/js\/ztree_toc.min.js/toc\/js\/ztree_toc.min.js/g'
find . -type f -name "*.html"| xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/js\/jquery-1.4.4.min.js/toc\/js\/jquery-1.4.4.min.js/g'
find . -type f -name "*.html"| xargs perl -pi -e 's/\/var\/lib\/gems\/2.5.0\/gems\/tocmd-0.4.3\/vendor\/toc\/js\/jquery.ztree.all-3.5.min.js/toc\/js\/jquery.ztree.all-3.5.min.js/g'
sudo cp Index.html preview/
cd preview
find . -type f -name "Index.html" | xargs perl -pi -e 's/preview\///g'
find . -type f -name "Index.html" | xargs perl -pi -e 's/<head>/<head>\n\t\t\t<base target=\"_blank\" \/>/g'
find . -type f -name "*.html" | xargs perl -pi -e 's/width:70%/width:80%/g'
find . -type f -name "*.html" | xargs perl -pi -e 's/width:30px/10px/g'
find . -type f -name "*.html" | xargs perl -pi -e 's/width:25px/10px/g'
cd ..
sudo mv $INIT_PATH/assets/* $INIT_PATH/preview/images/
sudo rm -rf $INIT_PATH/assets
#sudo mv preview/Index.html $INIT_PATH/

