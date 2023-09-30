#!/usr/bin/env bash

d1p1() {
  local CURRENT
  local MAX

  CURRENT=0
  MAX=0

  while read -r line; do
    if [[ -n "$line" ]]; then
      CURRENT=$((CURRENT + line))
    else
      if [[ "$CURRENT" -gt "$MAX" ]]; then
        MAX=${CURRENT}
      fi
      CURRENT=0
    fi
  done < "$1"

  echo "$MAX"
}

d1p1 "$1" 
