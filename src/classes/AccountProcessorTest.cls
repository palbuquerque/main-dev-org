/**
 * Created by Paul-Notebook on 7/19/2017.
 */

@isTest
public class AccountProcessorTest {
    @isTest
    public static void test(){
        List<Id> acctIds = new List<Id>();
        List<Account> acctList = new List<Account>();

        for (Integer i = 0; i < 5; i++) {
            Account a = new Account(Name = 'Test Account ' + i);
            acctList.add(a);
        }

        insert acctList;
        System.debug(acctList);
        for(Account a: acctList){
            acctIds.add(a.Id);

        }

        for(Id id:acctIds){
            List<Contact> cnts = new List<Contact>();
            Contact c1 = new Contact(LastName = 'Contact ' + ' ONE ' + id);
            Contact c2 = new Contact(LastName = 'Contact ' + ' TWO ' + id);
            c1.AccountId = id;
            c2.AccountId = id;
            cnts.add(c1);
            cnts.add(c2);
            insert cnts;
            System.debug(cnts);
        }


        Test.startTest();
        AccountProcessor.countContacts(acctIds);
        Test.stopTest();

        for(Integer i = 0; i<acctList.size(); i++) {
            Account a = [SELECT Name, Number_of_Contacts__c FROM Account WHERE Id = :acctIds[i] LIMIT 1];
            System.assertEquals(Integer.valueOf(a.Number_of_Contacts__c),2);
            //System.debug(a.Name + ' :: ' + a.Number_of_Contacts__c);
        }


    }

}