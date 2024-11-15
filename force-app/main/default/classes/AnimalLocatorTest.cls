@isTest
private class AnimalLocatorTest{
    @isTest static void AnimalLocatorMock1(){
        try{
            Test.setMock(HttpCalloutMock.class , new AnimalLocatorMock());
            String res=AnimalLocator.getAnimalNameById(1);
            String expresult='fox';
            System.assertEquals(res, expresult);
        }
        catch(exception e){
            System.debug('The following is the resul'+ e.getMessage());
        }
    }
}