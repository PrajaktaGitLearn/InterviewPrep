public class MixedDMLError {

  
    public static void callingFromAnotherClass(){
        Account a = new Account(Name='ApexHours',AnnualRevenue = 100000);
        insert a;
        
        FutureHandler.anotherFuture();
        
    }
}