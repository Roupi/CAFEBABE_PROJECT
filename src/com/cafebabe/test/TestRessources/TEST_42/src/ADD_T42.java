/**
 * Created by laffineur on 11/11/16.
 */
public class ADD_T42 extends Arithmetic_T42{

    public ADD_T42(int a, int b) {
        super(a, b);
    }

    @Override
    public void operation(){
        int i = 0;
        result = op1;
        while (i < op2){
            result++;
            i++;

        }
    }

}
