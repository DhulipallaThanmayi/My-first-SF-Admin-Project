public class day32Practise {

    double a; double b;
    
    public day32Practise(){
        a = 9.2; b = 3.3;
    }
   
    public static void staticmethod(){
       	double a = 9.2;
        double b = 3.3;
        double area = a * b;
        double parameter = 2 * (a + b);
        system.debug('This is AREA: ' +area +' PARAMETER: ' + parameter);
    }
    
    public void nonStaticmethod(){
        //double a = 2.3;
        //double b = 1.7;
        system.debug('the values and parameters from constructer');
        double area = a * b;
        double parameter = 2 * (a + b);
        system.debug('This is AREA: ' +area +' PARAMETER: ' + parameter);
    }
    
    public static void methodPassingParams(double k , double j){
        double area = k * j;
        double parameter = 2 * (k + j);
        system.debug('This is AREA: ' +area +' PARAMETER: ' + parameter);
    }
}