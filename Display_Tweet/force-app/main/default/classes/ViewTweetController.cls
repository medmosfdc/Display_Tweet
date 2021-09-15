public class ViewTweetController {
    
    @AuraEnabled(cacheable=true)
    public static String getTweet(String Id){
        HttpRequest httpRequest = new HttpRequest();  
        httpRequest.setEndpoint('https://api.twitter.com/2/tweets?ids='+Id);
        httpRequest.setMethod('GET');
        Env_Config__c configSetting = Env_Config__c.getInstance('TwitterAPIToken');
        String token = configSetting.Value__c;
        String authHeader = 'Bearer '+ token;
        httpRequest.setHeader('Authorization', authHeader);
        Object data;
        try {  
            Http http = new Http();   
            HttpResponse httpResponse = http.send(httpRequest);  
            if (httpResponse.getStatusCode() == 200 ) {  
                data = httpResponse.getBody();  
            } 
            else {  
                throw new CalloutException(httpResponse.getBody());  
            } 
            
        } 
        catch(Exception ex) {  
            throw ex;  
        } 
        system.debug('data = '+ JSON.serialize(data));
        return JSON.serialize(data);

    }
}