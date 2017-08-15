#!/bin/bash
#
##timeset- A script-utility to configure the system date and time on Manjaro/Arch Linux(or any Linux distribution that uses systemd)
##Author- Aaditya Bagga
#

ROOT_UID=0     # Only users with $UID 0 have root privileges.
E_NOTROOT=87   # Non-root exit error.

# Run as root, of course.
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi 

#
#Menu
#
while :
 do
    clear
    echo "------------------------------------------------------------------------------"
    echo " TimeSet(tings) - Configure the System Date and Time "
    echo "------------------------------------------------------------------------------"
    echo ""
    echo "[1]  Show Current Date and Time Configuration"
    echo "[2]  Show Known Timezones (press q to return to menu)"
    echo "[3]  Set System Timezone"
    echo "[4]  Synchronize Time from the Network (NTP)"
    echo "[5]  Control whether NTP is used or not"	
    echo "[6]  Enable NTP at Startup"
    echo "[7]  Disable NTP at Startup"
    echo "[8]  Control whether Hardware Clock is in Local Time or not"
    echo "[9]  Read the time from the Hardware Clock"
    echo "[10] Synchronize Hardware Clock to System Time"
    echo "[11] Synchronize System Time from Hardware Clock"
    echo "[12] Set System Time manually"
    echo ""
    echo "[q]  Exit/Quit"
    echo "==========================================================="
    echo -n "Enter your choice [1-12,q]: "
    read choice
    case $choice in
      1) echo "Current Date and Time"; timedatectl status; echo "Press a key. . ."; read;;
      2) echo "TimeZones";timedatectl list-timezones ;;
      3) echo -n "Enter the TimeZone (it should be like Continent/City): " ; read tz ; timedatectl set-timezone $tz ;echo "Press a key. . ."; read ;;
      4) echo -e "Synchronizing time from the Network. \nNTP should be installed for this to work."; printf "Please wait a few moments while the time is being synchronised..\n"; sudo ntpdate -u pool.ntp.org; echo "Press a key. . ."; read ;;
      5) echo -n "Enter 1 to enable NTP and 0 to disable NTP : "; read ntch; timedatectl set-ntp $ntch; echo "Press a key. . ."; read ;;
      6) sudo systemctl enable ntpd; echo "Press a key. . ."; read ;;     
      7) sudo systemctl disable ntpd; echo "Press a key. . ."; read ;;
      8) echo -n "Enter 0 to set Hardware clock to UTC and 1 to set it to Local time : "; read rtcch; timedatectl set-local-rtc $rtcch; echo "Press a key. . ."; read ;;
      9) sudo hwclock -D ; echo "Press a key. . ."; read ;;
      10) sudo hwclock -w ; echo "Press a key. . ."; read ;;
      11) sudo hwclock -s ; echo "Press a key. . ."; read ;;
      12) echo -ne "Enter the time.\nThe time may be specified in the format 2012-10-30 18:17:16 . \nOnly hh:mm can also be used. \nEnter time: "; read time; timedatectl set-time $time; echo "Press a key. . ."; read ;;
      q) printf "Thanks for using this script!\n"; exit 0 ;;
      *) echo "Opps!!! Please a valid choice!";#!/bin/bash
         echo "Press a key. . ." ; read ;;
 esac
done
exit 0
