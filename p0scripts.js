// let searchBtn = document.querySelector('#searchBtn');
// searchBtn.addEventListener('click', fetchPokeData);
// async function fetchPokeData(){

//import { getgroups } from "process";

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


//object that referances the button
let searchBtn = document.querySelector('#searchBtn');
//when we click it begins the search event function using the function to fecth the API
searchBtn.addEventListener('click', fetchPokeData);

//
async function fetchPokeData(){


    //promise object first box in table (name)
    let results = document.querySelector('#displaySection');
    //second
    let results2 = document.querySelector('#displaySection2');
    //third
    let results3 = document.querySelector('#displaySection3');
    //fourth
    let results4 = document.querySelector('#displaySection4');
    // object that gets the input information from the 
    let query = document.querySelector('#searchBox').value;
    
    //desired API
    let response = await fetch(`https://pokeapi.co/api/v2/pokemon/${query}`);
    let parsedRes = await response.json();

    
    //print to console
    console.log(parsedRes);

//generate a random number 
let rando = Math.floor(Math.random() * (99 - 0) + 0);

   
    
   //print to HTML page
   results4.innerHTML = parsedRes.types[0].type.name;
    results3.innerHTML =parsedRes.moves[rando].move.name;
    results2.innerHTML =parsedRes.weight;
    results.innerHTML = parsedRes.species.name;


    // for(let i = 0; i < parsedRes.moves.length; i++){
    //     results.innerHTML += parsedRes.moves[i].move.name;
    // }

}
//click counter for Jupiter
let jupiterBtn = document.getElementById('jupiterBtn');
jupiterBtn.addEventListener('click', ()=>{
    clicker();

}); 
jupiterclicks =0;
      function clicker () {
         jupiterclicks += 1;
     let number = document.getElementById("jcounter");
     number.innerHTML = jupiterclicks;
 console.log("hello");
      };




//click counter for Neptune
let neptuneBtn = document.getElementById('neptuneBtn');
neptuneBtn.addEventListener('click', ()=>{
    clickerneptune();
}); 
neptuneclicks =0;
      function clickerneptune () {
         neptuneclicks += 1;
     let neptunenumber = document.getElementById("neptunecounter");
     neptunenumber.innerHTML = neptuneclicks;
 console.log("hello");
      };

//click counter for Mercury
let mercuryBtn=document.getElementById('mercuryBtn');
mercuryBtn.addEventListener('click', ()=>{
    clickermercury();
});
mercuryclicks=0;
    function  clickermercury(){
        mercuryclicks +=1;
    let mercurynumber = document.getElementById("mercurycounter");
    mercurynumber.innerHTML = mercuryclicks;
console.log('hello');
};
      
