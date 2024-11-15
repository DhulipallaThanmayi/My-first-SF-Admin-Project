public class Practise36ApexSetmethods {

    public static void method36(){
        /*Set<Contact> conName = new Set<Contact>();
        Set<Contact> conName3 = new Set<Contact>();
        List<Contact> conName2 = [Select LastName from Contact where LastName like 'Than%'];
        List<Contact> conList = [Select LastName from Contact limit 1];
        system.debug(conList);
        Contact con1 = new Contact(LastName = 'Tina333');
        //1
        conName.add(con1);
       	//system.debug(con1);
        //2
        //conName.addAll(conList);
        //system.debug('set 1' + conName);
        //3, 6
        for(Contact c : conName2){
            conName3.add(c);
        }
        /*system.debug('set 2 '+ conName3);
        conName.addAll(conName3);
        //system.debug(conName);
        system.debug(conName2);
        //7 & 8
        system.debug('compareon List: ' +conName3.containsAll(conName2));
        system.debug('compareon List: ' +conName3.containsAll(conName));
        //4 . 5 
        conName3.clear();
        system.debug('clear: '+conName3);
        conName.clone();
        system.debug('clone: '+conName);
        //9
        system.debug('Equals? '+conName.equals(conName2));
        //10
        system.debug('is Empty? '+ conName3.isEmpty());
        //16
        system.debug(conName.size());
        //11 remove(SetElemnt)
        
        Set<Integer> settt = new Set<Integer>();
        settt.add(10);
        system.debug(settt);
        settt.remove(10);
        system.debug(settt);
        
        //12 removeAll(listelements)
        system.debug(conName3);
        conName3.removeAll(conName2);
        system.debug(conName3);
        conName3.addAll(conName);
        system.debug(conName3);
        //13
        //conName3.removeAll(conName2);
        //system.debug(conName3);
        //14 and 15
        conName3.retainAll(conName2);   
        system.debug(conName3);*/
        Set<Id> newSet = new Set<Id>();
        List<Account> accList= new List<Account>();
        accList = [Select Id from Account limit 5];
        for(Account a: accList){
            newSet.add(a.Id);
        }
        system.debug(newSet);
        
        Set<Id> newSetP = new Set<Id>();
        List<Position__c> accListP= new List<Position__c>();
        accListP = [Select Id from Position__c limit 5];
        for(Position__c a: accListP){
            newSetP.add(a.Id);
        }
        system.debug(newSetP);
    }
}