. $cook/lib/sh.sh


hotbox="${hotbox:?hotbox not specified}"
action="${action:?action not specified}"


hostdir="$(pwd)"
hostdirname="${hostdir##*/}"


heading "Running $action in hotbox container"
echo_on
hotbox \
    $hotbox $action-$hostdirname \
    -- \
    /cook/actions/$action
echo_off
