/**
 * Created by laffineur on 19/11/16.
 */
public class EXP {

    public static void main(String[] args){}

    public static int exponent(int a, int n) {
        if (n==0) { return 1; }
        else {
            a = a * exponent(a, n-1);
            return a;
        }
    }

}
