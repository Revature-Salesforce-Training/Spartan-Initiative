// let searchBtn = document.querySelector('#searchBtn');
// searchBtn.addEventListener('click', fetchPokeData);
// async function fetchPokeData(){

//     let results = document.querySelector('#displaySection');
//     let query = document.querySelector('#searchBox').value;
    
//     let response = await fetch(`https://pokeapi.co/api/v2/pokemon/${query}`);
//     let parsedRes = await response.json();

//     console.log(parsedRes);

//     results.innerHTML = parsedRes.species;

//     results.innerHTML = parsedRes.weight;

//     for(let i = 0; i < parsedRes.moves.length; i++){
//         results.innerHTML += parsedRes.moves[i].move.name;
//     }
// }


// let searchBtn1 = document.querySelector('#searchBtn');
// searchBtn1.addEventListener('click', fetchPokeData);
// async function fetchPokeData(){
//     let results = document.querySelector('#displaySection');
//     let query = document.querySelector('#searchBox').value;

//     let response = await fetch(`https://pokeapi.co/api/v2/pokemon/${query}`);
//     let parsedRes = await response.json();

//     console.log(parsedRes);

//     results.innerHTML = parsedRes.species.name;

// }

let searchBtn = document.querySelector('#searchBtn');
searchBtn.addEventListener('click', fetchPokeData);
async function fetchPokeData(){


    //first box in table (name)
    let results = document.querySelector('#displaySection');
    let results2 = document.querySelector('#displaySection2');
    let results3 = document.querySelector('#displaySection3');
    let query = document.querySelector('#searchBox').value;
    
    let response = await fetch(`https://pokeapi.co/api/v2/pokemon/${query}`);
    let parsedRes = await response.json();

    console.log(parsedRes);

    
    
   
    results3.innerHTML =parsedRes.moves[0].move.name;
    results2.innerHTML =parsedRes.weight;
    results.innerHTML = parsedRes.species.name;


    let jupiterNumb =0
function clickMe() {
    jupiterNumb +=1;
 document.getElementById("jupiterBtn").innerHTML = jupiterNumb;
    
};


    // for(let i = 0; i < parsedRes.moves.length; i++){
    //     results.innerHTML += parsedRes.moves[i].move.name;
    // }



}
