CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

score=0

# checks if ListExamples.java exists and is in the correct student-submission directory
if [[ -f grading-area/ListExamples.java ]]
then
    echo 'File exists.'
else
    echo "File does not exist." 
    exit
fi

# checks if ListExamples class exists in ListExamples.java
find=`grep -c "class ListExamples" grading-area/ListExamples.java`
if [[ $find == 1 ]]
then
    echo "class ListExamples exists in ListExamples.java."
else
    echo "class ListExamples does not exist."
fi

# checks if filter exists with correct sigs
if [[ `grep -c 'static List<String> filter(List<String> s, StringChecker sc)' grading-area/ListExamples.java` == 1 ]]
then
    echo "method filter() exists in ListExamples.java."
else
    echo "method filter() does not exist."
fi

# checks if merge exists with correct sigs
if [[ `grep -c 'static List<String> merge(List<String> list1, List<String> list2)' grading-area/ListExamples.java` == 1 ]]
then
    echo "method merge() exists in ListExamples.java."
else
    echo "method merge() does not exist."
fi

cd grading-area
pwd

javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > testResult.txt

scoring=`grep -c "OK" testResult.txt`

if [[ $scoring == 1 ]]
then
    score=$((score+1))
fi

echo "Score = $score out of 1"
