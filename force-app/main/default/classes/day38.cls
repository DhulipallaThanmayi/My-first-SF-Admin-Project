public class day38 {
    public static void Prob1(){
        List<Contact> poLi = [Select Name from Contact limit 5];
        Map<Id, Contact> mapPos = new Map<Id, Contact>(poLi);
        system.debug(mapPos);
        mapPos.clear();
        if(mapPos.isEmpty()){
            system.debug('It is Empty');
        }
        else{system.debug('It is not Empty');}
    }
       /* public void Prob1(){
        * Integer a =10;
        Integer b = 9;
        if(a>b){
            system.debug(a+ ' is maximum among two nos.');
        }
        else{ system.debug(b+ ' is maximum among two nos.');}
    }
    
    public static void vote(Integer Age){
        if(Age>18){
            system.debug('Eligible to vote');
        }
    }
    
    
    public void evenOdd(){
        Integer a =4;
        Integer b = 99;
        Integer r = math.mod(a,2);
        Integer r1= math.mod(b,2);
        if(r==0){
           system.debug('EVEN');
           }
           else{
               system.debug('Odd');
           }
        if(r1==0){
           system.debug('EVEN');
           }
           else{
               system.debug('Odd');
           }
    }
    
    //4
    public static void NegaPosi(integer I){
        if(I<0){
            system.debug('this is negative');
        }
        else if(I==0){
            system.debug('Esta es cero');
        }
        else{
            system.debug('this is positive');
        }
    }
    
    public static void prob6(){
        integer a = 10, b = 20, c = 20, d = 0;
        if ((a < b) && (b == c)) {
            d = a + b + c;
            System.debug('The sum is: ' + d);
        }
        else
            System.debug('False conditions');
    }
    */
}