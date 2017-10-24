public class AccountHandler {
    public static Account insertNewAccount(String s){
        Account acct = new Account();        
        try{
            
            acct.Name = s;
            
            insert acct;
        } catch (DmlException e){
            System.debug('A DML excption has occured: ' + e.getMessage());
            acct = null;
        }
        return acct;
    }
}