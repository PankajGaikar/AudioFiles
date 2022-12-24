#!/bin/sh

#  script.sh
#  
#
#  Created by Pankaj Gaikar on 20/12/22.
#  

for fileName in *; do
    if [[ $fileName =~ .*\.(wav$) ]]; then
        echo "The extension of '$fileName' matches .wav";
        ffmpeg -y -i "$fileName" -c:a libmp3lame -q:a 0 -map 0:0 -f segment -segment_time 10 -segment_list segments.m3u8 -segment_format mpegts "$fileName%d.m4a"
    fi
done
