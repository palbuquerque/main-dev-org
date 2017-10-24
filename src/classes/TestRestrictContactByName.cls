/**
 * Created by Paul Albuquerque on 7/18/2017.
 */
@isTest
public with sharing class TestRestrictContactByName {
   @isTest public static void insertInvalidName(){
        Contact c = new Contact(LastName = 'INVALIDNAME');
        Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size()>0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage());

    }
}