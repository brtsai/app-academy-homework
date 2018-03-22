document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });


  // adding SF places as list items

  // --- your code here!


  const addPlace = (e) => {
    e.preventDefault();
    
    const placeNameEl = document.getElementsByClassName('favorite-input');
    const placeName = placeNameEl[0].value
    
    const places = document.getElementById('sf-places');
    const place = document.createElement('li');
    place.textContent = placeName
    
    places.appendChild(place);
    e.target.reset();
  };

  const placeForm = document.getElementById('place-form');
  console.log(placeForm);
  placeForm.addEventListener("submit", addPlace);
  // adding new photos

  // --- your code here!



});
