#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"


service_ids="$($PSQL "SELECT DISTINCT service_id FROM services ORDER BY service_id ASC;")"

echo -e "Services we offer:\n"
for thing in $service_ids; do
echo -e "$thing) $($PSQL "SELECT name FROM services WHERE service_id=$thing;")"
done;

echo "Please enter the number for the service you would like."
read  SERVICE_ID_SELECTED

# get service
SELECTED_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

# if service doesn't exist
if [[ -z $SELECTED_SERVICE ]]
then
# send to main menu
echo -e "\nThat is not a valid service. Please enter a new service"
for thing in $service_ids; do
	echo -e "$thing) $($PSQL "SELECT name FROM services WHERE service_id=$thing") "
done;
read SERVICE_ID_SELECTED
SELECTED_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
fi

#prompt to enter service_id, phone, time
echo "Please enter your phone number."
read CUSTOMER_PHONE 
customer_name=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")

# if phone number doesn't exist, ask for name
if [[ -z $customer_name ]]
then
echo "Welcome new customer! Please enter your name."
read CUSTOMER_NAME
# enter into customers table
out=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE');")
else
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
fi

echo "What is your appointment time?"
read SERVICE_TIME

customer_id=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME';")
out2=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($customer_id, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")

echo "I have put you down for a "$SELECTED_SERVICE" at "$SERVICE_TIME", "$CUSTOMER_NAME"."