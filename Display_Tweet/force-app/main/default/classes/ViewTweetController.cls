public class ViewTweetController {
    @AuraEnabled
    public static string getTweet(String Id){
        HttpRequest httpRequest = new HttpRequest();  
        httpRequest.setEndpoint('https://api.twitter.com/2/tweets?ids='+Id);
        httpRequest.setMethod('GET');
        String token = 'AAAAAAAAAAAAAAAAAAAAAHANTgEAAAAAfa6HdGT%2FvBUMLaPHU1n8eEWjKek%3D7llRXMnDseRvpbR1uWxDfnl1AEwlJILqRUMFlIpKuCZjKP7Vj4';
        String authHeader = 'Bearer '+ token;
        httpRequest.setHeader('Authorization', authHeader);
        String strResponse = null;
        try {  
            Http http = new Http();   
            HttpResponse httpResponse = http.send(httpRequest);  
            if (httpResponse.getStatusCode() == 200 ) {  
                strResponse = httpResponse.getBody();  
            } 
            else {  
                throw new CalloutException(httpResponse.getBody());  
            } 
            
        } 
        catch(Exception ex) {  
            throw ex;  
        } 
        if(!String.isBlank(strResponse)) {
                return strResponse;
        }else{
            return null;
        }
    }
}