usage() { echo "use -m Message  or default is -m UpdateFile"; exit 0;}

while getopts "hm:" o; do
    case ${o} in
        h)
            echo "Help Message";
            usage
            ;;
        m)
            m=${OPTARG};
            echo "Message = ${m}"
            ;;
        *)
            m="UpdateFile";
            echo "Default value: UpdateFile"
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${m}" ]; then
    m="UpdateFile";
fi

echo "Message = ${m}"




git fetch
git add .
git commit -m "${m}"
git push 