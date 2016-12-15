/**
 * Created by laffineur on 19/11/16.
 */
public class ComputeDefault implements Operations {

    protected int value1;
    protected int result;


    public ComputeDefault(int x) {
        this.value1 = x;
    }

    @Override
    public int giveResult() {
        return result;
    }

    @Override
    public void operation() { //Compute Factorial
        int fact = 1;
        int i = value1;
        while(i >= 1){
            fact = fact*i;
            i--;
        }
        result=fact;
    }
}
