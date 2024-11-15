public class Intreset {
    
Integer T;
        Double P; Double R;
    public Intreset(){
        system.debug('Hey I am constructor');
        T=2;
        P=3.54; R=9.8;
    }
    
    public void simlpleIntrest(){
        
        Double SI = P * R * T / 100;
        system.debug(SI);
    }
    
}