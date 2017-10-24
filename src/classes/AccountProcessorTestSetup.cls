/**
 * Created by Paul Albuquerque on 7/19/2017.
 */

public with sharing class AccountProcessorTestSetup {

    //Generates 5 new Accounts and returns a list of their Id's
    public static List<Id> addAccounts() {
        //Create empty list of accounts and Id's
        List<Account> accts = new List<Account>();
        List<Id> acctIds = new List<Id>();
        //Create 5 Accounts
        for (Integer i = 0; i < 5; i++) {
            Account a = new Account(Name = 'Test Account ' + i);
            accts.add(a);
        }
        insert accts;
        //System.debug('These are the new Accounts: \n' + accts);
        //Populate the Id list with the newly inserted Accounts
        //Add contacts
        for(Integer i = 0; i<accts.size(); i++){
            acctIds.add(accts[i].Id);
            Account a = accts[i];
            AccountProcessorTestSetup.addContacts(a.Name,a.Id);
        }
        //System.debug('These are the ids: \n' + acctIds);
        return acctIds;
    }

    public static void addContacts(String acctName, Id acctId){
        //Create empty Contact list
        List<Contact> cnts = new List<Contact>();
        //Random number between 1 and 5 which will be the number of contacts generated
        Integer numOfCnts = Math.round(Math.random()*5)+1;
        for(Integer i = 0; i < numOfCnts; i++){
            Contact c = new Contact(LastName = 'Contact ' + i + ' for ' + acctName);
            c.AccountId = acctId;
            cnts.add(c);
        }
        //System.debug('These are the new contacts:\n ' + cnts);
        insert cnts;
    }
}