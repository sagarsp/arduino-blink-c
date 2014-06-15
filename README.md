arduino-blink-c
===================================
Program Arduino using C.
===================================
Author  : Sagar Patel
Mail    : sagarpatel.9556@gmail.com
===================================

Follow the steps.

(1) Install Arduino environment by typing following command in shell.
      sudo apt-get update && sudo apt-get install arduino arduino-core  

    Once you have arduino, you can program your arduino with JAVA coding style inside Arduino IDE. But for programming it with C, you need to install other tools.

(2) Install gcc-avr, binutils-avr, gbd-avr, avr-libc and avrdude using following command.
      sudo apt-get install gcc-avr binutils-avr gdb-avr avr-libc avrdude
      
(3) When the installation finishes, open the file blink.c in any text editor.
    - You can find _BV used for accessing PORTB, which is MACRO defined in the headers located at "/usr/lib/avr/include/avr/iom328p.h" and “/usr/lib/avr/include/avr/sfr_defs.h”.
    - Delay function is defined in utils/delay.h.
    - All other things are self explainable.
  
(4) Now its time to compile source code into object file and convert that into executable file, which will be finally provided in HEX. 
    - To compile this source file into object file, use the following command.
        avr-gcc -Os -DF_APU=16000000UL -mmcu=atmega328p -c -o blink.o blink.c
    
    - Convert this object file into executable file using following command.
        avr-gcc -mmcu=atmega328p blink.o -o blink
        
    - Generate HEX file using following command.
        avr-objcopy -O ihex -R .eeprom blink blink.hex
        
    - Finally, dump this HEX file into Arduino connected at /dev/ttyACM0 port.
        sudo avrdude -F -V -c arduino -p ATMEGA328p -P /dev/ttyACM0 -b 115200 -U flash:w:blink.hex
    
    The shell script "code_upload.sh" contains all the commands from step 4. Use it like followed to do step 4 in single command.
      ./code_upload.sh  blink.c   /dev/ttyACM0  115200
    
    The shell file format is followed.
      ./code_upload.sh  <program_path>  <port>  <baud_rate>

Use the datasheet of ATMega328p to explore more.
For any query send an email to author.
