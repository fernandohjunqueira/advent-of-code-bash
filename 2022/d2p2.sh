#!/usr/bin/env bash

d2p2() {
  local FIRST
  local SECOND
  local TOTAL
  local CHOICE

  TOTAL=0

  declare -A SCORE=(
    [A]=1
    [B]=2
    [C]=3
    [X]=0
    [Y]=3
    [Z]=6
  )

  declare -A DEFEATED_BY=(
    [A]=B
    [B]=C
    [C]=A
  )

  while read -r FIRST SECOND; do
    TOTAL=$((TOTAL + "${SCORE["$SECOND"]}"))
    if [[ "$SECOND" == "Y" ]]; then
      TOTAL=$((TOTAL + "${SCORE["$FIRST"]}"))
    elif [[ "$SECOND" == "Z" ]]; then
      CHOICE=${DEFEATED_BY[$FIRST]}
      TOTAL=$((TOTAL + "${SCORE["$CHOICE"]}"))
    else
      CHOICE=${DEFEATED_BY[$FIRST]}
      TOTAL=$((TOTAL + "${SCORE["${DEFEATED_BY[$CHOICE]}"]}"))
    fi
  done < "$1"

  echo "$TOTAL"
}

d2p2 "$1" 
