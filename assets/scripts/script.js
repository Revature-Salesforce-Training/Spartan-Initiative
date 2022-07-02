// Author: Trenton Teasdale
// Created: 4/27/22
// Last Modified: 6/1/22
// This an a weather API able to show todays weather and 4 day forecast

//Begin fetch for weather API
//aebe658949ac3fc12a2499a950e9c91a

let city = 'Orem';
let state = 'utah';

async function getAPI() {
    let request = 'https://api.openweathermap.org/data/2.5/forecast?q='+city+','+state+'&appid=aebe658949ac3fc12a2499a950e9c91a';

    let fetchResult = await fetch(request);

    try {
        let receivedRequest = await fetchResult;
        let finalresult = await receivedRequest.json();
        build(finalresult);
        forecast(finalresult);
    } catch(e){
        console.log(e);
        alert('Uh oh unable to get the current weather for your area, please check your location information and try again');
    }
}
getAPI();

function build(info) {
    console.log(info);
    data= info.list[0];
        console.log(data);
        //add city name
        let currentCity = document.getElementById('currentCity');
        currentCity.innerText = city

        //weather type secelector for API data
        let weather = data.weather[0];
        let weatherIcon = weather.icon;
        let wId = 'weather';
        getIcon(weatherIcon, wId);


        weather = weather.description;
        //append weather status to current section in HTML
        let current =document.getElementById('current');
        current.innerHTML = '';
        current.append(weather);

        //add tempurature
        let temp = document.getElementById('temp');
        //Temp comes in as kelvin and needs to be converted to F
        let kelvin = data.main.temp;
        let fahrenheit = k2f(kelvin);
        temp.innerHTML = '';
        temp.append(fahrenheit);

        //adding feels like temp
        let tempFeel = document.getElementById('feel');
        let feel = data.main.feels_like;
        //conversion
        feel = k2f(feel);
        tempFeel.innerHTML= '';
        tempFeel.append(feel);
}
function forecast(data){
     //       begin forecast info
     let week = document.querySelectorAll('.day');
     for(i=1;i<week.length+1;i++){
         let day = data.list[i];

         //weather status
         let forecastWeather = document.getElementById('weather'+i);
         foreWeather = day.weather[0];
         forecastWeather.innerText = foreWeather.description;

         //forecast date
         const date = new Date();
         let updatedDate = newDate(date, i)
         let domDate = document.querySelector('#date'+i);
         domDate.innerText = updatedDate;

         //forecast temp
         let temp = document.querySelector('#temp'+i);
         dayTemp = day.main.temp;
         dayTemp = k2f(dayTemp);
         temp.innerText = dayTemp;

         //weather icon
         let iconId = ('icon'+i);
         getIcon(foreWeather.icon, iconId);

     }
}

//Start with getting date for today and put it in en-US format
function setDate() {
let date = (new Date()).toLocaleDateString('en-US');
let dateSection = document.getElementById('date');
dateSection.append(date);
}

//update Date variable function
function newDate(date, days) {
    let copy = new Date(Number(date))
    copy.setDate(date.getDate() + days)
    copy = copy.toLocaleDateString('en-US')
    return copy
  }

//run set date function
setDate();

//update location and API with user input information
//Start with adding event listener
const updateButton = document.getElementById('locationButton');
    updateButton.addEventListener('click', ()=> {
        newLocation();
        getAPI();
    })
function newLocation() {
    let newCity = document.getElementById('city');
    city = newCity.value

    let newState = document.getElementById('state');
    state = newState.value;
}

