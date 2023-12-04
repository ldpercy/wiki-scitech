
# Start spice-vdagent for virt-manager guests


Conditionally start up spice-vdagent and daemon.

Necessary for getting window resizing and shared clipboard working for linux guests in virt-manager.

Add this to .profile:

    svda_running=$(pgrep --count '[s]pice-vdagentd')
    if [ "$svda_running" -eq 0 ]; then
        echo "spice-vdagentd not running; starting now..."
        service spice-vdagent start
        spice-vdagent
    else
        echo "spice-vdagentd already running"
    fi


Without the conditional VSCode tries to rerun this on startup, which prompts authentication, or this error if you take too long:

"Unable to resolve your shell environment in a reasonable time"

N.B. This was for a Kubuntu guest - ymmv