PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --tuples-only -c"

SYMBOL=$1

Data_Disp(){
  if [[ -z $1 ]]
  then
    echo "I could not find that element in the database."
  else
    local atomic_number=$3
    local type=${15}
    local symbol=$5
    local name=$7
    local atomic_mass=$9
    local melting_point=${11}
    local boiling_point=${13}
    # The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
    echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
  fi
}


if [[ -z $SYMBOL ]]; then
  echo "Please provide an element as an argument."
else
  if [[ ! $SYMBOL =~ ^[0-9]+$ ]]
  then
    #for full name inputs
    LENGTH=$(echo -n "$SYMBOL" | wc -m)
    if [[  $LENGTH -gt 2 ]]
    then
      DATA=$($PSQL "SELECT * FROM ELEMENTS INNER JOIN properties USING(atomic_number) INNER JOIN types USING (type_id) WHERE name='$SYMBOL'")
      #echo $DATA
      Data_Disp $DATA
    else
      DATA=$($PSQL "SELECT * FROM ELEMENTS INNER JOIN properties USING(atomic_number) INNER JOIN types USING (type_id) WHERE symbol='$SYMBOL'")
      #echo $DATA 
      Data_Disp $DATA
    fi
  else
    DATA=$($PSQL "SELECT * FROM ELEMENTS INNER JOIN properties USING(atomic_number) INNER JOIN types USING (type_id) WHERE atomic_number='$SYMBOL'")
    #echo $DATA
    Data_Disp $DATA
  fi
fi

