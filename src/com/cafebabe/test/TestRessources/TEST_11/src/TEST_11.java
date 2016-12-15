/**
 * Created by laffineur on 28/10/16.
 */
public class TEST_11 {

    public static void main(String[] args){

        int a = boucledor();
    }

    public static int boucledor(){
        int i = 0;
        while(i<5){
            i++;
        }
        i = i + 10;
        i = i-5;
        return i;
    }
}
