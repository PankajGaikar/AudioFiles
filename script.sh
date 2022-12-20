#!/bin/sh

#  script.sh
#  
#
#  Created by Pankaj Gaikar on 20/12/22.
#  

for fileName in *; do
    echo "put $fileName"
        ffmpeg -y -i "$fileName" -c:a aac -b:a 128k -muxdelay 0 -f segment -sc_threshold 0 -segment_time 7 -segment_list "$fileName.m3u8" -segment_format mpegts "$fileName%d.m4a"
done
