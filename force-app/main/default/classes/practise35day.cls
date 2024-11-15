public class practise35day {
    

  /*  public static List<String> returnList(){
        List<String> colors = new List<String>{'Red','Blue','Purple'};
            return colors;
    }
    public static void methof1(){
        
        //calling return values
        List<String> colorsret = new List<String>();
        colorsret = returnList();
        system.debug(colorsret);
		
        
        /*List<Account> accList = [Select Id, Name, Active__c, Rating from Account where Rating = 'Hot'];
        system.debug(accList.size());
        Account a = new Account(Name= 'Testday355',Active__c='true', Rating='Hot');
        insert a;
        //1add(listElement)
        accList.add(a);
        update accList;
        system.debug(accList);
        
        //2 add(index, listElement)
        Account ab = new Account(Name= 'Testday_5',Active__c='true', Rating='Hot');
        insert ab;
        accList.add(1,ab);
        system.debug(accList);
        
        List<Account> accList2 = [Select Id, Name from Account where Rating='Cold'];
        //3 addAll(List)
        accList.addAll(accList2);
        system.debug(accList);*/
        //system.debug(accList.size());
        /*4 addAll(Set)
        List<Contact> conList = [Select Id, LastName from Contact where LastName like 'Thanm%'];
        Set<Contact> conSet = new Set<Contact>(conList);
        system.debug(conList);
        accList.addAll(conSet);
        system.debug(accList.size());
        //5 clear
        //accList.clear();
        //system.debug(accList.size());
        //6 clone
        List<Account> accList3 = accList2.clone();
        system.debug(accList2);
        system.debug(accList3);*/
        
        //7 contains(Element)
        //system.debug(colorsret.contains('Purple'));
        //system.debug(colorsret.contains('Pink'));
        
        //8
        /*system.debug('Equals ? 2&3 '+ accList2.equals(accList3));
        system.debug('Equals ? 1 & 3 '+ accList.equals(accList3));
        
        //9 get(index)
        system.debug('this is get elemetn: '+accList2.get(0));
        Account get =  accList2.get(0);
        
        //10 indexOf
        system.debug('get index of : should be cero '+ accList2.indexOf(get));
        
        //12 remove(index)
        system.debug(accList2);
        accList2.remove(0);
        system.debug(accList2);
        //14 sort()
        colorsret.sort();
        system.debug(colorsret);
        
        //11 isEmpty  ---->> system.debug('is not empty : '+ accList2.isEmpty());
        
        //13 size ----> system.debug(accList.size());
        
        //15 set(index, listElement)
        /*system.debug('before set' + accList);
        system.debug(accList.size());
        Account gett = accList.get(1);
        accList.set(0,gett);
        system.debug('after set ' + accList);
        system.debug(accList.size())*/
    //}
}