//temp conversion 
function k2f(kelvin) {
    let fahrenheit = Math.round(1.8*(kelvin - 273) + 32);
    return fahrenheit + '\u2109';
}
function f2c(){
    let tempIds = ['temp','feel','temp1','temp2','temp3','temp4'];
    for(i=0;i<tempIds.length; i++){
        let idItem = document.getElementById(tempIds[i]);
        farTemp = Number.parseInt(idItem.innerHTML);
        let celcius = Math.round((farTemp - 32)*(5/9));
        idItem.innerHTML = celcius + '\u2103';
    }
    celciusButton.innerHTML = '\u2109';
}
function c2f(){
    let tempIds = ['temp','feel','temp1','temp2','temp3','temp4'];
    for(i=0;i<tempIds.length; i++){
        let idItem = document.getElementById(tempIds[i]);
        celTemp = Number.parseInt(idItem.innerHTML);
        let far = Math.round((celTemp * (9/5))+32);
        idItem.innerHTML = far + '\u2109';
    }
    celciusButton.innerHTML = '\u2103';
}
//find celcius button and determine which conversion type
const celciusButton = document.getElementById('cel');
    celciusButton.addEventListener('click', ()=>{
        if (document.getElementById('cel').innerHTML == '\u2103'){
            f2c();
        } else {
            c2f();
        }
    })

//get weather ID to get the weather icon from api as well

function getIcon(iconCode, Id) {
    let iconUrl = 'https://openweathermap.org/img/wn/' +iconCode +'@2x.png';
    fetch(iconUrl)
    .then((arg) => {
        let wIcon = new Image();
        wIcon.src = arg.url;
        let weatherImg = document.getElementById(Id);
        weatherImg.innerHTML = '';
        weatherImg.append(wIcon);
    })
}

//UNUSED CODE
// function getAPI() {
//     let request = 'https://api.openweathermap.org/data/2.5/forecast?q='+city+','+state+'&appid=aebe658949ac3fc12a2499a950e9c91a';

    // fetch(request)
    // .then((res) =>{
    //     return res.json();
    // })
    // .then((info) => {
        
        // data= info.list[0];
        // console.log(data);
        // //add city name
        // let currentCity = document.getElementById('currentCity');
        // currentCity.innerText = city

        // //weather type secelector for API data
        // let weather = data.weather[0];
        // let weatherIcon = weather.icon;
        // let wId = 'weather';
        // getIcon(weatherIcon, wId);


        // weather = weather.description;
        // //append weather status to current section in HTML
        // let current =document.getElementById('current');
        // current.innerHTML = '';
        // current.append(weather);

        // //add tempurature
        // let temp = document.getElementById('temp');
        // //Temp comes in as kelvin and needs to be converted to F
        // let kelvin = data.main.temp;
        // let fahrenheit = Math.round(1.8*(kelvin - 273) + 32);
        // temp.innerHTML = '';
        // temp.append(fahrenheit);

        // //adding feels like temp
        // let tempFeel = document.getElementById('feel');
        // let feel = data.main.feels_like;
        // //conversion
        // feel = Math.round(1.8*(feel - 273) + 32);
        // tempFeel.innerHTML= '';
        // tempFeel.append(feel);
        // return info;
    // })
    // .then((data) => {
//  //       begin forecast info
//        let week = document.querySelectorAll('.day');
//        for(i=1;i<week.length+1;i++){
//            let day = data.list[i];

//            //weather status
//            let forecastWeather = document.getElementById('weather'+i);
//            foreWeather = day.weather[0];
//            forecastWeather.innerText = foreWeather.description;

//            //forecast date
//            const date = new Date();
//            let updatedDate = newDate(date, i)
//            let domDate = document.querySelector('#date'+i);
//            domDate.innerText = updatedDate;

//            //forecast temp
//            let temp = document.querySelector('#temp'+i);
//            dayTemp = day.main.temp;
//            dayTemp = k2f(dayTemp);
//            temp.innerText = dayTemp;

//            //weather icon
//            let iconId = ('icon'+i);
//            getIcon(foreWeather.icon, iconId);

//        }
//     })
//     .catch(() => {
//         alert('Uh oh unable to get the current weather for your area please check your location information and try again');
//     })
// }
