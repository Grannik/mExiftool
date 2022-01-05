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
 HEAD(){ for (( a=2; a<=13; a++ ))
  do
   TPUT $a 1
 $E "\033[34m\xE2\x94\x82                                                                 \xE2\x94\x82\033[0m";
  done
 TPUT 2 3
 $E "\033[1;2mОбзор опций                        \033[36mOption Overview\033[0m";
 TPUT 3 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m"
 TPUT 12 3
 $E "\033[36mUp \xE2\x86\x91 \xE2\x86\x93 Down Select Enter\033[0m";
 MARK;TPUT 1 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m" ;UNMARK;}
  i=0; CLEAR; CIVIS;NULL=/dev/null
 FOOT(){ MARK;TPUT 14 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m";UNMARK;}
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
 M0(){ TPUT  4 3; $e "Опции                             \033[32m Options                     \033[0m";}
 M1(){ TPUT  5 3; $e "Операции с тегами                 \033[32m Tag operations              \033[0m";}
 M2(){ TPUT  6 3; $e "Форматирование текста ввода-вывода\033[32m Input-output text formatting\033[0m";}
 M3(){ TPUT  7 3; $e "Контроль обработки                \033[32m Processing control          \033[0m";}
 M4(){ TPUT  8 3; $e "Другие oпции                      \033[32m Other options               \033[0m";}
 M5(){ TPUT  9 3; $e "Особые возможности                \033[32m Special features            \033[0m";}
 M6(){ TPUT 10 3; $e "Утилиты                           \033[32m Utilities                   \033[0m";}
 M7(){ TPUT 11 3; $e "Расширенные опции                 \033[32m Advanced options            \033[0m";}
#
 M8(){ TPUT 13 3; $e "Выход                             \033[32m EXIT                        \033[0m";}
LM=8
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
 0) S=M0;SC;if [[ $cur == enter ]];then R;echo "   Регистр не имеет значения для каких-либо параметров командной строки (включая имена тегов и групп), за исключением односимвольных параметров, когда
 соответствующий верхний регистр вариант существует. Многие односимвольные параметры имеют эквивалентные версии с длинными именами (показаны в скобках), а некоторые
 параметры имеют инверсии, которые вызываются с помощью ведущее двойное тире. Нераспознанные параметры интерпретируются как имена тегов (по этой причине несколько
 односимвольных параметров НЕ могут быть объединены в один аргумент). Вопреки стандартной практике, параметры могут появляться после имен исходных файлов
 в командной строке exiftool.";ES;fi;;
 1) S=M1;SC;if [[ $cur == enter ]];then R;echo "
 -TAG или --TAG         Извлечь или исключить указанный тег
 -TAG [+ - ^] = [VALUE] Записать новое значение для тега
 -TAG [+ -] <= DATFILE  Записать значение тега из содержимого файла
 -TAG [+ -] <SRCTAG     Копировать значение тега (см. -TagsFromFile)
 -tagsFromFile SRCFILE  Копировать значения тегов из файла
 -x TAG (-exclude)      Исключить указанный тег
";ES;fi;;
 2) S=M2;SC;if [[ $cur == enter ]];then R;echo "
 -args (-argFormat)                      Форматировать метаданные как аргументы exiftool
 -b (-binary)                            Выводить метаданные в двоичном формате
 -c FMT (-coordFormat)                   Установить формат для координат GPS
 -charset [[TYPE =] CHARSET]             Укажите кодировку для специальных символов.
 -csv [[+] = CSVFILE]                    Экспорт / импорт тегов в формате CSV.
 -d FMT (-dateFormat)                    Установить формат для значений даты / времени
 -D (-decimal)                           Показать номера идентификаторов тегов в десятичном формате
 -E, -ex, -ec (-escape (HTML | XML | C)) Экранировать значения тегов для HTML, XML или C
 -f (-forcePrint)                        Принудительная печать всех указанных тегов
 -g [ЧИСЛО ...] (-groupHeadings)         Организовать вывод по группам тегов
 -G [ЧИСЛО ...] (-groupNames)            Вывести имя группы для каждого тега
 -h (-htmlFormat)                        Использовать форматирование HTML для вывода
 -H (-hex)                               Показать номера идентификаторов тегов в шестнадцатеричном формате
 -htmlDump [OFFSET]                      Создать двоичный дамп в формате HTML.
 -j [[+] = JSONFILE] (-json)             Экспорт / импорт тегов в формате JSON
 -l (-long)                              Использовать длинный 2-строчный формат вывода
 -L (-latin)                             Использовать кодировку Windows Latin1
 -lang [LANG]                            Установить текущий язык
 -listItem INDEX                         Извлечь определенный элемент из списка
 -n (--printConv)                        Без преобразования печати
 -p FMTFILE (-printFormat)               Распечатать вывод в указанном формате
 -php                                    Экспорт тегов в виде массива PHP
 -s [ЧИСЛО] (-short)                     Короткий формат вывода
 -S (-veryShort)                         Очень короткий выходной формат
 -sep STR (-separator)                   Установить строку-разделитель для элементов списка
 -sort                                   Сортировать вывод по алфавиту
 -struct                                 Разрешить вывод структурированной информации
 -t (-tab)                               Вывод в формате списка с разделителями табуляции
 -T (-table)                             Вывод в табличном формате
 -v [ЧИСЛО] (-verbose)                   Печатать подробные сообщения
 -w [+ |!] EXT (-textOut)                Записывать (или перезаписывать!) выходные текстовые файлы
 -W [+ |!] FMT (-tagOut)                 Записать выходной текстовый файл для каждого тега
 -Wext EXT (-tagOutExt)                  Записывать только указанные типы файлов с -W
 -X (-xmlFormat)                         Использовать выходной формат RDF / XML
