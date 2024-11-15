public class Practise39part2 {
    //4
    public static void methodday38(){
    List<Account> accLi = [Select Id from Account limit 10];
    if(!accLi.isEmpty()){
        system.debug(accLi);
    }
    else {

        system.debug(accLi);
    }
    }
}