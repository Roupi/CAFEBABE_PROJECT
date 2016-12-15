/**
 * Created by laffineur on 14/11/16.
 */
public class TEST_43 {

    public static void main(String[] args){

        int a = exponent(2,3);
        //System.out.println(a);

    }



    public static int exponent(int a, int n) {
        if (n==0) { return 1; }
        else {
            a = a * exponent(a, n-1);
            return a;
        }
    }

}
