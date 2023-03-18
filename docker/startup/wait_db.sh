# bin/sh

cmd="$*"
>&2 echo "--------------"
>&2 echo "$cmd"
>&2 echo "--------------"
>&2 echo

>&2 echo -e 'Waiting Postresql...\n'

sh -c "$cmd"
