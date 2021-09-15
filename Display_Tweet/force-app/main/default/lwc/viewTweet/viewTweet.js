import{ LightningElement, track } from 'lwc';
import getTweet from '@salesforce/apex/ViewTweetController.getTweet';

export default class viewTweet extends LightningElement {

    tweet;

    connectedCallback(){
    
        getTweet({
            Id:'1228393702244134912'
        })
        .then(result => {
            this.tweet = result;
        }).catch(error => {
            console.log(error);
        });

    }
}