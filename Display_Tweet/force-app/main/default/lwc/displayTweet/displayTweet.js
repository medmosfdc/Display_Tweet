import { LightningElement, api} from 'lwc';

export default class DisplayTweet extends LightningElement {
    @api height = 500;
    theme = 'dark';
    tweetId = '1228393702244134912';
	twitterVfUrl;

	renderedCallback() {
		this.twitterVfUrl = `edmo-dev-ed.my.salesforce.com/apex/TweetVF?tweetId=${this.tweetId}?theme=${this.theme}`;
	}
}