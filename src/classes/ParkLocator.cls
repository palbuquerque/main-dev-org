/**
 * Created by Paul Albuquerque on 7/25/2017.
 */

public with sharing class ParkLocator {
    public static String[] country(String countryName){
        ParkService.ParksImplPort parkService = new ParkService.ParksImplPort();
        String[] availableParkNames = parkService.byCountry(countryName);
        return availableParkNames;
    }
}