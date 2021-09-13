import{ LightningElement, track } from 'lwc';
import getTweet from '@salesforce/apex/ViewTweetController.getTweet';

export default class viewTweet extends LightningElement {

    connectedCallback(){
    
        getTweet('1228393702244134912').then(result => {
            console.log('Result---'+result);
        }).catch(error => {
            console.log(error);
        });
    
    }
}