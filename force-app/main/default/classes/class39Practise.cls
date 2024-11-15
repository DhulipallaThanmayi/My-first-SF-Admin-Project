public class class39Practise {
    //this should have been 37th class
    /*public static void methodMaps(){
        Map<Integer, String> mapInput= new Map<Integer, String>();
        Map<Integer, String> mapInput2= new Map<Integer, String>();
        Map<Id, Account> mapInput3= new Map<Id, Account>();
        //system.debug(mapInput);
        //1 Put(key, value)
        mapInput.put(1,'India');
        system.debug(mapInput);
        /*mapInput2.put(0,'India');
        //mapInput2.put(1,'India1');
        mapInput2.put(2,'India2');
        //2 putAll(Map)
        mapInput.putAll(mapInput2);
        system.debug(mapInput);
        //3 putAll(sobjectArray)
        List<Account> a = [Select Id, Name from Account limit 10]; 
        mapInput3.putAll(a);
        system.debug(mapInput3);
        //4 remove Key and Size
        /*system.debug(mapInput3.size());
        mapInput3.remove('0015h00001LtwuWAAR');
        system.debug(mapInput3.size());
        system.debug(mapInput3);
        //6 	values, clear, clone
        system.debug(mapInput3.values());
        mapInput.clear();
        //system.debug(mapInput);
        Map<Id, Account> mapInput4 = new map<Id, Account>();
        mapInput4 = mapInput3.clone();
        system.debug(mapInput4);
        //9 containsKey, equals, get(key), isEmpty() ,  keySet()
        //system.debug(mapInput.containsKey(2));
        //system.debug(mapInput3.containsKey('001J2000008H1IYIA0'));
        system.debug(mapInput3.equals(mapInput4));
        Account i = mapInput3.get('001J2000008H1IYIA0');
        system.debug('the account: '+i);
        system.debug('isEmpty? '+mapInput.isEmpty());
        system.debug('Key Set()-> '+mapInput3.keySet());
    }*/
   /* public static void day37problem2and3(){
        /*List<Account> lisA = [Select Id, Name from Account limit 5];
        Map<Id, Account> mapInput5= new Map<Id, Account>(lisA);
        system.debug(mapInput5);
        system.debug(mapInput5.keySet());
        system.debug(mapInput5.values());
        Map<Id, Account> mapInput6= new Map<Id, Account>();
        for(Account a : lisA){
            mapInput6.put(a.Id,a);
        }
        system.debug(mapInput6);
        system.debug(mapInput6.keySet());
        system.debug(mapInput6.values());
        List<Position__c> poLi = [Select Name from Position__c limit 5];
        Map<String, Position__c> mapPos = new Map<String, Position__c>(poLi);
        system.debug(mapPos);
        system.debug(mapPos.KeySet());
        system.debug(mapPos.values());
        //it picked up Ids although I mentioned String as Keys.
        Map<String, Position__c> mapPos2 = new Map<String, Position__c>();
        for(Position__c p : poLi){
            mapPos2.put(p.Name, p);
        }
        system.debug(mapPos2);
        system.debug(mapPos2.KeySet());
        system.debug(mapPos2.values());
    }*/
    
    public static void day39problem7to9(){
        //7 iterate on Account List and create maps 
        List<Attendee__c> att = [Select Id, Name from Attendee__c limit 10];
        Map<Id, Attendee__c> attendeeMap = new Map<Id, Attendee__c>(att);
        system.debug(attendeeMap);
        system.debug(attendeeMap.keySet());
        system.debug(attendeeMap.values());
        //8
        for(Id At : attendeeMap.keySet()){
            system.debug(At);
        }//9
        for(Attendee__c At2 : attendeeMap.values()){
            system.debug(At2);
        }
	}
}