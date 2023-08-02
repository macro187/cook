. $cook/lib/sh.sh


default_hotbox="${default_hotbox:?default_hotbox not specified}"
custom_hotbox_patterns="${custom_hotbox_patterns:?custom_hotbox_patterns not specified}"
action="${action:?action not specified}"


hostdir="$(pwd)"
hostdirname="${hostdir##*/}"
parentdir="$(cd $hostdir/.. && pwd)"


for pattern in $custom_hotbox_patterns ; do
    custom_hotbox="$($cook/lib/find-files .cook "${pattern}.spec.sh" | sort | head -n 1)"
    custom_hotbox="${custom_hotbox%.spec.sh}"
    if [ -n "$custom_hotbox" ] ; then
        break
    fi
done


hotbox="${custom_hotbox:-$default_hotbox}"


heading "Running $action in $hotbox hotbox"
echo_on
hotbox \
    --source $cook/hotbox \
    --source .cook \
    --volume $cook:/cook \
    --volume $parentdir:/workspace \
    --workdir /workspace/$hostdirname \
    $hotbox \
    $hostdirname-$action \
    -- \
    /cook/actions/$action
echo_off
