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
 HEAD(){ for (( a=2; a<=22; a++ ))
  do
   TPUT $a 1
 $E "\033[34m\xE2\x94\x82                                                                                                                                                                   \xE2\x94\x82\033[0m";
  done
 TPUT 15 3
 $E "\033[1;2mПримеры трубопроводов                                                                        \033[36m PIPING EXAMPLES\033[0m";
 TPUT 21 4
 $E "\033[32mUp \xE2\x86\x91 \xE2\x86\x93 Down Select Enter\033[0m";
 MARK;TPUT 1 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m" ;UNMARK;}
  i=0; CLEAR; CIVIS;NULL=/dev/null
 FOOT(){ MARK;TPUT 23 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m";UNMARK;}
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
  M0(){ TPUT  2 3; $e "\033[2mПримеры геотегирования                                                                       \033[36m GEOTAGGING EXAMPLES                                               \033[0m";}
  M1(){ TPUT  3 3; $e "Геотегируйте изображение a.jpg из информации о местоположении в журнале GPS-треков track.log \033[32m exiftool -geotag track.log a.jpg                                  \033[0m";}
  M2(){ TPUT  4 3; $e "Привязка изображения к GPS-положению за определенное время                                   \033[32m exiftool -geotag t.log -geotime='2009:04:02 13:41:12-05:00' a.jpg \033[0m";}
  M3(){ TPUT  5 3; $e "Пометьте изображения в каталоге dir тегами XMP вместо тегов EXIF на основе CreateDate        \033[32m exiftool -geotag log.gpx '-xmp:geotime<createdate' dir            \033[0m";}
  M4(){ TPUT  6 3; $e "Геотеги к изображениям в каталоге dir, учитывающие временные метки изображений               \033[32m exiftool -geotag a.log -geosync=-20 dir                           \033[0m";}
  M5(){ TPUT  7 3; $e "Изображения с геотегами с использованием синхронизации времени из двух отмеченных геотегами  \033[32m exiftool -geotag a.log -geosync=1.jpg -geosync=2.jpg dir          \033[0m";}
  M6(){ TPUT  8 3; $e "Геотеги изображений в каталоге с помощью CreateDate с указанным часовым поясом               \033[32m exiftool -geotag a.log '-geotime<\${createdate}+01:00' dir         \033[0m";}
  M7(){ TPUT  9 3; $e "Удалите теги GPS, которые могли быть добавлены функцией геотегов                             \033[32m exiftool -geotag= a.jpg                                           \033[0m";}
  M8(){ TPUT 10 3; $e "Удалите теги XMP GPS, которые были добавлены функцией геотегов                               \033[32m exiftool -xmp:geotag= a.jpg                                       \033[0m";}
  M9(){ TPUT 11 3; $e "Геотегируйте изображение с помощью тегов XMP, используя время из DateTimeOriginal            \033[32m exiftool -xmp:geotag=track.log a.jpg                              \033[0m";}
 M10(){ TPUT 12 3; $e "Объедините несколько журналов треков и добавьте геотеги всего дерева каталогов изображений   \033[32m exiftool -geotag a.log -geotag b.log -r dir                       \033[0m";}
 M11(){ TPUT 13 3; $e "Прочтите все журналы треков из каталога tracks                                               \033[32m exiftool -geotag 'tracks/*.log' -r dir                            \033[0m";}
 M12(){ TPUT 14 3; $e "Создайте журнал треков GPX из всех изображений в каталоге dir                                \033[32m exiftool -p gpx.fmt -d %Y-%m-%dT%H:%M:%SZ dir > out.gpx           \033[0m";}
#
 M13(){ TPUT 16 3; $e "Извлечь информацию из stdin                                                                  \033[32m cat a.jpg | exiftool -                                            \033[0m";}
 M14(){ TPUT 17 3; $e "Извлеките информацию из встроенного эскиза изображения                                       \033[32m exiftool image.jpg -thumbnailimage -b | exiftool -                \033[0m";}
 M15(){ TPUT 18 3; $e "Добавьте ключевое слово IPTC в конвейер, сохраняя вывод в новый файл                         \033[32m cat a.jpg | exiftool -iptc:keywords+=fantastic - > b.jpg          \033[0m";}
 M16(){ TPUT 19 3; $e "Извлекайте информацию из изображения через Интернет с помощью утилиты cURL                   \033[32m curl -s http://a.domain.com/bigfile.jpg | exiftool -fast -        \033[0m";}
 M17(){ TPUT 20 3; $e "Добавьте комментарий к встроенному миниатюрному изображению   \033[32m exiftool a.jpg -thumbnailimage -b | exiftool -comment=wow - | exiftool a.jpg -thumbnailimage'<=-'\033[0m";}
#
 M18(){ TPUT 22 3; $e "Выход                                                                                        \033[32m EXIT                                                              \033[0m";}
LM=18
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
 0) S=M0;SC;if [[ $cur == enter ]];then R;echo "    ExifTool реализует геотеги через 3 специальных тега: Geotag (который для удобства также реализован как опция exiftool), Geosync и Geotime. В приведенных ниже
 примерах выделены некоторые функции геотегирования. Дополнительную документацию см. На: https://exiftool.org/geotag.html";ES;fi;;
 1) S=M1;SC;if [[ $cur == enter ]];then R;echo "    Геотегируйте изображение (a.jpg) из информации о местоположении в журнале GPS-треков (track.log). Поскольку тег Geotime не указан, значение DateTimeOriginal
 используется для геотегов. Предполагается местное системное время, если DateTimeOriginal не содержит часовой пояс.";ES;fi;;
 2) S=M2;SC;if [[ $cur == enter ]];then R;echo " Привязка изображения к GPS-положению за определенное время.";ES;fi;;
 3) S=M3;SC;if [[ $cur == enter ]];then R;echo " Пометьте все изображения в каталоге \"dir\" тегами XMP вместо тегов EXIF на основе изображения CreateDate.";ES;fi;;
 4) S=M4;SC;if [[ $cur == enter ]];then R;echo " Геотеги к изображениям в каталоге \"dir\", учитывающие временные метки изображений, которые на 20 секунд опережали GPS.";ES;fi;;
 5) S=M5;SC;if [[ $cur == enter ]];then R;echo "    Изображения с геотегами с использованием синхронизации времени из двух ранее отмеченных геотегами изображений (1.jpg и 2.jpg), синхронизация изображения и времени
 GPS с использованием линейного коррекция дрейфа времени.";ES;fi;;
 6) S=M6;SC;if [[ $cur == enter ]];then R;echo "    Геотеги изображений в \"каталоге\" с помощью CreateDate с указанным часовым поясом. Если CreateDate уже содержит часовой пояс, то часовой пояс, указанный в
 командная строка игнорируется.";ES;fi;;
 7) S=M7;SC;if [[ $cur == enter ]];then R;echo "    Удалите теги GPS, которые могли быть добавлены функцией геотегов. Обратите внимание, что при этом не удаляются все теги GPS - вместо этого используйте
 «-gps: all =»";ES;fi;;
 8) S=M8;SC;if [[ $cur == enter ]];then R;echo " Удалите теги XMP GPS, которые были добавлены функцией геотегов.";ES;fi;;
 9) S=M9;SC;if [[ $cur == enter ]];then R;echo " Геотегируйте изображение с помощью тегов XMP, используя время из DateTimeOriginal.";ES;fi;;
