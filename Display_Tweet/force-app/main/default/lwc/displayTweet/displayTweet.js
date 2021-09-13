import { LightningElement, api} from 'lwc';

export default class DisplayTweet extends LightningElement {
    @api height = 500;
    theme = 'dark';
    tweetId = '1228393702244134912';
	twitterVfUrl;
    baseUrl = 'edmo-dev-ed.my.salesforce.com';

	renderedCallback() {
		this.twitterVfUrl = `${baseUrl}/apex/TweetVF?tweetId=${tweetId}?theme=${this.theme}`;
	}
}