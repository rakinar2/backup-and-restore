#!/bin/bash

banner(){
  echo -e "\e[33m";
  echo "  ===================================";
  echo -e "\e[0m";
  echo -e "\e[1m\e[36m";
                                             
  echo "  #####    ##    ####  #    # #    # #####  ";
  echo "  #    #  #  #  #    # #   #  #    # #    # ";
  echo "  #####  #    # #      ####   #    # #    # ";
  echo "  #    # ###### #      #  #   #    # #####  ";
  echo "  #    # #    # #    # #   #  #    # #      ";
  echo "  #####  #    #  ####  #    #  ####  #      ";
                            
  echo -e "\e[0m";
  printf "  -----------Developed by: Rakin-----------\n";
  printf "  GitHub Page: https://github.com/rakinar2/\n";
  echo -e "\e[33m";
  echo "  ===================================";
  echo -e "\e[0m";
}

check_programs(){
     command -v tar > /dev/null 2>&1 || {
       echo -e "\e[1m E: tar binaries are not found or permission denied.\n Can't start Tools\e[0m";
       install_programs;
       exit 1;
     };
     command -v lz4 > /dev/null 2>&1 || {
       echo -e "\e[1m E: lz4 binaries are not found or permission denied.\n Can't start Tools\e[0m";
       install_programs
       exit 1;
     };
     command -v gzip > /dev/null 2>&1 || {
       echo -e "\e[1m E: gzip binaries are not found or permission denied.\n Can't start Tools\e[0m";
       install_programs;
       exit 1;
     };
     command -v nano > /dev/null 2>&1 || {
       echo -e "\e[1m E: the package nano is not found or permission denied.\n Can't start Tools\e[0m";
       install_programs;
       exit 1;
     };
}
check_programs_2(){
  command -v > php /dev/null 2>&1 || {
       echo -e "\e[1m\e[31m E: php server is not Installed or permission denied.\n Can't start Advanced Tools\e[0m";
       install_programs;
       exit 1;
     };
     command -v > ngrock /dev/null 2>&1 || {
       echo -e "\e[1m\e[31m E: ngrock server is not Installed or permission denied.\n Can't start Advanced Tools\e[0m";
       install_programs;
       exit 1;
     };
     command -v > vim /dev/null 2>&1 || {
       echo -e "\e[1m\e[31m E: vim text editor is not Installed or permission denied.\n Can't start Advanced Tools\e[0m";
       install_programs;
       exit 1;
     };
     command -v > apache2 /dev/null 2>&1 || {
       echo -e "\e[1m\e[31m E: apache2 server is not Installed or permission denied.\n Can't start Advanced Tools\e[0m";
       install_programs;
       exit 1;
     };
     command -v > python /dev/null 2>&1 || {
       echo -e "\e[1m\e[31m E: the package python is not Installed or permission denied.\n Can't start Advanced Tools\e[0m";
       install_programs;
       exit 1;
     };
     command -v > python2 /dev/null 2>&1 || {
       echo -e "\e[1m\e[31m E: the package python2 is not Installed or permission denied.\n Can't start Advanced Tools\e[0m";
       install_programs;
       exit 1;
     };
     command -v > xz /dev/null 2>&1 || {
       echo -e "\e[1m\e[31m E: xz binaries are not found or permission denied.\n Can't start Advanced Tools\e[0m";
       install_programs;
       exit 1;
     };
     
}
check_root(){
     command -v > su /dev/null 2>&1 || {
       echo -e "\e[1m\e[31m E: Sorry! The device has no root permission.\e[0m";
       install_programs;
       exit 1;
     };
     command -v > busybox /dev/null 2>&1 || {
       echo -e "\e[1m\e[31m E: Sorry! The device has no busybox binary.\e[0m";
       install_programs;
       exit 1;
     };
}
install_programs(){
       echo -e "\e[36m Do you want to install it?[Y/n]";
       echo -e "\e[1m\e[5m"
       read -p "u01_root@localhost ~> " input_pkg;
       echo -e "\e[0m";
       if [[ $input_pkg == "y" || $input_pkg == "Y" ]];
       then
          {
            ( command pkg install tar  || echo -e "\e[31m E: Error while installing tar. \e[0m" );
            ( command pkg install gzip || echo -e "\e[31m E: Error while installing gzip. \e[0m" );
            ( command pkg install lz4  || echo -e "\e[31m E: Error while installing lz4. \e[0m" );
            ( command apt install nano || echo -e "\e[31m E: Error while installing package nano. \e[0m" );
            echo -e "\e[1m\e[32m [*] Inner shell Installation started...\e[0m"
            progress_2;
          }
       else
       echo "Installation Aborted.";
       fi
}
install_programs_2(){
     echo -e "\e[1m\e[32m";
     read -p "Do you want to install all packages needed for Advanced Tools?[Y/n] " new_inp;
     echo -e "\e[0m";
     if [[ $new_inp == "y" || $new_inp == "Y" ]];
     then
       
     {
       command pkg install php;
       command pkg install ngrock;
       command pkg install vim;
       command pkg install apache2;
       command pkg install python;
       command pkg install python2;
       command pkg install xz;
       echo -e "\e[32m\e[1m [*] Inner Installation started...\e[0m";
       progress_2;
     } || {
       echo -e "\e[31m E: Error while installing Advanced programs.\e[0m";
     }
    
     else
       echo "Installation Aborted.";
     fi
}
md5_gen(){
  command touch md5sum.log;
  ( command md5sum backup.tar > md5sum.log ) || ( command md5sum backup.tar.gz > md5sum.log ) || ( command md5sum backup.tar.lz4  ) || {
    echo "E: no backup file found.";
  };
}

