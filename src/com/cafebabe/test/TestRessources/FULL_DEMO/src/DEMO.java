/**
 * Created by laffineur on 19/11/16.
 */
public class DEMO {

    public static void main(String[] args){
        int a = demo(1,5);
    }

    public static int demo(int opt, int value){
        int r = 0;
        int[] a = new int[1];
        a[0] = 3;
        ComputeDefault o;

        switch(opt) {
            case 1 : //Compute exponent (^a[0])
                o = new ComputeExponent(value,a[0]);
                break;

            case 2 : //Fibonacci [0, 1, 1, 2, 3, 5, 8, 13, 21]
                o = new ComputeFib(value);
                break;

            default: //Compute factorial
                o = new ComputeDefault(value);
                break;
        }
        o.operation();
        r = o.giveResult();
        //System.out.println(r);
        return r;
    }

}
