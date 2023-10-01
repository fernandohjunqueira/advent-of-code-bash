#!/usr/bin/env bash

d2p1() {
  local FIRST
  local SECOND
  local TOTAL

  TOTAL=0

  declare -A SCORE=(
    [A]=1
    [X]=1
    [B]=2
    [Y]=2
    [C]=3
    [Z]=3
  )

  declare -A DEFEATED_BY=(
    [A]=Y
    [B]=Z
    [C]=X
  )

  while read -r FIRST SECOND; do
    TOTAL=$((TOTAL + "${SCORE["$SECOND"]}"))
    if [[ "${SCORE["$FIRST"]}" -eq "${SCORE["$SECOND"]}" ]]; then
      TOTAL=$((TOTAL + 3))
    elif [[ "${DEFEATED_BY["$FIRST"]}" == "$SECOND" ]]; then
      TOTAL=$((TOTAL + 6))
    fi
  done < "$1"

  echo "$TOTAL"
}

d2p1 "$1" 
