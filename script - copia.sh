# Escriba su código aquí
# agrega el "0" al día
# cambia "/" por "-"
tr '/' '-' <data.csv > data-1.csv
#le pone un 0 al día y mes
sed 's/\([0-9]\)-\([0-9]\)-/0\1-0\2-/' data-1.csv > data-2.csv
sed 's/-\([0-9][0-9];\)/-20\1/' data-2.csv > data-3.csv
sed 's/a/A/g' data-3.csv > data-4.csv
sed 's/b/B/g' data-4.csv > data-5.csv
sed 's/c/C/g' data-5.csv > data-6.csv
sed 's/n/N/g' data-6.csv > data-6-1.csv
# cambia "N" por "\N"
sed 's/;N/;\\N/g' data-6-1.csv > data-7.csv
# rellena los "" por "\N"
sed 's/;;/;\\N;/g' data-7.csv > data-8.csv
# agrega el "20" al año, ej. 2013
sed 's/-\([0-9][0-9];\)/-20\1/' data-8.csv > data-9.csv
# cambia DD/MM/AAAA por AAA\MM\DD
sed 's/\([0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\);/\3-\2-\1;/' data-9.csv > data-10.csv
# cambia ";" por ","
sed 's/;/,/g' data-10.csv > data-11.csv
# revisa que los números con decimales sean con "." y no con ","
sed 's/,\([0-9][0-9][0-9]\),/,\1./' data-11.csv > data-12.csv
# rellena los campos vacíos a la derecha con "\N"
sed 's/[,]$/,\\N/g' data-12.csv > Final.csv
rm ./data-*.csv
cat	Final.csv
# elimina las columnas que contengan \N
#sed -e '/\N/d' data13.csv > data14.csv

