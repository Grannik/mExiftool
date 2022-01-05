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
 HEAD(){ for (( a=2; a<=23; a++ ))
  do
   TPUT $a 1
 $E "\033[34m\xE2\x94\x82                                                                                                                                             \xE2\x94\x82\033[0m";
  done
 TPUT 22 4
 $E "\033[32mUp \xE2\x86\x91 \xE2\x86\x93 Down Select Enter\033[0m";
 MARK;TPUT 1 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m" ;UNMARK;}
  i=0; CLEAR; CIVIS;NULL=/dev/null
 FOOT(){ MARK;TPUT 24 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m";UNMARK;}
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
  M0(){ TPUT  2 3; $e "Примечание:                                                           \033[32m Note:                                                              \033[0m";}
  M1(){ TPUT  3 3; $e "Распечатать всю метаинформацию изображения, теги                      \033[32m exiftool -a -u -g1 a.jpg                                           \033[0m";}
  M2(){ TPUT  4 3; $e "Вывести общую метаинформацию для всех изображений в «каталоге»        \033[32m exiftool -common dir                                               \033[0m";}
  M3(){ TPUT  5 3; $e "Перечислить метаинформацию в виде столбца с разделителями табуляции   \033[32m exiftool -T -createdate -aperture -shutterspeed -iso dir > out.txt \033[0m";}
  M4(){ TPUT  6 3; $e "Распечатайте имена и значения тегов ImageSize и ExposureTime          \033[32m exiftool -s -ImageSize -ExposureTime b.jpg                         \033[0m";}
  M5(){ TPUT  7 3; $e "Распечатайте стандартную информацию Canon из двух файлов изображений  \033[32m exiftool -l -canon c.jpg d.jpg                                     \033[0m";}
  M6(){ TPUT  8 3; $e "Рекурсивно извлекать метаинформацию из файлов в каталоге «pictures»   \033[32m exiftool -r -w .txt -common pictures                               \033[0m";}
  M7(){ TPUT  9 3; $e "Сохраните миниатюрное изображение из image.jpg в файл thumbnail.jpg   \033[32m exiftool -b -ThumbnailImage image.jpg > thumbnail.jpg              \033[0m";}
  M8(){ TPUT 10 3; $e "Рекурсивно извлеките изображение JPG из всех файлов Nikon NEF         \033[32m exiftool -b -JpgFromRaw -w _JFR.JPG -ext NEF -r                    \033[0m";}
  M9(){ TPUT 11 3; $e "Извлеките все типы изображений предварительного просмотра             \033[32m exiftool -a -b -W %d%f_%t%-c.%s -preview:all dir                   \033[0m";}
 M10(){ TPUT 12 3; $e "Печать даты, времени в формате для всех файлов JPG в каталоге         \033[32m exiftool -d '%r %a, %B %e, %Y' -DateTimeOriginal -S -s -ext jpg    \033[0m";}
 M11(){ TPUT 13 3; $e "Извлечь разрешение изображения из информации EXIF IFD1 (эскиз IFD)    \033[32m exiftool -IFD1:XResolution -IFD1:YResolution image.jpg             \033[0m";}
 M12(){ TPUT 14 3; $e "Извлеките из изображения все теги с именами, содержащими «Разрешение» \033[32m exiftool '-*resolution*' image.jpg                                 \033[0m";}
 M13(){ TPUT 15 3; $e "Извлеките из изображения всю информацию об авторе XMP                 \033[32m exiftool -xmp:author:all -a image.jpg                              \033[0m";}
 M14(){ TPUT 16 3; $e "Извлеките полную запись данных XMP в неповрежденном виде              \033[32m exiftool -xmp -b a.jpg > out.xmp                                   \033[0m";}
 M15(){ TPUT 17 3; $e "Выведите одну строку вывода, содержащую имя файла и DateTimeOriginal  \033[32m exiftool -p '\$filename has date \$dateTimeOriginal' -q -f dir       \033[0m";}
 M16(){ TPUT 18 3; $e "Извлеките все позиции GPS из видео AVCHD                              \033[32m exiftool -ee -p '\$gpslatitude, \$gpslongitude, \$gpstimestamp' a.m2ts\033[0m";}
 M17(){ TPUT 19 3; $e "Сохраните полный ICC_Profile из изображения в выходной файл           \033[32m exiftool -icc_profile -b -w icc image.jpg                          \033[0m";}
 M18(){ TPUT 20 3; $e "Сгенерируйте HTML-страницы из шестнадцатеричного дампа информации EXIF\033[32m exiftool -htmldump -w tmp/%f_%e.html t/images                      \033[0m";}
 M19(){ TPUT 21 3; $e "Извлечение встроенных изображений JPG и JP2 из файла PDF              \033[32m exiftool -a -b -ee -embeddedimage -W Image_%.3g3.%s file.pdf       \033[0m";}
#
 M20(){ TPUT 23 3; $e "Выход                                                                 \033[32m EXIT                                                               \033[0m";}
 LM=20
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
 0) S=M0;SC;if [[ $cur == enter ]];then R;echo "    Будьте осторожны, вырезая и вставляя эти примеры в свой терминал! Некоторые символы, такие как одинарные и двойные кавычки и дефисы, могли быть преобразован в
 похожие на вид, но функционально разные символы средством форматирования текста, используемым для отображения этой документации. Также обратите внимание, что
 пользователи Windows необходимо использовать двойные кавычки вместо одинарных кавычек, как показано ниже, вокруг аргументов, содержащих специальные символы.";ES;fi;;
 1) S=M1;SC;if [[ $cur == enter ]];then R;echo "    Распечатать всю метаинформацию изображения, включая повторяющиеся и неизвестные теги, с сортировкой по группам (для семейства 1). По соображениям
 производительности эта команда не может извлечь все доступные метаданные. (Метаданные во встроенных документах, метаданные, извлеченные внешними утилитами, и
 метаданные, требующие чрезмерного время обработки не может быть извлечено). Добавьте в команду «-ee» и «-api RequestAll = 3», чтобы извлечь абсолютно все, что
 доступно.";ES;fi;;
 2) S=M2;SC;if [[ $cur == enter ]];then R;echo " Вывести общую метаинформацию для всех изображений в «каталоге». «-common» - ярлык, представляющий общую метаинформацию EXIF.";ES;fi;;
 3) S=M3;SC;if [[ $cur == enter ]];then R;echo " Перечислить указанную метаинформацию в виде столбца с разделителями табуляции для всех изображений в «dir» в выходной текстовый файл с именем «out.txt».";ES;fi;;
 4) S=M4;SC;if [[ $cur == enter ]];then R;echo " Распечатайте имена и значения тегов ImageSize и ExposureTime.";ES;fi;;
 5) S=M5;SC;if [[ $cur == enter ]];then R;echo " Распечатайте стандартную информацию Canon из двух файлов изображений.";ES;fi;;
 6) S=M6;SC;if [[ $cur == enter ]];then R;echo " Рекурсивно извлекать общую метаинформацию из файлов в каталоге «pictures», записывая текстовый вывод в файлы «.txt» с такими же именами.";ES;fi;;
 7) S=M7;SC;if [[ $cur == enter ]];then R;echo " Сохраните миниатюрное изображение из «image.jpg» в файл с именем «thumbnail.jpg».";ES;fi;;
 8) S=M8;SC;if [[ $cur == enter ]];then R;echo " Рекурсивно извлеките изображение JPG из всех файлов Nikon NEF в текущем каталоге, добавив «_JFR.JPG» в качестве имени выходных файлов JPG.";ES;fi;;
 9) S=M9;SC;if [[ $cur == enter ]];then R;echo "    Извлеките все типы изображений предварительного просмотра (ThumbnailImage, PreviewImage, JpgFromRaw и т. Д.) Из файлов в каталоге \"dir\", добавив имя тега к
 выходным данным предварительный просмотр имен файлов изображений.";ES;fi;;
