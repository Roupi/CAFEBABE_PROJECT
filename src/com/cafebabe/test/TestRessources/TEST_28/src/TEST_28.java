/**
 * Created by laffineur on 1/11/16.
 */
public class TEST_28 {

    public static void main(String[] args){
        int i = 0;
        int a = 0;
        int b = 0;
        O1_T28 o = (i >= 1 ? new O1_T28() : new O2_T28());
        o.m();
        a = o.mm();
        i = 1;
        O1_T28 o2 = (i >= 1 ? new O1_T28() : new O2_T28());
        o2.m();
        b = o2.mm();

        //System.out.println(a);
        //System.out.println(b);

    }
}