sha1_gen(){
  command touch sha1sum.log;
  ( command sha1sum backup.tar > sha1sum.log ) || ( command sha1sum backup.tar.gz > sha1sum.log ) || ( command sha1sum backup.tar.lz4 > sha1sum.log ) || {
     echo "E: no backup file found.";
  };
}



menu_controll_1(){
  echo -e "\e[1m\e[36m   Menu: \e[0m";
  echo -e "\e[32m\e[1m   [1] \e[0mBackup data";
  echo -e "\e[32m\e[1m   [2] \e[0mRestore a data";
  echo -e "\e[32m\e[1m   [3] \e[0mAdvanced";
  echo -e "\e[32m\e[1m   [4] \e[0mSettings";
  echo -e "\e[32m\e[1m   [x] \e[0mExit";
  echo -e "\e[32m\e[1m";
  read -p "u01_root@localhost ~> " num_1;
  echo -e "\e[0m";
  case $num_1 in
    "1" )
    check_programs;
    echo -e "\e[32m Select A Folder to backup\e[0m";
    command ls;
    echo -e "\e[36mEnter folder name first, then select backup type[tar/tar.gz/tar.lz4]\e[0m";
    read -a file_dir_1;
    case ${file_dir_1[1]} in
      "tar" )
       echo -e "\e[36m Enter Y/y to add file, enter N/n to avoid file.\e[0m";
       command  tar -cw -f backup.tar ./${file_dir_1[0]}/* || {
       echo " E: Error creating backup.tar!";
       };
    sleep 0.7;
    echo -e "\e[32m\e[1m";
    echo " [*] Generating md5 sum...";
    sleep 1;
    md5_gen;
    echo " [*] Generating sha1 sum...";
    sleep 1.5;
    sha1_gen;
    echo -e "\e[0m";
    progress;
    echo -e "\e[32m [*] Successfully created backup.tar!          \e[0m"
      
        ;;
       "tar.gz" )
       echo -e "\e[36m Enter Y/y to add file, enter N/n to avoid file.\e[0m";
       command tar -czw -f backup.tar.gz ./${file_dir_1[0]}/* || {
       echo " E: Error creating backup.tar.gz!";
       };
    sleep 0.7;
    
    echo -e "\e[32m\e[1m";
    echo " [*] Generating md5 sum...";
    sleep 1;
    md5_gen;
    echo " [*] Generating sha1 sum...";
    sleep 1.5;
    sha1_gen;
    echo -e "\e[0m";
    progress;
    echo -e "\e[32m [*] Successfully created backup.tar.gz!      \e[0m"
      
        ;;
        
        
        "tar.lz4" )
        
    { 
    command  tar cf - ${file_dir_1[0]} | lz4 -v > backup.tar.lz4;
    } && {
     sleep 0.7;
     
    echo -e "\e[32m\e[1m";
    echo " [*] Generating md5 sum...";
    sleep 1;
    md5_gen;
    echo " [*] Generating sha1 sum...";
    sleep 1.5;
    sha1_gen;
    echo -e "\e[0m";
     progress;
     echo -e "\e[1m\e[32m [*] Successfully created backup.tar.lz4! \e[0m      \r";
     
     } || {
       echo " E: Error creating backup.tar.lz4!";
     }; 
        
        ;;
    esac
    
    
    ;;
    "2" )
      check_programs;
      echo -e "\e[36m To Restore or extract files in backup, press Y/y to extract it or press N/n to avoid it.\e[0m";
      echo "Searching backup file...";
      echo -e "\e[32m\e[1m";
      echo " [*] Backup file found!";
      echo " [*] Matching md5 sum...";
      sleep 2;
 cmdcat=command cat md5sum.log;
 cmdtar=command md5sum backup.tar;
 cmdtgz=command md5sum backup.tar.gz;
 cmdtlz4=command md5sum backup.tar.lz4;
 if [[ $cmdtar == $cmdcat || $cmdtgz = $cmdcat || $cmdtlz4 = $cmdcat ]];
 then
   echo -ne "...\r";
 fi
            
      echo " [*] Matching sha1 sum...";
      sleep 1.3;
      cmdcata=command cat sha1sum.log;
cmdtara=command sha1sum backup.tar;
cmdtgza=command sha1sum backup.tar.gz;
cmdtlz4a=command sha1sum backup.tar.lz4;
if [[ $cmdtara == $cmdcata || $cmdtgza = $cmdcata || $cmdtlz4a = $cmdcata ]];
then
  echo -ne "...\r";
fi

      echo " [*] Restoring...";
      echo -e "\e[0m";
     { 
      ( command tar -xwvf backup.tar ) || ( command tar -xzwvf backup.tar.gz ) || ( ( command lz4 -d backup.tar.lz4 ) && ( tar -xwvf backup.tar ) );   
       echo -e "\e[32m [*] Restore Success! \e[0m";
     } || {
        echo -e "\e[33m W: Force extraction of unknown files such not as backup file.\e[0m";
        echo -e "\e[31m E: No backup file found in currant directory. \e[0m";
      };
    ;;
    "3" )
      check_programs_2;
      echo -e "\e[32m [1]\e[0m\e[32m Check Root\e[0m";
      echo -e "\e[32m [2]\e[0m\e[32m More\e[0m";
      echo -e "\e[32m [x]\e[0m\e[32m Exit\e[0m";
      read -p "u01_root@localhost ~> " choosen;
      case $choosen in
        "1" )
          check_root;
          ;;
        "2" )
        echo "Comming Soon.";
        ;;
          "x" )
         echo -e "\e[32m Stopping...\e[0m";
         sleep 1;
         exit 1;
           ;;
      esac
    ;;
    "4" )
    echo -en "E: Settings require root permission.\n";
    echo "I: To Check and grant it, restart this program again and go to Advanced > Check Root.";
    ;;
    "x" )
    echo -e "\e[32m Stopping...\e[0m";
    sleep 1;
    exit 1;
    ;;
  esac
}



progress_2(){
  echo -ne "\e[30m\r";
echo -ne '\e[42m Installing \e[0m \e[33m[#.................   (0%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[##................   (5%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[###...............   (11%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[####..............   (13%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[#####.............   (18%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[#####.............   (24%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[######............   (29%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[#######...........   (35%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[########..........   (41%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[#########.........   (50%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[##########........   (56%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[###########.......   (60%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[############......   (64%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[#############.....   (72%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[##############....  (77%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[###############...   (83%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[################..   (89%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installing \e[0m \e[33m[#################.   (96%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Installed \e[0m \e[33m[################## (100%)]\e[0m \r';
echo -ne "\e[0m\r";
echo -ne '\e[32m\e[1m [*] Installation Successfull!                        \e[0m';
}

progress(){
  echo -ne "\e[30m\r";
echo -ne '\e[42m Backing up \e[0m \e[33m[#.................   (0%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[##................   (5%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[###...............   (11%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[####..............   (13%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[#####.............   (18%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[#####.............   (24%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[######............   (29%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[#######...........   (35%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[########..........   (41%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[#########.........   (50%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[##########........   (56%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[###########.......   (60%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[############......   (64%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[#############.....   (72%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[##############....  (77%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[###############...   (83%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[################..   (89%)]\e[0m \r';
sleep 0.1;
echo -ne '\e[42m Backing up \e[0m \e[33m[#################.   (96%)]\e[0m \r';
sleep 0.1;
echo -ne "\e[0m\r";
echo -ne '\e[32m\e[1m [*] Backed up! \e[0m \e[33m[################## (100%)]\e[0m \r';
}
banner;
menu_controll_1;


# =====================================

# copyright (c) Rakin 2020,
# All rights reserved.

# More Tools for termux are comming Soon.

# =====================================
