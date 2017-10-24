/**
 * Created by Paul-Notebook on 7/25/2017.
 */
public class AwesomeCalculator {
    public static Double add(Double x, Double y) {
        calculatorServices.CalculatorImplPort calculator =
                new calculatorServices.CalculatorImplPort();
        return calculator.doAdd(x,y);
    }
}