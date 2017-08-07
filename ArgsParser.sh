#! /bin/bash
#Author : Samy BELARBI
version=0.1alpha

#print script usage
usage(){
  echo -e "\e[01mNAME\e[00m\n"
  echo -e "\t\e[01m$(basename $0)\e[00m - Openstack CLI Connector"
  echo -e ""
  echo -e "\e[01mSYNOPSIS\e[00m\n"
  echo -e "\t\e[01m$(basename $0)\e[00m [\e[04moption\e[00m...] \e[04maction\e[00m..."
  echo -e ""
  echo -e "\e[01mOPTIONS\e[00m\n"
  echo -e "\t\e[01m-h, --help\e[00m"
  echo -e "\t\tPrint this help and exit."
  echo -e ""
  echo -e "\t\e[01m-u=, --username=\e[00m"
  echo -e "\t\tExample: --username=MyUsername"
  echo -e ""
  echo -e "\t\e[01m-p=, --password=\e[00m"
  echo -e "\t\tExample: --password=MyPassword"
  echo -e ""
  echo -e "\t\e[01m-P, --project\e[00m"
  echo -e "\t\tExample: --project=MyProjectName"
  echo -e ""
  echo -e "\e[01mVERSION\e[00m"
  echo -e "\t\e[01mv$version\e[00m - 2017/08/07"
  echo -e ""
  echo -e "\e[01mAUTHORS\e[00m"
  echo -e "\tSamy BELARBI."
  echo -e ""
}

#capture all args
while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
            ;;
        -u|--username)
            USERNAME=$VALUE
            ;;
        -p|--password)
            PASSWORD=$VALUE
            ;;
        -P|--project)
            PROJECT=$VALUE
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage

            ;;
    esac
    shift
done

#########EXAMPLES ######################################################
#use ARGS PARAM in script now ...
##example1##
echo "$USERNAME $PASSWORD $PROJECT

##example2##
###connect to remote server, backup all server in a project
connect-cli http://remote-server $USERNAME $PASSWORD
for server in $PROJECT
  backup-cli $server 
done
########################################################################
