import { LightningElement } from 'lwc';

export default class Testingra extends LightningElement {


myList=[];
constructor(){
    super();    console.log('I am a Constructor');
}

connectedCallback(){
    this.myList.push('thanmayi');
    console.log(this.myList);
        console.log('I am connected call back');
}

disconnectedCallback(){
    this.myList=[];
    console.log(this.myList);
    console.log('I am connected call back');
}
}