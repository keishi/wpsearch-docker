ID=iguana
WP_PORT=8081
JP_PORT=8888
DIR="$(pwd)/home/$ID"
if [ -d "$DIRECTORY" ]; then
    mkdir $DIR
    cp -r ../wpsearch $DIR/wpsearch
    sudo chown -R 1000:100 $DIR
fi
sudo docker run -it --rm -m 30G -p $WP_PORT:8081 -p $JP_PORT:8888 -v $DIR:/home/jovyan wpsearch-img
