/**
 * Created by Paul Albuquerque on 7/19/2017.
 */

public with sharing class AddPrimaryContact implements Queueable{
    private Contact stateContact;
    private String contactState;

    public AddPrimaryContact(Contact contact, String state){
        this.stateContact = contact;
        this.contactState = state;
    }

    public void execute(QueueableContext context){
        List<Account> acctList = [SELECT Id, BillingState FROM Account WHERE BillingState = :contactState Limit 200];
        for(Account acct:acctList){
            acct.Contacts.add(stateContact);
        }
    }
}