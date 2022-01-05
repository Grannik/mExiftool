#!/bin/bash
 E='echo -e';e='echo -en';trap "R;exit" 2
 ESC=$( $e "\e")
 TPUT(){ $e "\e[${1};${2}H" ;}
 CLEAR(){ $e "\ec";}
# 25 возможно это
 CIVIS(){ $e "\e[?25l";}
# это цвет текста списка перед курсором при значении 0 в переменной  UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[1;90m";}
# 0 это цвет заднего фона списка
 UNMARK(){ $e "\e[0m";}
# ~~~~~~~~ Эти строки задают цвет фона ~~~~~~~~
 R(){ CLEAR ;stty sane;CLEAR;};
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 HEAD(){ for (( a=2; a<=30; a++ ))
  do
   TPUT $a 1
 $E "\033[34m\xE2\x94\x82                                                                                                                                                              \xE2\x94\x82\033[0m";
  done
 TPUT 7 3
 $E "\033[36m#\033[0m";
 TPUT 10 3
 $E "\033[36m#\033[0m";
 TPUT 29 4
 $E "\033[32mUp \xE2\x86\x91 \xE2\x86\x93 Down Select Enter\033[0m";
 MARK;TPUT 1 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m" ;UNMARK;}
  i=0; CLEAR; CIVIS;NULL=/dev/null
 FOOT(){ MARK;TPUT 31 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
 ARROW(){ IFS= read -s -n1 key 2>/dev/null >&2
           if [[ $key = $ESC ]];then
              read -s -n1 key 2>/dev/null >&2;
              if [[ $key = \[ ]]; then
                 read -s -n1 key 2>/dev/null >&2;
                 if [[ $key = A ]]; then echo up;fi
                 if [[ $key = B ]];then echo dn;fi
              fi
           fi
           if [[ "$key" == "$($e \\x0A)" ]];then echo enter;fi;}
  M0(){ TPUT  2 3; $e "Примечание                                                                             \033[32m Note                                                               \033[0m";}
  M1(){ TPUT  3 3; $e "Напишите новый комментарий к изображению JPG                                           \033[32m exiftool -Comment='This is a new comment' dst.jpg                  \033[0m";}
  M2(){ TPUT  4 3; $e "Удалите комментарии ко всем изображениям JPG в текущем каталоге                        \033[32m exiftool -comment= -o newdir -ext jpg                              \033[0m";}
  M3(){ TPUT  5 3; $e "Замените существующий список ключевых слов двумя новыми ключевыми словами              \033[32m exiftool -keywords=EXIF -keywords=editor dst.jpg                   \033[0m";}
  M4(){ TPUT  6 3; $e "Скопируйте исходное изображение в новый файл и добавьте ключевое слово                 \033[32m exiftool -Keywords+=word -o newfile.jpg src.jpg                    \033[0m";}
  M5(){ TPUT  7 3; $e "Уменьшите значение ExposureCompensation на 0,5 EV                                      \033[32m exiftool -exposurecompensation+=-0.5 a.jpg                         \033[0m";}
  M6(){ TPUT  8 3; $e "Удалите информацию о кредите из всех файлов в каталоге, где кредит был «xxx»           \033[32m exiftool -credit-=xxx dir                                          \033[0m";}
  M7(){ TPUT  9 3; $e "Напишите альтернативный язык для XMP                                                   \033[32m exiftool -xmp:description-de='k&uuml;hl' -E dst.jpg                \033[0m";}
  M8(){ TPUT 10 3; $e "Удалите всю метаинформацию с изображения                                               \033[32m exiftool -all= dst.jpg                                             \033[0m";}
  M9(){ TPUT 11 3; $e "Удалите всю метаинформацию с изображения и снова добавьте комментарий                  \033[32m exiftool -all= -comment='lonely' dst.jpg                           \033[0m";}
 M10(){ TPUT 12 3; $e "Удалите с изображения всю метаинформацию, кроме группы JFIF                            \033[32m exiftool -all= --jfif:all dst.jpg                                  \033[0m";}
 M11(){ TPUT 13 3; $e "Удалите метаинформацию Photoshop из изображения                                        \033[32m exiftool -Photoshop:All= dst.jpg                                   \033[0m";}
 M12(){ TPUT 14 3; $e "Рекурсивно удалить всю информацию XMP-crss из изображений в каталоге                   \033[32m exiftool -r -XMP-crss:all= DIR                                     \033[0m";}
 M13(){ TPUT 15 3; $e "Установите эскиз изображения из указанного файла                                       \033[32m exiftool '-ThumbnailImage<=thumb.jpg' dst.jpg                      \033[0m";}
 M14(){ TPUT 16 3; $e "Рекурсивно записывать изображения JPEG с именами файлов, заканчивающимися на «_JFR.JPG»\033[32m exiftool '-JpgFromRaw<=%d%f_JFR.JPG' -ext NEF -r                   \033[0m";}
 M15(){ TPUT 17 3; $e "Отрегулируйте исходную дату / время для всех изображений в каталоге «dir»              \033[32m exiftool -DateTimeOriginal-='0:0:0 1:30:0' dir                     \033[0m";}
 M16(){ TPUT 18 3; $e "Добавьте 3 часа к отметкам времени CreateDate и ModifyDate двух изображений            \033[32m exiftool -createdate+=3 -modifydate+=3 a.jpg b.jpg                 \033[0m";}
 M17(){ TPUT 19 3; $e "Сдвиньте значения DateTimeOriginal, CreateDate и ModifyDate для всех изображений Canon \033[32m exiftool -AllDates+=1:30 -if '\$make eq \"Canon\"' dir                \033[0m";}
 M18(){ TPUT 20 3; $e "Напишите тег для группы XMP из двух изображений                                        \033[32m exiftool -xmp:city=Kingston image1.jpg image2.nef                  \033[0m";}
 M19(){ TPUT 21 3; $e "Удаляйте тег «LightSource», только если он неизвестен со значением 0                   \033[32m exiftool -LightSource-='Unknown (0)' dst.tiff                      \033[0m";}
 M20(){ TPUT 22 3; $e "Установите «Баланс белого» на «Вольфрам», только если ранее он был «Авто»              \033[32m exiftool -whitebalance-=auto -WhiteBalance=tung dst.jpg            \033[0m";}
 M21(){ TPUT 23 3; $e "Напишите новый комментарий, только если у изображения его еще нет                      \033[32m exiftool -comment-= -comment='new comment' a.jpg                   \033[0m";}
 M22(){ TPUT 24 3; $e "Создайте файлы данных метаинформации XMP для всех изображений в «каталоге»             \033[32m exiftool -o %d%f.xmp dir                                           \033[0m";}
 M23(){ TPUT 25 3; $e "Создавайте файл данных XMP только из тегов, определенных в командной строке            \033[32m exiftool -o test.xmp -owner=Phil -title='XMP File'                 \033[0m";}
 M24(){ TPUT 26 3; $e "Запишите ICC_Profile в изображение из одноименного файла «.icc»                        \033[32m exiftool '-ICC_Profile<=%d%f.icc' image.jpg                        \033[0m";}
 M25(){ TPUT 27 3; $e "Напишите структурированную информацию XMP                                              \033[32m exiftool -hierarchicalkeywords='{keyword=one,children={keyword=B}}'\033[0m";}
 M26(){ TPUT 28 3; $e "Удалите любой трейлер, найденный после конца изображения (EOI) в файле JPEG            \033[32m exiftool -trailer:all= image.jpg                                   \033[0m";}
#
 M27(){ TPUT 30 3; $e "Выход                                                                                  \033[32m EXIT                                                               \033[0m";}
LM=27
 MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
 0) S=M0;SC;if [[ $cur == enter ]];then R;echo "    Обратите внимание, что необходимо заключать в кавычки аргументы, содержащие определенные специальные символы, такие как «>», «<» или любые пробелы. Эти методы
 цитирования зависит от оболочки, но приведенные ниже примеры будут работать для большинства оболочек Unix. Однако в оболочке Windows cmd следует использовать
 двойные кавычки (eg. -Comment=\"This is a new comment\")";ES;fi;;
 1) S=M1;SC;if [[ $cur == enter ]];then R;echo " Напишите новый комментарий к изображению JPG (заменяет любой существующий комментарий).";ES;fi;;
 2) S=M2;SC;if [[ $cur == enter ]];then R;echo " Удалите комментарии ко всем изображениям JPG в текущем каталоге, записав измененные изображения в новый каталог.";ES;fi;;
 3) S=M3;SC;if [[ $cur == enter ]];then R;echo " Замените существующий список ключевых слов двумя новыми ключевыми словами («EXIF» и «редактор»).";ES;fi;;
 4) S=M4;SC;if [[ $cur == enter ]];then R;echo " Скопируйте исходное изображение в новый файл и добавьте ключевое слово («слово») в текущий список ключевых слов.";ES;fi;;
 5) S=M5;SC;if [[ $cur == enter ]];then R;echo "    Уменьшите значение ExposureCompensation на 0,5 EV. Обратите внимание, что + = с отрицательным значением используется для уменьшения, потому что используется
 оператор - = для условного удаления (см. следующий пример).";ES;fi;;
 6) S=M6;SC;if [[ $cur == enter ]];then R;echo " Удалите информацию о кредите из всех файлов в каталоге, где значение кредита было «xxx».";ES;fi;;
 7) S=M7;SC;if [[ $cur == enter ]];then R;echo " Напишите альтернативный язык для XMP: Описание, используя экранирование символов HTML для ввода специальных символов.";ES;fi;;
 8) S=M8;SC;if [[ $cur == enter ]];then R;echo "    Удалите всю метаинформацию с изображения. Примечание. НЕ следует делать это с изображениями RAW (кроме DNG), поскольку проприетарные форматы изображений RAW
 часто содержат информация в примечаниях производителя, необходимая для преобразования изображения.";ES;fi;;
 9) S=M9;SC;if [[ $cur == enter ]];then R;echo "    Удалите всю метаинформацию с изображения и снова добавьте комментарий (обратите внимание, что порядок важен: «-comment = 'lonely' -all =» также удалит новый
 комментарий.)";ES;fi;;
