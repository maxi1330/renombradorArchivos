#!/bin/bash

buscar=$1
reemplazar=$2
separador=$3

for archivo in *; do
  if [[ -f "$archivo" && "./$archivo" != "$0" ]]; then\
    IFS="$separador" read -ra partes <<< "$archivo"
    nuevo_nombre=""
    for parte in "${partes[@]}"; do
      if [[ "$parte" == "$buscar" ]]; then
        nuevo_nombre+="$reemplazar"
      else
        nuevo_nombre+="$parte"
      fi
      nuevo_nombre+="$separador"
    done
    nuevo_nombre="${nuevo_nombre%$separador}"
    mv "$archivo" "$nuevo_nombre"
    echo ${archivo}  reemplazado por ${nuevo_nombre}
  fi
done
