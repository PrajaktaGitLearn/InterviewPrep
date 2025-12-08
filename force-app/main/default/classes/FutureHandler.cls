public class FutureHandler {

    @future(Callout=true)
    public static void executeInFutureContext(Set<Id> accId){
        List<Opportunity> opplist = [SELECT Id,StageName FROM Opportunity WHERE AccountId IN : accId];
        if(!opplist.isEmpty()){
            for(Opportunity op : opplist){
                System.debug('Opp Stage  :'+op.StageName);
            }
            
        }
        
        anotherFuture(); // accounts
        MixedDMLError.callingFromAnotherClass(); // opportunity
        
        //request.send(external system);
    }
    @future
    public static void anotherFuture(){
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='CEO'];
        User usr = new User(alias = 'apexs', email='apex@apexhours.com', 
            emailencodingkey='UTF-8', lastname='Hours', 
            languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
            timezonesidkey='America/Los_Angeles', 
            username='apexhours@apexhours.com');
        insert usr;
       // logic
    }
}