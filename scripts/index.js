/*
    author: Matt McCain
    updated: 5/2/22
    description: p0 Javascript
*/


let boxes = document.getElementsByClassName('checkBoxes');
addListenersToCollection(boxes);
let resultsBody = document.querySelector('#resultsBody');

async function getKontests () {
    resultsBody.innerHTML = '';
    let results = await fetch(`https://kontests.net/api/v1/all`);
    let kontests = await results.json();
    for (let box of boxes) {
        if (box.checked) {
            for (let element of kontests) {
                let pattern = /NULL/;
                if (element.status == 'BEFORE' && !pattern.test(element.name) && box.value == element.site) {
                    rowAdder(element);
                }
            }
        }
    }
}

function rowAdder(element) {
    let newRow = document.createElement('tr');
    let resultsBody = document.querySelector('#resultsBody');
    let contestName = element.name;
    let contestStart = element.start_time;
    contestStart = contestStart.slice(0, 10);
    let seconds = element.duration;
    let minutes = seconds / 60;
    let hours = Math.round(minutes / 60);
    let days = 0;
    if (hours > 24) {
        days = Math.round(hours / 24);
        hours %= 24;
    }
    let cMinutes = minutes % 60;
    let durationString = days + '  ' + hours + ':' + cMinutes;
    let contestLink = element.url;

    let contestArray = [contestLink, contestName, contestStart, durationString];
    let i = 1;
    for (let data of contestArray) {
        let dElem = document.createElement('td');
        if (i == 1) {
            let siteLink = document.createElement('a');
            siteLink.setAttribute('href', data);
            siteLink.innerText = element.site;
            dElem.appendChild(siteLink);
        } else {
            dElem.innerText = data;
        }
        newRow.appendChild(dElem);
        i++;
    }

    resultsBody.appendChild(newRow);
}


function addListenersToCollection(listeners) {
    for (let item of listeners) {
        item.addEventListener('click', getKontests);
    }
}