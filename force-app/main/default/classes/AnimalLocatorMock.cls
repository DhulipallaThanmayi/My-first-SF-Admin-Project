@isTest
global class AnimalLocatorMock implements HttpCalloutMock{
    global HTTPResponse respond(HTTPRequest request){
        
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animals": ["lion","fox","racoon","hatred","misunderstand"]}');
        response.setStatusCode(200);
        return response;
    }   
}