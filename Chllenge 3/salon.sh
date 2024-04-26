#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

Menu(){
  if [[ $1 ]]; then
    echo -e "\n$1"
  fi
  SERVICES=$($PSQL "SELECT * FROM services;")
  echo "$SERVICES" | while IFS='|' read SERVICE_ID NAME; do
    echo "$SERVICE_ID) $NAME"
    echo
  done
  read SERVICE_ID_SELECTED

  serviceAvailability=$($PSQL "SELECT service_id,name from SERVICES where service_id=$SERVICE_ID_SELECTED")
  if [[ -z $serviceAvailability ]]; then
    echo "I could not find that service. What would you like today?"
    Menu
    return
  fi

  # phone number request if not already obtained
  if [[ -z $phone_number_input ]]; then
    echo -e "What's your phone number?" 
    read CUSTOMER_PHONE

    # find in db if phone number exists
    customerExists=$($PSQL "SELECT customer_id, name from customers where phone='$CUSTOMER_PHONE'")
    if [[ -z $customerExists ]] 
    then
      echo -e "I don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      # insert into db customer name and phone
      insertCustomer=$($PSQL "INSERT INTO customers (name,phone) VALUES ('$CUSTOMER_NAME','$CUSTOMER_PHONE') ")
      # request
      service=$($PSQL "SELECT name from SERVICES where service_id=$SERVICE_ID_SELECTED") 
      echo -e "What time would you like your $service, $CUSTOMER_NAME?" 
      read SERVICE_TIME
      CUST_ID=$($PSQL "SELECT customer_id FROM customers where name='$CUSTOMER_NAME' AND phone='$CUSTOMER_PHONE'");
      #echo -e "\nI have put you down for a $service at $SERVICE_TIME, $insertCustomer."
      InsertAppointments=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUST_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
      echo -e "\nI have put you down for a $service at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}

Menu