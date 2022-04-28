// Author: Trenton Teasdale
// Created: 4/27/22
// Last Modified: 5/1/22
// This an a weather API able to show todays weather

//Begin fetch for weather API
//aebe658949ac3fc12a2499a950e9c91a
fetch('https://api.openweathermap.org/data/2.5/weather?lat=40.302332124&lon=-111.754663648&appid=ADD-KEY-HERE')
    .then((res) =>{
        return res.json();
    })
    .then((data) => {
        console.log(data);
        //weather type secelector for API data
        let weather = data.weather[0];
        let weatherIcon = weather.icon;
        getIcon(weatherIcon);
        weather = weather.description;
        //append weather status to current section in HTML
        let current =document.getElementById('current');
        current.append(weather);

        //add tempurature
        let temp = document.getElementById('temp');
        //Temp comes in as kelvin and needs to be converted to F
        let kelvin = data.main.temp;
        let fahrenheit = Math.round(1.8*(kelvin - 273) + 32);
        temp.append(fahrenheit);

        //adding feels like temp
        let tempFeel = document.getElementById('feel');
        let feel = data.main.feels_like;
        //conversion
        feel = Math.round(1.8*(feel - 273) + 32);
        tempFeel.append(feel);
    })
function setDate() {
    //Start with getting date
const date = (new Date()).toLocaleDateString('en-US');
let dateSection = document.getElementById('date');
dateSection.append(date);
}
//run set date function
setDate();

function getIcon(weatherIcon) {
    let iconCode = weatherIcon;
    let iconUrl = 'https://openweathermap.org/img/wn/' +iconCode +'@2x.png';
    fetch(iconUrl)
    .then((arg) => {
        let wIcon = new Image();
        wIcon.src = arg.url;
        let weatherImg = document.getElementById('weather');
        weatherImg.append(wIcon);
    })
}
// 