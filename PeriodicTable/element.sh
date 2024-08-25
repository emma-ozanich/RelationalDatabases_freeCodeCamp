#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"


input=$1
if [[ -z $1 ]]
then
echo "Please provide an element as an argument."
else

if [[ $input =~ ^[0-9]+$ ]]
then
	element_info=$($PSQL "SELECT p.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM properties p left join elements e on p.atomic_number=e.atomic_number left join types t on p.type_id=t.type_id WHERE p.atomic_number=$input")
else
	element_info=$($PSQL "SELECT p.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM properties p left join elements e on p.atomic_number=e.atomic_number left join types t on p.type_id=t.type_id WHERE (e.name='$input' OR e.symbol='$input')")
fi


if [[ -z $element_info ]]
then
	echo "I could not find that element in the database."
else
	echo "$element_info" | while read atomic_number bar name bar symbol bar type bar atomic_mass bar melting_point_celsius bar boiling_point_celsius
	do
		echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
	done
fi

fi