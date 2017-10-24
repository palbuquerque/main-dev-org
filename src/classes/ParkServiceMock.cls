/**
 * Created by Paul Albuquerque on 7/25/2017.
 */
@isTest
global class ParkServiceMock implements WebServiceMock {
    global void doInvoke(Object param1, Object param2, Map<String,Object> param3, String param4, String param5, String param6, String param7, String param8, String param9){
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
        String[] parks = new List<String>();
        parks.add('Pelham Bay Park');
        parks.add('Greenbelt');
        parks.add('Van Cortlandt Park');
        parks.add('Flushing Meadows-Corona Park');
        parks.add('Central Park');
        parks.add('Freshkills Park');
        response_x.return_x = parks;
        param3.put('response_x', response_x);
    }
}