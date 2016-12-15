/**
 * Created by laffineur on 19/11/16.
 */
public class ComputeExponent extends ComputeDefault{

    int exponent;

    public ComputeExponent(int base, int exponent) {
        super(base);
        this.exponent = exponent;
    }

    @Override
    public void operation() {
        int r = 1;
        int i = 0;
         while(i<exponent){
             i++;
             r = r * value1;
         }

         result = r;
    }
}
