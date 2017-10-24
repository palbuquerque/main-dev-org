/**
 * Created by Paul Albuquerque on 7/18/2017.
 */

public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numberOfContacts, String lastName){
        List<Contact> contacts = new List<Contact>();
        for(Integer i=0; i<numberOfContacts; i++){
            Contact c = new Contact();
            c.FirstName = 'Generic ' + i;
            c.LastName = lastName;
            contacts.add(c);
        }
        return contacts;
    }
}