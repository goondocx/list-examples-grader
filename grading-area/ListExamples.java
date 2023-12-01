import java.util.ArrayList;
import java.util.List;

interface StringChecker { boolean checkString(String s); }

class ListExamples {

  // Returns a new list that has all the elements of the input list for which
  // the StringChecker returns true, and not the elements that return false, in
  // the same order they appeared in the input list;
  static List<String> filter(List<String> a, StringChecker b) 
  {
    List<String> result = new ArrayList<>();
    for(String s: a) 
    {
      if(b.checkString(s)) 
      {
        result.add(s);
      }
    }
    return result;
  }


  // Takes two sorted list of strings (so "a" appears before "b" and so on),
  // and return a new list that has all the strings in both list in sorted order.
  static List<String> merge(List<String> x, List<String> y) 
  {
    List<String> result = new ArrayList<>();
    int index1 = 0, index2 = 0;
    while(index1 < x.size() && index2 < y.size()) 
    {
      if(x.get(index1).compareTo(y.get(index2)) < 0) 
      {
        result.add(x.get(index1));
        index1 += 1;
      }
      else 
      {
        result.add(y.get(index2));
        index2 += 1;
      }
    }
    while(index1 < x.size()) 
    {
      result.add(x.get(index1));
      index1 += 1;
    }
    while(index2 < y.size()) 
    {
      result.add(y.get(index2));
      index2 += 1;
    }
    return result;
  }


}
