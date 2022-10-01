MODDIR=${0%/*}
find /sys/*/* -name "input_suspend" -o -name "*disable*_charge*" -o -name "*charge*_disable*" -o -name "*disable*_charging*" -o -name "*stop_charge*" -o -name "*stop_charging*" | egrep -i -v 'limit|max|float|step|reverse' | sed -n 's/$/,start=0,stop=1/g;p' > "$MODDIR/list_switch"
find /sys/*/* -name "*charging_enable*" -o -name "*Charging_Enable*" -o -name "*enable*_charge*" -o -name "*charge*_enable*" -o -name "*enable*_charging*" -o -name "*charge*_control*" -o -name "*charging*_state*" | egrep -i -v 'limit|prohibit|prevent|disable|stop|restrict|reverse|max|float|step' | sed -n 's/$/,start=1,stop=0/g;p' >> "$MODDIR/list_switch"
find /sys/*/* -name "*charging_enable*" -o -name "*Charging_Enable*" -o -name "*enable*_charge*" -o -name "*charge*_enable*" -o -name "*enable*_charging*" -o -name "*charge*_control*" | egrep -i 'prohibit|prevent|disable|stop|restrict' | egrep -i -v 'limit|max|float|step|reverse' | sed -n 's/$/,start=0,stop=1/g;p' >> "$MODDIR/list_switch"
# ##
