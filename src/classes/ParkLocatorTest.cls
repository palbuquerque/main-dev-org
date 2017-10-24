/**
 * Created by Paul Albuquerque on 7/25/2017.
 */
@isTest
private class ParkLocatorTest {
    @isTest static void testCallout(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] parks = new List<String>();
        parks.add('Pelham Bay Park');
        parks.add('Greenbelt');
        parks.add('Van Cortlandt Park');
        parks.add('Flushing Meadows-Corona Park');
        parks.add('Central Park');
        parks.add('Freshkills Park');
        String[] results = ParkLocator.country('United States');
        System.assertEquals(results,parks);
    }
}