/**
 * Created by Paul Albuquerque on 7/26/2017.
 */

@isTest
Private class AccountManagerTest {
    @isTest static void testGetAccount() {
        Id recordId = createTestRecords();
        RestRequest request = new RestRequest();
        request.requestURI = 'https://albuquerque-dev-ed.my.salesforce.com/services/apexrest/Accounts/' + recordId +'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        //Call the method to test
        Account thisAccount = AccountManager.getAccount();
        System.debug(recordId);
        //Verify results
        //System.assert(thisAccountList.size() != 0);
        System.assert(thisAccount != null);
        System.assertEquals(thisAccount.Name, 'Test Account');
        System.assert(thisAccount.Contacts.size() == 3);

    }
    //Helper Method
    static Id createTestRecords() {
        Account newAccount = new Account(Name = 'Test Account');
        insert newAccount;
        List<Contact> newContacts = new List<Contact>();
        for (Integer i = 0; i < 3; i++) {
            Contact newContact = new Contact(LastName = 'Test Contact ' + i, AccountId = newAccount.Id);
            newContacts.add(newContact);
        }
        insert newContacts;
        return newAccount.Id;
    }
}