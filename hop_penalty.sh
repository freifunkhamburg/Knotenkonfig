# No uci support for hop penalty after Gluon v2019.1.2
INTERFACE="bat0"
PENALTY="5"
CURRENT=$(cat /sys/class/net/$INTERFACE/mesh/hop_penalty)
if [ "$PENALTY" != "$CURRENT" ]; then
    echo $PENALTY > /sys/class/net/$INTERFACE/mesh/hop_penalty
    uci set batman-adv.$INTERFACE.hop_penalty=$PENALTY
    uci commit batman-adv
fi