10) S=M10;SC;if [[ $cur == enter ]];then R;echo " Печать даты и времени в формате для всех файлов JPG в текущем каталоге.";ES;fi;;
11) S=M11;SC;if [[ $cur == enter ]];then R;echo " Извлечь разрешение изображения из информации EXIF IFD1 (эскиз IFD).";ES;fi;;
12) S=M12;SC;if [[ $cur == enter ]];then R;echo " Извлеките из изображения все теги с именами, содержащими слово «Разрешение».";ES;fi;;
13) S=M13;SC;if [[ $cur == enter ]];then R;echo " Извлеките из изображения всю информацию об авторе XMP.";ES;fi;;
14) S=M14;SC;if [[ $cur == enter ]];then R;echo "    Извлеките полную запись данных XMP в неповрежденном виде из «a.jpg» и запишите ее в «out.xmp» с помощью специального тега «XMP»
 (см. Дополнительные теги в Изображение :: ExifTool :: TagNames).";ES;fi;;
15) S=M15;SC;if [[ $cur == enter ]];then R;echo " Выведите одну строку вывода, содержащую имя файла и DateTimeOriginal для каждого изображения в каталоге \"dir\".";ES;fi;;
16) S=M16;SC;if [[ $cur == enter ]];then R;echo " Извлеките все позиции GPS из видео AVCHD.";ES;fi;;
17) S=M17;SC;if [[ $cur == enter ]];then R;echo " Сохраните полный ICC_Profile из изображения в выходной файл с тем же именем и расширением «.icc».";ES;fi;;
18) S=M18;SC;if [[ $cur == enter ]];then R;echo "    Сгенерируйте HTML-страницы из шестнадцатеричного дампа информации EXIF во всех изображениях из каталога «t/images». Выходные файлы HTML записываются в \"tmp\".
 каталог (который создается, если он не существует) с именами в форме 'FILENAME_EXT.html'.";ES;fi;;
19) S=M19;SC;if [[ $cur == enter ]];then R;echo "    Извлечение встроенных изображений JPG и JP2 из файла PDF. Выходные изображения будут иметь имена файлов, например: Image_#.jpg или Image_#.jp2
 где «#» - это ExifTool family 3 встроенный номер документа для изображения.";ES;fi;;
#
20) S=M20;SC;if [[ $cur == enter ]];then R;clear;exit 0;fi;;
 esac;POS;done
