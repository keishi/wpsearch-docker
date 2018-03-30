die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 3 ] || die "3 arguments required, $# provided"
echo $2 | grep -E -q '^[0-9]+$' || die "Numeric argument required, $2 provided"
echo $3 | grep -E -q '^[0-9]+$' || die "Numeric argument required, $3 provided"

ID=$1
WP_PORT=$2
JP_PORT=$3

DIR="$(pwd)/home/$ID"
if [ ! -d "$DIRECTORY" ]; then
    mkdir -p $DIR/work
    cp -r ../wpsearch $DIR/work/wpsearch
    sudo chown -R 1000:100 $DIR
fi

sudo docker run -it --rm -m 30G --name="wp-$ID" -e WPSEARCH_PORT=$WP_PORT -p $WP_PORT:$WP_PORT -p $JP_PORT:8888 -v $DIR:/home/jovyan wpsearch-img start-notebook.sh --NotebookApp.token=''
