if
  timeout $1s ./$2;
then
  echo "ok in time $1 s to run $2";
else
  echo "not ok in time $1 s to run $2";
fi
