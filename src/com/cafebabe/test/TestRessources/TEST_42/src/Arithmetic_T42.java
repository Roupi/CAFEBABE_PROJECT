/**
 * Created by laffineur on 11/11/16.
 */
public class Arithmetic_T42 implements Operations_T42 {

    protected int result;
    protected int op1;
    protected int op2;

    public Arithmetic_T42(int a, int b){
        op1 = a;
        op2 = b;
    }

    @Override
    public int giveResult() {
        return result;
    }

    @Override
    public void operation() {

        int fact1 = 1;
        int i = op1;
        while(i >= 1){
        fact1 = fact1*i;
            i--;
        }

        int fact2 = 1;
        int j = op2;
        while(j >= 1){
            fact2 = fact2*j;
            j--;
        }

        if (fact1 > fact2) {
            result = fact1;
        } else result = fact2;
    }
}
