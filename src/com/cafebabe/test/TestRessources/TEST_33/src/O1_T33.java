/**
 * Created by laffineur on 3/11/16.
 */
public class O1_T33 implements I1_T33,I2_T33 {
    @Override
    public int arit(int a, int b) {
        return a+b -10 *b+40;
    }

    @Override
    public long giveNumber(long a) {
        return 1+a;
    }
}
