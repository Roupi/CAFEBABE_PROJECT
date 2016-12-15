/**
 * Created by laffineur on 19/11/16.
 */
public class ComputeFib extends ComputeDefault {

    public ComputeFib(int x) {
        super(x);
    }

    @Override
    public void operation() {
        result = fib(value1);
    }

    private static int fib(int n) {
        if (n < 2) return(n);
        return( fib(n-2) + fib(n-1) );
    }
}
