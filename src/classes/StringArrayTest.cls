public class StringArrayTest {

    public static List<String> generateStringArray(Integer n){
        List<String> test = new List<String>();
        for(integer i=0; i<n; i++){
            String a = 'Test ' + i;
            test.add(a);
        }
        return test;
    }
}