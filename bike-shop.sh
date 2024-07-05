#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=bikes --tuples-only -c"

# Function definition for MAIN_MENU
MAIN_MENU() {
  if [[ $1 ]]
then
  echo -e "\n$1"
fi
   echo -e "\n~~~~~ Bike Rental Shop ~~~~~\n"
   echo "How may I help you?"
   echo -e "\n1. Rent a bike\n2. Return a bike\n3. Exit"
   read MAIN_MENU_SELECTION

   case $MAIN_MENU_SELECTION in
       1) RENT_MENU ;;
       2) RETURN_MENU ;;
       3) EXIT ;;
       *) MAIN_MENU "Please enter a valid option." ;;
   esac
}

# Placeholder functions for RENT_MENU, RETURN_MENU, and EXIT
RENT_MENU() {
   # get available bikes
   AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = TRUE ORDER BY bike_id;")
   # if no bikes available
   if [[ -z $AVAILABLE_BIKES ]]
then
  # send to main menu
  MAIN_MENU "Sorry, we don't have any bikes available right now."
else
  # display available bikes
  echo -e "\nHere are the bikes we have available:"
  echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
do
  echo "$BIKE_ID) $SIZE\" $TYPE Bike"
done
  
  # ask for bike to rent
 
  # if input is not a number
 
  # send to main menu
fi
}

RETURN_MENU() {
   echo "Return Menu"
}

EXIT() {
   echo "Thank you for stopping in."
}

# Main script execution
MAIN_MENU
