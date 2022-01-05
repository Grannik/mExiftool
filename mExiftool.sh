#!/bin/bash
#-----------------------------------------------------------------------------------------------------------
 t='\033[1;36m' # Turquoise Бирюзовый
 bb="***";for ((i = 0; i < ${#bb}; i++)); do echo -en ${t}${bb:i:1};sleep 0,020;done;
 echo -n " ";bq="exiftool";      for ((i = 0; i < ${#bq}; i++)); do echo -en ${t}${bq:i:1};sleep 0,020;done;
 echo -n " ";bw="-";             for ((i = 0; i < ${#bw}; i++)); do echo -en ${t}${bw:i:1};sleep 0,020;done;
 echo -n " ";be="чтение";        for ((i = 0; i < ${#be}; i++)); do echo -en ${t}${be:i:1};sleep 0,020;done;
 echo -n " ";br="и";             for ((i = 0; i < ${#br}; i++)); do echo -en ${t}${br:i:1};sleep 0,020;done;
 echo -n " ";bt="запись";        for ((i = 0; i < ${#bt}; i++)); do echo -en ${t}${bt:i:1};sleep 0,020;done;
 echo -n " ";by="метаинформации";for ((i = 0; i < ${#by}; i++)); do echo -en ${t}${by:i:1};sleep 0,020;done;
 echo -n " ";bu="в";             for ((i = 0; i < ${#bu}; i++)); do echo -en ${t}${bu:i:1};sleep 0,020;done;
 echo -n " ";bu="файлы";         for ((i = 0; i < ${#bu}; i++)); do echo -en ${t}${bu:i:1};sleep 0,020;done;
 echo -n " ";bb="***";           for ((i = 0; i < ${#bb}; i++)); do echo -en ${t}${bb:i:1};sleep 0,020;done;
#-----------------------------------------------------------------------------------------------------------
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
clear
 HEAD(){ for (( a=2; a<=38; a++ ))
  do
   TPUT $a 1
 $E "\033[34m\xE2\x94\x82                                                                                                                                                    \xE2\x94\x82\033[0m";
  done
 TPUT 2 3
 $E "\033[1;36m*** exiftool - чтение и запись метаинформации в файлы ***\033[0m";
 TPUT 1 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m"
 TPUT 36 4
 $E "\033[32mUp \xE2\x86\x91 \xE2\x86\x93 Down Select Enter\033[0m";
 MARK;TPUT 3 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m";UNMARK;}
  i=0; CLEAR; CIVIS;NULL=/dev/null
 FOOT(){ MARK;TPUT 39 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m";UNMARK;}
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
  M0(){ TPUT  4 3; $e "Обзор                                                                             \033[32m SYNOPSIS                                                      \033[0m";}
  M1(){ TPUT  5 3; $e "Описание                                                                          \033[32m DESCRIPTION                                                   \033[0m";}
  M2(){ TPUT  6 3; $e "   Типы файлов                                                                    \033[32m File Types                                                    \033[0m";}
  M3(){ TPUT  7 3; $e "   Метаинформация                                                                 \033[32m Meta Information                                              \033[0m";}
  M4(){ TPUT  8 3; $e "Имена файлов Windows Unicode                                                      \033[32m WINDOWS UNICODE FILE NAMES                                    \033[0m";}
  M5(){ TPUT  9 3; $e "Запись файлов только для чтения                                                   \033[32m WRITING READ-ONLY FILES                                       \033[0m";}
  M6(){ TPUT 10 3; $e "Статус выхода                                                                     \033[32m EXIT STATUS                                                   \033[0m";}
  M7(){ TPUT 11 3; $e "Автор                                                                             \033[32m AUTHOR                                                        \033[0m";}
  M8(){ TPUT 12 3; $e "Смотрите также                                                                    \033[32m SEE ALSO                                                      \033[0m";}
  M9(){ TPUT 13 3; $e "Установка и удаление                                                              \033[32m Install                                                       \033[0m";}
 M10(){ TPUT 14 3; $e "Примечание                                                                        \033[32m Note                                                          \033[0m";}
 M11(){ TPUT 15 3; $e "Опции                                                                             \033[34m Option                                                        \033[0m";}
 M12(){ TPUT 16 3; $e "Тэги                                                                              \033[34m Tag                                                           \033[0m";}
 M13(){ TPUT 17 3; $e "Другие и Расширенные опции                                                        \033[34m Other & Advanced options                                      \033[0m";}
 M14(){ TPUT 18 3; $e "Утилиты                                                                           \033[32m Utilities                                                     \033[0m";}
 M15(){ TPUT 19 3; $e "Вспомогательные функции                                                           \033[32m Helper functions                                              \033[0m";}
 M16(){ TPUT 20 3; $e "Примеры чтения                                                                    \033[34m Reding exemples                                               \033[0m";}
 M17(){ TPUT 21 3; $e "Написание примеров                                                                \033[34m WRITING EXAMPLES                                              \033[0m";}
 M18(){ TPUT 22 3; $e "Копирование и переименование примеров                                             \033[34m COPYING & RENAMING EXAMPLES                                   \033[0m";}
 M19(){ TPUT 23 3; $e "Примеры геотегирования и трубопроводов                                            \033[34m GEOTAGGING & PIPING EXAMPLES                                  \033[0m";}
 M20(){ TPUT 24 3; $e "Показать метаданные, связанные с указанным файлом                                 \033[32m exiftool file.fmt                                             \033[0m";}
 M21(){ TPUT 25 3; $e "Отобразить информацию о GPS координатах содержащихся вфайле в форматированном виде\033[32m -filename -gpslatitude -gpslongitude -T                       \033[0m";}
 M22(){ TPUT 26 3; $e "Изменить координаты GPS                                                           \033[32m -exif: gpslatitude gpslatituderef gpslongitude gpslongituderef\033[0m";}
 M23(){ TPUT 27 3; $e "Kопирует все теги из указанного файла в файл, указанный в качестве аргумента      \033[32m -TagsFromFile                                                 \033[0m";}
 M24(){ TPUT 28 3; $e "Oсновные опции                                                                    \033[32m basic options                                                 \033[0m";}
 M25(){ TPUT 29 3; $e "Справочник                                                                        \033[32m man                                                           \033[0m";}
 M26(){ TPUT 30 3; $e "Если надо вывести данные на русском                                               \033[32m exiftool -lang ru file.ff                                     \033[0m";}
 M27(){ TPUT 31 3; $e "Доступные языки можно посмотреть                                                  \033[32m exiftool -lang                                                \033[0m";}
 M28(){ TPUT 32 3; $e "Изменение метаданных                                                              \033[32m option =                                                      \033[0m";}
 M29(){ TPUT 33 3; $e "Удаление метаданных                                                               \033[32m empty value                                                   \033[0m";}
 M30(){ TPUT 34 3; $e "Пакетное редактирование                                                           \033[32m *                                                             \033[0m";}
 M31(){ TPUT 35 3; $e "Название и пояснения к наиболее популярным EXIF-тегам                                                                                            ";}
#
 M32(){ TPUT 37 3; $e "\033[34mGrannik Git -------------------------------------------------------------------------------------------------------------------------------------\033[0m";}
 M33(){ TPUT 38 3; $e "Выход                                                                             \033[32m EXIT                                                          \033[0m";}
LM=33
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
 0) S=M0;SC;if [[ $cur == enter ]];then R;echo "
 Чтение      Reading exiftool [OPTIONS] [-TAG...] [--TAG...] FILE...
 Запись      Writing exiftool [OPTIONS] -TAG[+-<]=[VALUE]... FILE...
 Копирование Copying exiftool [OPTIONS] -tagsFromFile SRCFILE [-SRCTAG[>DSTTAG]...] FILE...
 Другоe      Other   exiftool [ -ver | -list[w|f|r|wf|g[NUM]|d|x] ]
 Конкретные примеры см. В разделах ПРИМЕРЫ ниже. Эта документация отображается, если exiftool запускается без входного ФАЙЛА, когда он ожидается.
";ES;fi;;
 1) S=M1;SC;if [[ $cur == enter ]];then R;echo -e "
   ExifTool - это бесплатная программа с открытым исходным кодом для чтения, записи и управления изображениями, аудио, видео и метаданными PDF. Он не зависит от
 платформы и доступен как в виде библиотеки Perl, так и в виде приложения командной строки.
   Интерфейс командной строки для Image :: ExifTool, используемый для чтения и записи метаинформации в файлы различных типов. ФАЙЛ - это один или несколько исходных
 файлов имен, имена каталогов или \"-\" для стандартного ввода. Метаданные считываются из исходных файлов и выводятся в читаемой форме на консоль (или записываются в
 выводить текстовые файлы с -w).
   Для записи или удаления метаданных значения тегов назначаются с помощью параметров -TAG = [VALUE] и / или -geotag, -csv = или -json =. Чтобы скопировать или
 переместить метаданные, Используется функция -tagsFromFile. По умолчанию исходные файлы сохраняются с добавлением \"_original\" к их именам - обязательно убедитесь,
 что новые файлa в порядке, прежде чем стирать оригиналы. Находясь в режиме записи, exiftool игнорирует любые параметры чтения.
   Примечание. Если FILE - это имя каталога, то обрабатываются только поддерживаемые типы файлов в каталоге (в режиме записи обрабатываются только типы с возможностью
 записи). Однако файлы могут быть указаны по имени, или параметр -ext может использоваться для принудительной обработки файлов с любым расширением. Скрытые файлы в
 каталоге также обработан. Добавление опции -r вызывает рекурсивную обработку подкаталогов, но подкаталоги с именами, начинающимися с \".\" пропускаются если только
 -r. используется.
   При внесении изменений в файлы ExifTool автоматически сохраняет копии оригинальных файлов, добавляя к их именам префикс _original.
   Для того, чтобы бэкапы не создавались нужно добавлять параметр -overwrite_original к командам. Для удаления созданного бэкапа нужно добавлять параметр:
\033[32m -delete_original[!]\033[0m
   Для восстановления из бэкапа
\033[32m -restore_original\033[0m
   Ещё может понадобится параметр -progress для отображения прогресса и -r для рекурсивной обработки.
";ES;fi;;
 2) S=M2;SC;if [[ $cur == enter ]];then R;echo "
 Ниже список типов файлов и метаданных поддерживаемых ExifTool (r = чтение, w = запись, c = создание). Поддерживаемые типы файлов :
 -------------------------------------------------------------------
 *** File Types ***
 ------------+-------------+-------------+-------------+------------
 3FR   r     | DPX   r     | ISO   r     | O     r     | RAW   r/w
 3G2   r/w   | DR4   r/w/c | ITC   r     | ODP   r     | RIFF  r
 3GP   r/w   | DSS   r     | J2C   r     | ODS   r     | RSRC  r
 A     r     | DV    r     | JNG   r/w   | ODT   r     | RTF   r
 AA    r     | DVB   r/w   | JP2   r/w   | OFR   r     | RW2   r/w
 AAE   r     | DVR-MS r    | JPEG  r/w   | OGG   r     | RWL   r/w
 AAX   r/w   | DYLIB r     | JSON  r     | OGV   r     | RWZ   r
 ACR   r     | EIP   r     | K25   r     | OPUS  r     | RM    r
 AFM   r     | EPS   r/w   | KDC   r     | ORF   r/w   | SEQ   r
 AI    r/w   | EPUB  r     | KEY   r     | OTF   r     | SKETCH r
 AIFF  r     | ERF   r/w   | LA    r     | PAC   r     | SO    r
 APE   r     | EXE   r     | LFP   r     | PAGES r     | SR2   r/w
 ARQ   r/w   | EXIF  r/w/c | LNK   r     | PBM   r/w   | SRF   r
 ARW   r/w   | EXR   r     | LRV   r/w   | PCD   r     | SRW   r/w
 ASF   r     | EXV   r/w/c | M2TS  r     | PCX   r     | SVG   r
 AVI   r     | F4A/V r/w   | M4A/V r/w   | PDB   r     | SWF   r
 AVIF  r/w   | FFF   r/w   | MAX   r     | PDF   r/w   | THM   r/w
 AZW   r     | FITS  r     | MEF   r/w   | PEF   r/w   | TIFF  r/w
 BMP   r     | FLA   r     | MIE   r/w/c | PFA   r     | TORRENT r
 BPG   r     | FLAC  r     | MIFF  r     | PFB   r     | TTC   r
 BTF   r     | FLIF  r/w   | MKA   r     | PFM   r     | TTF   r
 CHM   r     | FLV   r     | MKS   r     | PGF   r     | TXT   r
 COS   r     | FPF   r     | MKV   r     | PGM   r/w   | VCF   r
 CR2   r/w   | FPX   r     | MNG   r/w   | PLIST r     | VRD   r/w/c
 CR3   r/w   | GIF   r/w   | MOBI  r     | PICT  r     | VSD   r
 CRM   r/w   | GPR   r/w   | MODD  r     | PMP   r     | WAV   r
 CRW   r/w   | GZ    r     | MOI   r     | PNG   r/w   | WDP   r/w
 CS1   r/w   | HDP   r/w   | MOS   r/w   | PPM   r/w   | WEBP  r
 CSV   r     | HDR   r     | MOV   r/w   | PPT   r     | WEBM  r
 CZI   r     | HEIC  r/w   | MP3   r     | PPTX  r     | WMA   r
 DCM   r     | HEIF  r/w   | MP4   r/w   | PS    r/w   | WMV   r
 DCP   r/w   | HTML  r     | MPC   r     | PSB   r/w   | WTV   r
 DCR   r     | ICC   r/w/c | MPG   r     | PSD   r/w   | WV    r
 DFONT r     | ICS   r     | MPO   r/w   | PSP   r     | X3F   r/w
 DIVX  r     | IDML  r     | MQV   r/w   | QTIF  r/w   | XCF   r
 DJVU  r     | IIQ   r/w   | MRW   r/w   | R3D   r     | XLS   r
 DLL   r     | IND   r/w   | MXF   r     | RA    r     | XLSX  r
 DNG   r/w   | INSP  r/w   | NEF   r/w   | RAF   r/w   | XMP   r/w/c
 DOC   r     | INSV  r     | NRW   r/w   | RAM   r     | ZIP   r
 DOCX  r     | INX   r     | NUMBERS r   | RAR   r     |
";ES;fi;;
 3) S=M3;SC;if [[ $cur == enter ]];then R;echo "
 ----------------------+----------------------+---------------------
 EXIF           r/w/c  |  CIFF           r/w  |  Ricoh RMETA    r
 GPS            r/w/c  |  AFCP           r/w  |  Picture Info   r
 IPTC           r/w/c  |  Kodak Meta     r/w  |  Adobe APP14    r
 XMP            r/w/c  |  FotoStation    r/w  |  MPF            r
 MakerNotes     r/w/c  |  PhotoMechanic  r/w  |  Stim           r
 Photoshop IRB  r/w/c  |  JPEG 2000      r    |  DPX            r
 ICC Profile    r/w/c  |  DICOM          r    |  APE            r
 MIE            r/w/c  |  Flash          r    |  Vorbis         r
 JFIF           r/w/c  |  FlashPix       r    |  SPIFF          r
 Ducky APP12    r/w/c  |  QuickTime      r    |  DjVu           r
 PDF            r/w/c  |  Matroska       r    |  M2TS           r
 PNG            r/w/c  |  MXF            r    |  PE/COFF        r
 Canon VRD      r/w/c  |  PrintIM        r    |  AVCHD          r
 Nikon Capture  r/w/c  |  FLAC           r    |  ZIP            r
 GeoTIFF        r/w/c  |  ID3            r    |  (and more)
";ES;fi;;
 4) S=M4;SC;if [[ $cur == enter ]];then R;echo "
   В Windows аргументы командной строки указываются с использованием текущей кодовой страницы и автоматически перекодируются на системную кодовую страницу. Это
 перекодирование не сделано для аргументов в файлах arg ExifTool, поэтому по умолчанию имена файлов в файлах arg используют системную кодовую страницу. К сожалению,
 эти кодовые страницы не являются полными наборы символов, поэтому могут быть представлены не все имена файлов.
   ExifTool 9.79 и более поздние версии позволяют указывать кодировку имени файла с помощью «-charset filename = CHARSET», где «CHARSET» - это имя действующего
 ExifTool набор символов, предпочтительно UTF8 (полный список см. в параметре -charset). Установка этого параметра запускает использование подпрограмм ввода-вывода
 широких символов Windows, таким образом обеспечение поддержки большинства имен файлов Unicode (см. примечание 4). Но обратите внимание, что передать правильно
 закодированные имена файлов в команде Windows нетривиально строку (см. https://exiftool.org/faq.html#Q18 для получения подробной информации), поэтому рекомендуется
 разместить их в кодировке UTF-8 - @ argfile и использовать -charset filename = utf8 если возможно.
   Предупреждение выдается, если указанное имя файла содержит специальные символы, а набор символов имени файла не был предоставлен. Однако предупреждение может быть
 отключено установкой -charset filename = \"\", и ExifTool может по-прежнему работать правильно, если системная кодовая страница совпадает с набором символов,
 используемым для файла имена.
   Если указано имя каталога, кодировку имени файла указывать не нужно (если имя каталога не содержит специальных символов), и ExifTool будет автоматически
 использовать подпрограммы расширенных символов для сканирования каталога.
   Набор символов имени файла применяется к аргументам ФАЙЛА, а также к аргументам имени файла - @, -geotag, -o, -p, -srcfile, -tagsFromFile, -csv =, -j = и -ТЭГ <=
 Однако это не относится к имени файла -config, которое всегда использует системный набор символов. Параметр -charset filename = должен стоять перед параметр - @
 будет эффективным, но порядок не имеет значения по отношению к другим параметрам.
   Примечания:
 1) Значения тегов FileName и Directory по-прежнему используют ту же кодировку, что и другие значения тегов, и преобразуются в / из набора символов имени файла,
 когда запись / чтение, если указано.
 2) Поддержка Unicode еще не реализована для других систем на базе Windows, таких как Cygwin.
 3) См. Раздел «ЗАПИСЬ ФАЙЛОВ ТОЛЬКО ДЛЯ ЧТЕНИЯ» ниже, чтобы узнать о редактировании файлов только для чтения с именами Unicode.
 4) Имена файлов Unicode с суррогатными парами (кодовые точки над U + FFFF) по-прежнему вызывают проблемы.
";ES;fi;;
 5) S=M5;SC;if [[ $cur == enter ]];then R;echo "
   Как правило, ExifTool может использоваться для записи метаданных в файлы, доступные только для чтения, при условии, что у пользователя есть разрешение на запись в
 каталог. Однако есть три случая, когда также требуется разрешение на запись в файл:
 1) При использовании параметра -overwrite_original_in_place.
 2) При записи только псевдосистемных тегов (например, FileModifyDate).
 3) В Windows, если в имени файла есть символы Юникода и а) используется параметр -overwrite_original, или б) резервная копия _original уже существует.
   Скрытые файлы в Windows ведут себя как файлы только для чтения при попытке записать в файл какие-либо реальные теги - при использовании
 -overwrite_original_in_place, в противном случае запись должна быть успешной и скрытый атрибут будет удален. Но можно использовать параметр -if, чтобы избежать
 обработка скрытых файлов (при наличии Win32API :: File):
 exiftool -if "\$fileattributes !~ /Hidden/" ...
";ES;fi;;
 6) S=M6;SC;if [[ $cur == enter ]];then R;echo "
 Приложение exiftool завершает работу со статусом 0 в случае успеха,
 или 1, если произошла ошибка,
 или 2, если все файлы не прошли условие -if (для любого из команды, если использовалось -execute).
";ES;fi;;
 7) S=M7;SC;if [[ $cur == enter ]];then R;echo " Авторское право 2003-2020, Фил Харви. Это бесплатное программное обеспечение; вы можете распространять и / или изменять его на тех же условиях, что и сам Perl.";ES;fi;;
 8) S=M8;SC;if [[ $cur == enter ]];then R;echo " Image::ExifTool(3pm), Image::ExifTool::TagNames(3pm), Image::ExifTool::Shortcuts(3pm), Image::ExifTool::Shift.pl";ES;fi;;
 9) S=M9;SC;if [[ $cur == enter ]];then R;echo "
 Установка ExifTool Для «ExifTool» требуется «Perl» версии 5.004 или новее. Никакие другие библиотеки не требуются.
 Установить exiftool: sudo apt install libimage-exiftool-perl
 Удалить exiftool:    sudo apt remove libimage-exiftool-perl && sudo apt autoremove
";ES;fi;;
10) S=M10;SC;if [[ $cur == enter ]];then R;echo " Примечание: Существует множество типов метаданных и ExifTool удаляет только те метаданные с которыми умеет работать!";ES;fi;;
11) S=M11;SC;if [[ $cur == enter ]];then R;./mExiftoolOption.sh;ES;fi;;
12) S=M12;SC;if [[ $cur == enter ]];then R;./mExiftoolTagA.sh;ES;fi;;
13) S=M13;SC;if [[ $cur == enter ]];then R;./mExiftoolOtherAdvanced.sh;ES;fi;;
14) S=M14;SC;if [[ $cur == enter ]];then R;echo "
    -restore_original -delete_original[!]
    Эти параметры служебной программы автоматизируют обслуживание файлов \"_original\", созданных exiftool. Они не действуют на файлы без \"_original\" копировать.
 Параметр -restore_original восстанавливает указанные файлы из их исходных копий путем переименования файлов \"_original\" для замены отредактированных версии.
 Например, следующая команда восстанавливает оригиналы всех изображений JPG в каталоге «DIR»:
    exiftool -restore_original -ext jpg КАТАЛОГ
    Параметр -delete_original удаляет \"_original\" копии всех файлов, указанных в командной строке. Без завершающего \"!\" эта опция запрашивает подтверждение перед
 продолжением. Например, следующая команда удаляет «a.jpg_original», если он существует, после вопроса «Вы уверены?»:
    exiftool -delete_original a.jpg
    Эти параметры нельзя использовать с другими параметрами для чтения или записи значений тегов в той же команде, но их можно комбинировать с такими параметрами,
 как -ext, -if, -r, -q и -v.
";ES;fi;;
15) S=M15;SC;if [[ $cur == enter ]];then R;echo "
    \"DateFmt\"
    Упрощает переформатирование отдельных значений даты и времени. Эта функция работает со стандартным значением даты / времени в формате EXIF ​​в \$ _ и форматирует
 его в соответствии с указанная строка формата (см. параметр -d). Чтобы не пытаться переформатировать уже отформатированное значение даты / времени, к имени тега
 необходимо добавить \"#\" (как в примере ниже), если также используется опция -d. Например:
    exiftool -p '$ {createdate #; DateFmt ("% Y-% m-% d_% H% M% S")}' a.jpg

    \"ShiftTime\"
    Сдвигает строку даты / времени в формате EXIF ​​на указанную величину. Начните с ведущего знака минус, чтобы переместиться назад во времени.
 См. Image :: ExifTool :: Shift.pl для получения подробной информации о синтаксисе сдвига. Например, чтобы сдвинуть значение даты / времени назад на один год:
    exiftool -p '\$ {createdate; ShiftTime (\"- 1: 0: 0 0\")}' a.jpg

    \"NoDups\"
    Удаляет повторяющиеся элементы из списка с разделителем, указанным параметром -sep. Эта функция наиболее полезна при копировании тегов типа списка. Например,
 следующую команду можно использовать для удаления повторяющихся ключевых слов:
    exiftool -sep '##' '-keywords <\$ {keywords; NoDups}' a.jpg
 Параметр -sep необходим для разделения строки на отдельные элементы списка при записи в тег типа списка.

    Необязательный аргумент флага может быть установлен в 1, чтобы «NoDups» возвращал undef, если дубликаты не существовали, что предотвращает перезапись файла без
 надобности:
    exiftool -sep '##' '-keywords <\$ {keywords; NoDups (1)}' a.jpg
    Обратите внимание, что имена функций чувствительны к регистру.
";ES;fi;;
16) S=M16;SC;if [[ $cur == enter ]];then R;./mExiftoolRedingExemples.sh;ES;fi;;
17) S=M17;SC;if [[ $cur == enter ]];then R;./mExiftoolWritingExamples.sh;ES;fi;;
18) S=M18;SC;if [[ $cur == enter ]];then R;./mExiftoolCopyingRenaming.sh;ES;fi;;
19) S=M19;SC;if [[ $cur == enter ]];then R;./mExiftoolGeotaggingPiping.sh;ES;fi;;
20) S=M20;SC;if [[ $cur == enter ]];then R;echo "
 exiftool imagen.jpg
#
 Прочитать какой-либо отдельный тег в метаданных изображения: exiftool -ISO FOTO.JPG
";ES;fi;;
21) S=M21;SC;if [[ $cur == enter ]];then R;echo "
 Для отображения информации о GPS координатах содержащихся в фотографии в форматированном виде:
 exiftool -filename -gpslatitude -gpslongitude -T input.jpg
#
    GPS Alittude - количество метров над уровнем моря;
    GPS Latitude - географическая широта, в градусах, минутах и секундах;
    GPS Longitude - географическая долгота в градусах, минутах и секундах;
#
 отфильтровать из вывода команды только геоданные:
 exiftool video.mp4 | grep GPS
";ES;fi;;
22) S=M22;SC;if [[ $cur == enter ]];then R;echo "
 Чтобы добавить или изменить Координаты GPS к фотографии мы должны написать что-то вроде следующего:
 exiftool -exif:gpslatitude\"27 33\" -exif:gpslatituderef=S -exif:gpslongitude=\"165 130\" -exif:gpslongituderef=E fotografia.jpg
";ES;fi;;
23) S=M23;SC;if [[ $cur == enter ]];then R;echo "
 Параметр -TagsFromFile копирует все теги из указанного файла в файл, указанный в качестве последнего аргумента. Например:
 exiftool -TagsFromFile sourcefile.jpg resultfile.jpg
";ES;fi;;
24) S=M24;SC;if [[ $cur == enter ]];then R;echo "
 -x - исключить указанные теги данных;
 -b - выводить данные в двоичном формате;
 -с - установить формат вывода GPS координат;
 -d - установить формат для даты и времени;
 -h     выводить данные, отформатированные в HTML:                exiftool -h video.mp4 > data.html
 -j - выводить информацию в формате JSON;
 -X - выводить информацию в формате XML;
 -o - вывести данные в указанный файл;
 -P - сохранить атрибуты даты модификации файла;
 -s     вывести имена тегов вместо их описаний:                   exiftool -s video.mp4
 -G     Посмотреть в какой группе находится каждый выводимый тег: exiftool -G video.mp4
 -list  вывести список всех доступных тегов:                      exiftool -list
        Вывести все теги группы можно с помощью той же опции -list или -listw только дополнительно надо указать имя группы и приставку :all.
        Например, для группы Composite:                           exiftool -list -Composite:all
 -listw вывести список всех тегов, которые можно редактировать:   exiftool -listw FOTO.JPG
 -listg Вывести все доступные группы тегов:                       exiftool -listg
 -lang - установить язык.
";ES;fi;;
25) S=M25;SC;if [[ $cur == enter ]];then R;echo " man exiftool";ES;fi;;
26) S=M26;SC;if [[ $cur == enter ]];then R;echo " exiftool -lang ru video.mp4";ES;fi;;
27) S=M27;SC;if [[ $cur == enter ]];then R;echo " exiftool -lang";ES;fi;;
28) S=M28;SC;if [[ $cur == enter ]];then R;echo "
 Чтобы изменить значение тега, надо передать его в виде опции, а после знака равно передать его значение. Например добавим параметр GPSSpeed:
 exiftool -GPSSpeed=2 video.mp4
