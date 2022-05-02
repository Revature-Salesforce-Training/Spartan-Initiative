/*
    author: Matt McCain
    updated: 4/27/22
    description: code along home page
*/

getKontests();

async function getKontests () {
    let res = await fetch(`https://kontests.net/api/v1/all`);
    //console.log(res);
    let kontests = await res.json();
    //console.log(kontests);
    let resultsTable = document.querySelector('#resultsTable');
    
    for (let element of kontests) {
        let pattern = /NULL/;
        //console.log(element);
        if (element.status == 'BEFORE' && !pattern.test(element.name)) {
            let newRow = document.createElement('tr');
            
            let contestName = element.name;
            let contestStart = element.start_time;
            contestStart = contestStart.slice(0, 11);
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

            resultsTable.appendChild(newRow);
        }
        
    }
}