10) S=M10;SC;if [[ $cur == enter ]];then R;echo " Объедините несколько журналов треков и добавьте геотеги для всего дерева каталогов изображений.";ES;fi;;
11) S=M11;SC;if [[ $cur == enter ]];then R;echo " Прочтите все журналы треков из каталога \"треки\".";ES;fi;;
12) S=M12;SC;if [[ $cur == enter ]];then R;echo "    Создайте журнал треков GPX из всех изображений в каталоге \"dir\". В этом примере используется файл «gpx.fmt», входящий в полный дистрибутив ExifTool и
 предполагает, что все изображения в каталоге «dir» были ранее помечены геотегами.";ES;fi;;
#
13) S=M13;SC;if [[ $cur == enter ]];then R;echo " Извлечь информацию из stdin.";ES;fi;;
14) S=M14;SC;if [[ $cur == enter ]];then R;echo " Извлеките информацию из встроенного эскиза изображения.";ES;fi;;
15) S=M15;SC;if [[ $cur == enter ]];then R;echo " Добавьте ключевое слово IPTC в конвейер, сохраняя вывод в новый файл.";ES;fi;;
16) S=M16;SC;if [[ $cur == enter ]];then R;echo "    Извлекайте информацию из изображения через Интернет с помощью утилиты cURL. Параметр -fast запрещает exiftool сканировать информацию о трейлере, поэтому
 передается только заголовок метаинформации.";ES;fi;;
17) S=M17;SC;if [[ $cur == enter ]];then R;echo "    Добавьте комментарий к встроенному миниатюрному изображению. (Зачем кому-то это нужно, я не знаю, но я включил это в качестве примера, чтобы проиллюстрировать
 гибкость ExifTool.)";ES;fi;;
#
18) S=M18;SC;if [[ $cur == enter ]];then R;clear;exit 0;fi;;
 esac;POS;done
