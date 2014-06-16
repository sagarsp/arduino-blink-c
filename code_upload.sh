c_ext=".c"
if [[ "$1" =~ "$c_ext" ]]
then
    program_name="${1//$c_ext/}"
else
    program_name=$1;
fi

echo "####################################################"
echo "Making object file"
echo "####################################################"
avr-gcc -Os -DF_APU=16000000UL -mmcu=atmega328p -c -o ${program_name}.o ${program_name}.c

echo "####################################################"
echo "Making executable file"
echo "####################################################"
avr-gcc -mmcu=atmega328p ${program_name}.o -o ${program_name}

echo "####################################################"
echo "Making HEX file"
echo "####################################################"
avr-objcopy -O ihex -R .eeprom ${program_name} ${program_name}.hex

echo "####################################################"
echo "Dumping the file at given port"
echo "####################################################"
sudo avrdude -F -V -c arduino -p ATMEGA328p -P ${2} -b ${3} -U flash:w:${program_name}.hex

echo "####################################################"
echo "Finished : "
echo "####################################################"
sleep 1