10) S=M10;SC;if [[ $cur == enter ]];then R;echo " Удалите с изображения всю метаинформацию, кроме группы JFIF.";ES;fi;;
11) S=M11;SC;if [[ $cur == enter ]];then R;echo " Удалите метаинформацию Photoshop из изображения (обратите внимание, что информация Photoshop также включает IPTC).";ES;fi;;
12) S=M12;SC;if [[ $cur == enter ]];then R;echo " Рекурсивно удалить всю информацию XMP-crss из изображений в каталоге.";ES;fi;;
13) S=M13;SC;if [[ $cur == enter ]];then R;echo " Установите эскиз изображения из указанного файла (Примечание: кавычки необходимы для предотвращения перенаправления оболочки).";ES;fi;;
14) S=M14;SC;if [[ $cur == enter ]];then R;echo "    Рекурсивно записывать изображения JPEG с именами файлов, заканчивающимися на «_JFR.JPG», в тег JpgFromRaw файлов с одинаковыми именами с расширением «.NEF» в
 текущем каталог. (Это обратная команда «-JpgFromRaw» в разделе «ЧТЕНИЕ ПРИМЕРОВ» выше.)";ES;fi;;
15) S=M15;SC;if [[ $cur == enter ]];then R;echo "    Отрегулируйте исходную дату / время для всех изображений в каталоге «dir», вычтя один час 30 минут. (Это эквивалентно «-DateTimeOriginal- = 1.5». Подробнее см.
 Image :: ExifTool :: Shift.pl.)";ES;fi;;
