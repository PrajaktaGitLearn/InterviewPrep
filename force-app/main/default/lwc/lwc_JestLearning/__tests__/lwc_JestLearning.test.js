import { createElement } from '@lwc/engine-dom';
import Lwc_JestLearning from 'c/lwc_JestLearning';

describe('c-lwc_-jest-learning test suite', () => {
    
    test('display first greeting', () => {
        const element = createElement('c-lwc_-jest-learning',{
            is:Lwc_JestLearning
        })
        document.body.appendChild(element);
        const firstDiv = element.shadowRoot.querySelector('div.first');
        expect(firstDiv.textContent).toBe('Hello World !');
    })

    test('display second greeting', () => {

       const secondElement =  createElement('c-lwc_-jest-learning',{
            is:Lwc_JestLearning
        })
        document.body.appendChild(secondElement);
        const secondDiv = secondElement.shadowRoot.querySelector('div.second');
        expect(secondDiv.textContent).toBe('My World!');
    })
});