#!/bin/sh

DaySuffix() {
    case `date +%d` in
          01|21|31) echo "st";;
          02|22)    echo "nd";;
          03|23)    echo "rd";;
          *)        echo "th";;
    esac
}

while true; do
  xsetroot -name "$(date '+%A, %B %d, %Y  %H:%M')"
	sleep 10
done

