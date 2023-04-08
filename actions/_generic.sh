. $cook/lib/sh.sh


action="${0##*/}"


type="$($cook/lib/detect-type)"
if [ -z "$type" ] ; then
    info "Unrecognised project, not doing anything"
    exit 0
fi


if ! [ -f $cook/actions/$action-$type ] ; then
    info "Don't know how to $action $type projects, not doing anything"
    exit 0
fi


$cook/actions/$action-$type
