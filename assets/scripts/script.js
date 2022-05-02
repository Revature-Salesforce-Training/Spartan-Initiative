/*
    Author: Samir Kalouf
    Last Update: 05/02/2022
    Description: The javascript code that implements the cat fact api into my websit.
*/

let catFactBtn = document.querySelector('#catFactBtn')

catFactBtn.addEventListener('click', fetchFactResults);

function fetchFactResults() {
    let query = document.querySelector('#catFactBtn').value;

    fetch(`https://catfact.ninja/fact${query}`)
        .then((value) => {
            return value.json();
        })
        .then((res) => {
            console.log(res);
            let searchResults = document.querySelector('#searchFactResults');
            searchResults.innerHTML = res.fact;
        })
}