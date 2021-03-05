style=${QUERY_STRING##*style=}
if [[ "${style}" = "${QUERY_STRING}" ]] ; then
  style="simplified"
else
  style=${style%%&*}
fi
cat <<EOM
HTTP/1.0 200 OK
Content-Type: application/json

EOM
echo "["
if [[ "${style}" != "" ]] ; then
  style = "simplified"
fi

comma=""
for x in *.${style}.json ; do 
  echo "${comma}\"${x}\""
  comma=","
done
echo "]"