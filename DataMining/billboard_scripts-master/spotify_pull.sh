#!/bin/sh

INPUTFILE="test_python_songs_output.csv"
OUTFILENAME="mini_spotify_data.json"

TOKEN="secret token"
X=0
touch $OUTFILENAME

for line in `cat "$INPUTFILE"`; do
  if [ -z "$line" ]; then
    continue;
  fi
  curl -X GET "https://api.spotify.com/v1/tracks/$line" -H "Accept: application/json" -H "Authorization: Bearer $TOKEN" >> $OUTFILENAME
  X=`expr $X + 1`
  echo $X
done
