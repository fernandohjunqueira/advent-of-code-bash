#!/usr/bin/env bash

d1p2() {
  local CURRENT
  local MAX
  local TOTAL

  MAX=(0 0 0)

  while read -r line; do
    if [[ -n "$line" ]]; then
      CURRENT=$((CURRENT + line))
    else
      for i in "${!MAX[@]}"; do
        if [[ "$CURRENT" -gt "${MAX[$i]}" ]]; then
          MAX=("${MAX[@]:0:$i}" "$CURRENT" "${MAX[@]:$i}")
          break
        fi
      done
      MAX=("${MAX[@]:0:3}")
      CURRENT=0
    fi
  done < "$1"

  for n in "${MAX[@]}"; do
    TOTAL=$((TOTAL + n))
  done

  echo "$TOTAL"
}

d1p2 "$1" 
