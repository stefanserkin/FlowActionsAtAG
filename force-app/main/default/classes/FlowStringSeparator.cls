/*******************************************************************************
 * @description Parse a string into a collection of strings
 * @date 2025
 *******************************************************************************/
global with sharing class FlowStringSeparator {
    
    @InvocableMethod(
        label='Parse Text' 
        description='Split a string into a collection of strings' 
        category='Utilities'
        iconName='resource:asgr__agGlyph:Layer_1'
    )
    global static List<Result> parseText(List<Request> requests) {
        List<Result> results = new List<Result>();
        for (Request req : requests) {
            Result result = new Result();
            List<String> stringCollection = new List<String>();
            if (!String.isBlank(req.inputString)) {
                String separator = req.separator ?? ';';
                for (String str : req.inputString.split(separator)) {
                    stringCollection.add(str.normalizeSpace());
                }
            }
            result.stringCollection = stringCollection;
            results.add(result);
        }
        return results;
    }

    global class Request {
        @InvocableVariable(label='String to Separate')
        global String inputString;
        @InvocableVariable(label='Separator')
        global String separator;
    }

    global class Result {
        @InvocableVariable(label='Collection of Strings')
        global List<String> stringCollection;
    }

}