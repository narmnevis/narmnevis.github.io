import java.util.*;

public class ConcatString {
  private final List<String> versions = 
    Arrays.asList("1.3", "1.4", "1.5", 
                  "1.6", "1.7", "8", 
                  "9", "10", "11");
  private int index = 0;

  @Override
  public String toString() {
    String s = versions.get(index);
    index = (index + 1) % versions.size();
    return s;
  }

  public static void main(String[] args) {
    ConcatString cs = new ConcatString();
    System.out.println("Which version?");
    System.out.println(cs + " or " + cs + " or " + cs);
  }
}