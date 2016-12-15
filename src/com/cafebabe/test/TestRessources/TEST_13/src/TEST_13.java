/**
 * Created by laffineur on 29/10/16.
 */
public class TEST_13 {

    public static void main(String[] args){
        int i = 0;
        int b = 11;
        double d1 = 10;
        double d2 = 30;
        while (d1<d2){
            while (i<10){
                i++;
            }
            if(d1 < d2){
                d1 = d1 + d1;
                if(b == 11){
                    b = b -2;
                }
            }
        }
        //System.out.println(i);
        //System.out.println(b);
        //System.out.println(d1);
        //System.out.println(d2);
    }
}
