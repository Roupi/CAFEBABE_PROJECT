/**
 * Created by laffineur on 30/10/16.
 */
public class O1_T21 {

    O2_T21 o = new O2_T21();

    public O1_T21() {
        this.o = modO2(o);
    }

    private O2_T21 modO2(O2_T21 o){
        o.a = 11;
        o.b = 22;
        return o;
    }

}
