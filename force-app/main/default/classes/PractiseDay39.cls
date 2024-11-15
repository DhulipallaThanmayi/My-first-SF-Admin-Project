public class PractiseDay39 {

    /*1 
    public static void table(Integer t){
        for(integer i=0;i<=t+1;i++){
            system.debug(i +' * ' + t + ' = ' + i*t);
        }
	}
	//2
	public static void EvenOdd(Integer eo){
        List<Integer> even= new List<Integer>();
        List<Integer> odd= new List<Integer>();
        for(integer i=1;i<=eo;i++){
            if(Math.mod(eo,2)==0){
                even.add(eo);
            }
            else
                odd.add(eo);
        }
        system.debug(even + ' es even' + odd + 'es odd');
    }
    
    //3
    public static void SumNaturalNos(Integer k, Integer l){
        system.debug('Sum of Natural nos. ' + (k+l));
    }*/
    //4
    public static void iterateonList(){
        List<Account> accs = [Select Id, Name from Account where Name like 'T%' limit 10];
        Set<Id> idSet = new Set<Id>();
        if(!accs.isEmpty()){
        for(Account a : accs){
                system.debug('Id is: '+' '+a.Id);
                system.debug('Name '+' '+a.Name);
            idSet.add(a.Id);
            }
        }
        system.debug(idSet);
        
        for(Id i : idSet){
            system.debug('Id = ' +i);
        }
        idSet.clear();
        if(!idSet.isEmpty()){
            system.debug(idSet);
        }
        else{
            system.debug('empty');
        }
    }
    /*5
    public static void AccountIdSet(){
        List<Account> accs = [Select Id from Account limit 10];
        Set<Id> accountIds = new Set<Id>();
        for(Account Id : accs){
            accountIds.add(accs);
        }
        system.debug(accountIds + ' this is Set Ids');
    }*/
    //6
    
}