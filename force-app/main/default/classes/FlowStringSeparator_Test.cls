@IsTest
private class FlowStringSeparator_Test {

    private static FlowStringSeparator.Request request = new FlowStringSeparator.Request();
    private static List<FlowStringSeparator.Request> requests = new List<FlowStringSeparator.Request>();
    private static List<FlowStringSeparator.Result> results;
    
    @IsTest
    static void parseSemiColonSeparatedString() {
        String inputString = 'Mets;Marlins;Phillies;Nationals;Braves';

        request.inputString = inputString;
        request.separator = ';';
        requests.add(request);

        Test.startTest();
        results = FlowStringSeparator.parseText(requests);
        Test.stopTest();

        Set<String> resultStrings = new Set<String>(results.get(0).stringCollection);
        System.Assert.areEqual(5, resultStrings.size(), 'Did not receive 5 strings in result');
        System.Assert.isTrue(resultStrings.contains('Mets'), 'Did not find Mets in result');
    }

    @IsTest
    static void parseCommaSeparatedString() {
        String inputString = 'Mets,Marlins,Phillies,Nationals,Braves';

        request.inputString = inputString;
        request.separator = ',';
        requests.add(request);

        Test.startTest();
        results = FlowStringSeparator.parseText(requests);
        Test.stopTest();

        Set<String> resultStrings = new Set<String>(results.get(0).stringCollection);
        System.Assert.areEqual(5, resultStrings.size(), 'Did not receive 5 strings in result');
        System.Assert.isTrue(resultStrings.contains('Mets'), 'Did not find Mets in result');
    }

    @IsTest
    static void parseStringWithWhitespace() {
        // Use one-word strings so that all whitespace should be removed
        String inputString = 'Pirates; Reds; Cardinals; Cubs; Brewers';

        request.inputString = inputString;
        request.separator = ';';
        requests.add(request);

        Test.startTest();
        results = FlowStringSeparator.parseText(requests);
        Test.stopTest();

        Set<String> resultStrings = new Set<String>(results.get(0).stringCollection);
        System.Assert.areEqual(5, resultStrings.size(), 'Did not receive 5 strings in result');
        for (String resultString : resultStrings) {
            System.Assert.isTrue(!resultString.containsWhitespace(), 'Found separator whitespace in string');
        }
    }

    @IsTest
    static void parseStringWithOddSpacing() {
        // Use one-word strings so that all whitespace should be removed
        String inputString = 'Dodgers;  Giants;Rockies;  Diamondbacks   ;  Padres ';

        request.inputString = inputString;
        request.separator = ';';
        requests.add(request);

        Test.startTest();
        results = FlowStringSeparator.parseText(requests);
        Test.stopTest();

        Set<String> resultStrings = new Set<String>(results.get(0).stringCollection);
        System.Assert.areEqual(5, resultStrings.size(), 'Did not receive 5 strings in result');
        for (String resultString : resultStrings) {
            System.Assert.isTrue(!resultString.containsWhitespace(), 'Found separator whitespace in string');
        }
    }

    @IsTest
    static void parseSingleString() {
        String inputString = 'New York Mets';

        request.inputString = inputString;
        request.separator = ';';
        requests.add(request);

        Test.startTest();
        results = FlowStringSeparator.parseText(requests);
        Test.stopTest();

        String[] resultsStrings = results.get(0).stringCollection;
        System.Assert.areEqual(1, resultsStrings.size(), 'Did not receive 1 string in result');
        System.Assert.areEqual(inputString, resultsStrings[0], 'Single output string is not equal to inputString');
    }

    @IsTest
    static void parseEmptyString() {
        String inputString = '';

        request.inputString = inputString;
        request.separator = ';';
        requests.add(request);

        Test.startTest();
        results = FlowStringSeparator.parseText(requests);
        Test.stopTest();

        List<String> resultsStrings = results.get(0).stringCollection;
        System.Assert.isTrue(resultsStrings.isEmpty(), 'The returned collection of strings should be empty');
    }

    @IsTest
    static void testNullInputString() {
        request.separator = ';';
        requests.add(request);

        Test.startTest();
        results = FlowStringSeparator.parseText(requests);
        Test.stopTest();

        List<String> resultsStrings = results.get(0).stringCollection;
        System.Assert.isTrue(resultsStrings.isEmpty(), 'The returned collection of strings should be empty');
    }

}