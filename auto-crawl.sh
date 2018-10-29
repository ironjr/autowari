!/bin/bash

dir_path="/mnt/c/Users/USER/Desktop/himawari"

prev_hash_vi=0
prev_hash_ir=0
while [ true ]
do
    echo "Downloading visible light image ..."
    file_path="$dir_path/vi/$(date +'%y%m%d_%H%M%S').jpg"
    himawari -z 5 -o $file_path

    new_hash=$(sha256sum -b $file_path | awk '{print $1;}')
    if [ "$prev_hash_vi" == "$new_hash" ]
    then
        rm $file_path
    else
        prev_hash_vi="$new_hash"
    fi

    echo "Downloading infrared light image ..."
    file_path="$dir_path/ir/$(date +'%y%m%d_%H%M%S').jpg"
    himawari -i -z 3 -o $file_path

    new_hash=$(sha256sum -b $file_path | awk '{print $1;}')
    if [ "$prev_hash_ir" == "$new_hash" ]
    then
        rm $file_path
    else
        prev_hash_ir="$new_hash"
    fi
done