";ES;fi;;
 3) S=M3;SC;if [[ $cur == enter ]];then R;echo "
 -a (-duplicates)             Разрешить извлечение повторяющихся тегов
 -e (--composite)             Не создавать составные теги
 -ee (-extractEmbedded)       Извлечь информацию из встроенных файлов
 -ext [+] EXT (-extension)    Обрабатывать файлы с указанным расширением
 -F [OFFSET] (-fixBase)       Исправить базу для смещения заметок производителя.
 -fast [NUM]                  Увеличить скорость при извлечении метаданных
 -fileOrder [NUM] [-] TAG     Установить порядок обработки файлов
 -i DIR (-ignore)             Игнорировать указанное имя каталога
 -if [NUM] EXPR               Условно обрабатывать файлы
 -m (-ignoreMinorErrors)      Игнорировать мелкие ошибки и предупреждения
 -o OUTFILE (-out)            Установить выходной файл или имя каталога
 -overwrite_original          Перезаписать оригинал путем переименования файла tmp
 -overwrite_original_in_place Перезаписать оригинал, скопировав файл tmp
 -P (-preserve)               Сохранить дату / время изменения файла
 -password PASSWD             Пароль для обработки защищенных файлов
 -progress [: [TITLE]]        Показать счетчик прогресса файла
 -q (-quiet)                  Тихая обработка
 -r [.] (-recurse)            Рекурсивно обрабатывать подкаталоги
 -scanForXMP                  Сканирование XMP методом грубой силы
 -u (-unknown)                Извлечь неизвестные теги
 -U (-unknown2)               Извлечь также неизвестные двоичные теги
 -wm MODE (-writeMode)        Установить режим для записи / создания тегов
 -z (-zip)                    Чтение / запись сжатой информации
";ES;fi;;
 4) S=M4;SC;if [[ $cur == enter ]];then R;echo "
 - @ ARGFILE                          Прочитать аргументы командной строки из файла
 -k (-pause)                          Пауза перед завершением
 -list [w | f | wf | g [NUM] | d | x] Список различных возможностей exiftool
 -ver                                 Вывести номер версии exiftool
 -                                    Конец опций
";ES;fi;;
 5) S=M5;SC;if [[ $cur == enter ]];then R;echo "
 -geotag TRKFILE        Геотегирование изображений из указанного журнала GPS
 -globalTimeShift SHIFT Сдвигает все форматированные значения даты / времени
 -use MODULE            Добавить функции из подключаемого модуля
";ES;fi;;
 6) S=M6;SC;if [[ $cur == enter ]];then R;echo "
 -delete_original [!] Удалить_оригинальные резервные копии
 -restore_original    Восстановление из резервных копий _original
";ES;fi;;
 7) S=M7;SC;if [[ $cur == enter ]];then R;echo "
 -api OPT [[^] = [VAL]]         Установить параметр ExifTool API
 -common_args                   Определить общие аргументы
 -config CFGFILE                Укажите имя файла конфигурации
 -echo [NUM] TEXT               Выводить текст на стандартный вывод или стандартный поток.
 -efile [NUM] [!]               ERRFILE Сохранить имена файлов с ошибками
 -execute [ЧИСЛО]               Выполнять несколько команд в одной строке
 -srcfile FMT                   Обработка другого исходного файла
 -stay_open FLAG                Продолжайте читать - @ argfile даже после EOF
 -userParam PARAM [[^] = [VAL]] Установить параметр пользователя (опция UserParam API)
";ES;fi;;
 8) S=M8;SC;if [[ $cur == enter ]];then R;clear;exit 0;fi;;
 esac;POS;done
