/**
 * Created by Paul-Notebook on 7/18/2017.
 */

public class AccountProcessor {
   @future
    public static void countContacts(List<Id> accIds){
       List<Account> acctList = [SELECT Id, Number_of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accIds];
       for(Account acct: acctList){
           List<Contact> cntList = acct.Contacts;
           acct.Number_of_Contacts__c = cntList.size();
       }
       upsert acctList;
    }
}