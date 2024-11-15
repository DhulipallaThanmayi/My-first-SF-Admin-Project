public class AnimalLocator {
    public static String getAnimalNameById(Integer n){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+n);
        request.setMethod('GET');
        
        //system.debug('******response '+response.getStatusCode());
        //system.debug('******response '+response.getBody());
        Map<String, Object> animal = new Map<String, Object>();
        HttpResponse response = http.send(request);
        //String strResp = '';
        if(response.getStatusCode() == 200) {
           
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
           // Map<String, Object> animals = (Map<String, Object>) results.get('animal');
    		//System.debug('Received the following animals:' + animals);
    	//	strResp = string.valueof(animals.get('name'));
          //  System.debug('strResp >>>>>>' + strResp );
          animal=(Map<String, Object>)results.get('animal');
        }
        return (String)animal.get('name') ;
    }
}