16) S=M16;SC;if [[ $cur == enter ]];then R;echo " Добавьте 3 часа к отметкам времени CreateDate и ModifyDate двух изображений.";ES;fi;;
17) S=M17;SC;if [[ $cur == enter ]];then R;echo "    Сдвиньте значения DateTimeOriginal, CreateDate и ModifyDate вперед на 1 час 30 минут для всех изображений Canon в каталоге. (Все даты Тег предоставляется как
 ярлык для этих трех тегов, что позволяет получить к ним доступ через один тег.)";ES;fi;;
18) S=M18;SC;if [[ $cur == enter ]];then R;echo "    Напишите тег для группы XMP из двух изображений. (Без «xmp:» этот тег был бы записан в группу IPTC, поскольку «Город» существует в обеих, а IPTC -
 предпочтительнее по умолчанию.)";ES;fi;;
19) S=M19;SC;if [[ $cur == enter ]];then R;echo " Удаляйте тег «LightSource», только если он неизвестен со значением 0.";ES;fi;;
20) S=M20;SC;if [[ $cur == enter ]];then R;echo " Установите «Баланс белого» на «Вольфрам», только если ранее он был «Авто».";ES;fi;;
21) S=M21;SC;if [[ $cur == enter ]];then R;echo " Напишите новый комментарий, только если у изображения его еще нет.";ES;fi;;
22) S=M22;SC;if [[ $cur == enter ]];then R;echo " Создайте файлы данных метаинформации XMP для всех изображений в «каталоге».";ES;fi;;
23) S=M23;SC;if [[ $cur == enter ]];then R;echo " Создавайте файл данных XMP только из тегов, определенных в командной строке.";ES;fi;;
24) S=M24;SC;if [[ $cur == enter ]];then R;echo " Запишите ICC_Profile в изображение из одноименного файла «.icc».";ES;fi;;
25) S=M25;SC;if [[ $cur == enter ]];then R;echo " Напишите структурированную информацию XMP. См: Https://exiftool.org/struct.html для получения более подробной информации.";ES;fi;;
26) S=M26;SC;if [[ $cur == enter ]];then R;echo "    Удалите любой трейлер, найденный после конца изображения (EOI) в файле JPEG. Некоторые цифровые камеры сохраняют большое изображение предварительного просмотра
 после JPEG EOI, и размер файла можно значительно уменьшить, удалив этот трейлер. Список распознанных трейлеров JPEG см. В документации по тегам JPEG.";ES;fi;;
#
27) S=M27;SC;if [[ $cur == enter ]];then R;clear;exit 0;fi;;
 esac;POS;done