#
 По умолчанию новые метаданные записываются в новый файл с таким же именем, а старая версия сохраняется в файле с приставкой _original.
 Чтобы этот файл не создавался надо использовать опцию -overwrite_original:
 exiftool -overwrite_original -GPSSpeed=2 video.mp4
";ES;fi;;
29) S=M29;SC;if [[ $cur == enter ]];then R;echo "
 Для того чтобы затереть значение параметра надо передать ему пустое значение. Например:
 exiftool -GPSSpeed= video.mp4
#
 Для того чтобы удалить вообще все метаданные используйте модификатор all и присвойте ему пустое значение:
 exiftool -all= video.mp4
#
 удалить метаданные из всех файлов в папке:
 exiftool -all= *.mp4
";ES;fi;;
30) S=M30;SC;if [[ $cur == enter ]];then R;echo "
   чтобы один или несколько одинаковых тегов нужно записать или удалить во множестве изображений. Ниже команда запишет значение ISO во все файлы с расширением jpg в
 текущей папке. Символ * в имени файла — шаблон для любого имени:
 exiftool -ISO='200' *.JPG
#
   При редактировании тегов утилита создаёт рядом с новым файлом файл-оригинал с суффиксом \"_original\". Если этого не требуется, нужно использовать дополнительную
 опцию -overwrite_original:
 exiftool -ISO='200' -overwrite_original *.JPG
