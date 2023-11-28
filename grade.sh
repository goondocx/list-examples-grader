# ListExamples.java implementation guide

# filter()
# Returns a new list that has all the elements of the input list for which
# the StringChecker returns true, and not the elements that return false, in
# the same order they appeared in the input list;

# merge()
# Takes two sorted list of strings (so "a" appears before "b" and so on),
# and return a new list that has all the strings in both list in sorted order.


# plan of action
#   1. check a file called ListExamples.java exists and is in the right directory ✓
#   2. check in ListExamples.java that a class called ListExamples exists, maybe with grep "class ListExamples" ✓
#   3. check if filter() and merge() files exists with the correct signatures, with grep ✓
#   4. run javac -cp $CPATH *.java
#          java -cp $CPATH TestListExamples
#   5. profit

# Questions
# 


CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

score=0

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

# checks if ListExamples.java exists and is in the correct student-submission directory
if [[ -f student-submission/ListExamples.java ]]
then
    echo 'File exists.'
else
    echo "File does not exist." 
    exit
fi

# checks if ListExamples class exists in ListExamples.java
find=`grep -c "class ListExamples" student-submission/ListExamples.java`
if [[ $find == 1 ]]
then
    echo "class ListExamples exists in ListExamples.java."
else
    echo "class ListExamples does not exist."
fi

# checks if filter exists with correct sigs
if [[ `grep -c 'static List<String> filter(List<String> .*, StringChecker .*)' student-submission/ListExamples.java` == 1 ]]
then
    echo "method filter() exists in ListExamples.java."
else
    echo "method filter() does not exist."
fi

# checks if merge exists with correct sigs
if [[ `grep -c 'static List<String> merge(List<String> .*, List<String> .*)' student-submission/ListExamples.java` == 1 ]]
then
    echo "method merge() exists in ListExamples.java."
else
    echo "method merge() does not exist."
fi

# copies needed files into grading area
cp student-submission/ListExamples.java TestListExamples.java grading-area
cp -r lib grading-area

cd grading-area
pwd

javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > testResult.txt

scoring=`grep -c "FAILURES" testResult.txt`

if [[ $scoring == 0 ]]
then
    score=$((score+1))
fi

echo "Score = $score out of 1"

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
