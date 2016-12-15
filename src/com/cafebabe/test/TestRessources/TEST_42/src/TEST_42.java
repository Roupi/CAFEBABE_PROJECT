/**
 * Created by laffineur on 11/11/16.
 */
public class TEST_42 {

    public static void main(String[] args){
        int r1 = 0;
        int r2 = 0;
        int r3 = 0;
        int r4 = 0;

        int[][] a = new int[][]{ {3,4},{10,5},{5,2},{6,3} };

        Arithmetic_T42 arit = new Arithmetic_T42(a[0][0],a[0][1]);
        ADD_T42 add = new ADD_T42(a[1][0],a[1][1]);
        SUB_T42 sub = new SUB_T42(a[2][0],a[2][1]);
        Arithmetic_T42 add2 = new ADD_T42(a[3][0],a[3][1]);

        arit.operation();
        add.operation();
        sub.operation();
        add2.operation();

       r1 = arit.giveResult();
        if (r1 == 24) {
            r2 = add.giveResult();
        }

        switch(r2){
            case 15 :
                r2 = addOne(r2);
            default:
                r3 = sub.giveResult();
                r4 = add2.giveResult();
        }
    }

    public static int addOne(int x){
        return x + 1;
    }
}