#
   Примечание: если же эту опцию забыли написать и ExifTool создал много архивных копий с суффиксом \"_original\", то удалить эти копии можно выполнив в консоли для
 систем Linux в текущем каталоге несложный одно-строчный скрипт:
 for f in *_original ; do rm \$f; done
";ES;fi;;
31) S=M31;SC;if [[ $cur == enter ]];then R;echo "
    Make             — производитель камеры
    Model            — модель камеры
    DateTime         — дата последнего изменения изображения
    ExposureTime     — выдержка
    FNumber          — число диафрагмы
    ISO              — светочувствительность
    DateTimeOriginal — время съемки
    FocalLength      — фокусное расстояние объектива на камере
    Artist           — автор
    Copyright        — копирайт
    UserComment      — комментарии пользователя к файлу
";ES;fi;;
#
32) S=M32;SC;if [[ $cur == enter ]];then R;echo "
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 https://gitlab.com/GrannikOleg/mexiftool
 https://github.com/GrannikOleg/mExiftool
 https://notabug.org/Grannikoleg/mExiftool
 https://sourceforge.net/p/mexiftool/git/ci/master/tree/
 https://bitbucket.org/grannikoleg/mexiftool/src/master/
 https://framagit.org/GrannikOleg/mexiftool
 --------+----------------------------------------------
 Grannik | 2021.01.05
 ~~~~~~~~+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
";ES;fi;;
33) S=M33;SC;if [[ $cur == enter ]];then R;clear;ls -l;exit 0;fi;;
 esac;POS;done
