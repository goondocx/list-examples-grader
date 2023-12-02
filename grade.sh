# checks if filter exists with correct sigs
if [[ `grep -c 'static List<String> filter(List<String> .*, StringChecker .*)' grading-area/ListExamples.java` == 1 ]]
then
    echo "method filter() exists in ListExamples.java."
else
    echo "method filter() does not exist."
fi

# checks if merge exists with correct sigs
if [[ `grep -c 'static List<String> merge(List<String> .*, List<String> .*)' grading-area/ListExamples.java` == 1 ]]
then
    echo "method merge() exists in ListExamples.java."
else
    echo "method merge() does not exist."
fi
