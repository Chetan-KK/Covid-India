//darkmode toggle
let toggleThemeButton = document.getElementById(`toggle-theme-button`);

function load() {
  let theme = localStorage.getItem(`theme`);
  if (theme == `dark`) {
    darkMode();
  } else {
    lightMode();
  }

  //load animation on start
  let loading = document.getElementById(`loading`);
  loading.style.display = `none`;
}

let mainTheme = document.querySelector(`meta[name="theme-color"]`)

function lightMode() {
  localStorage.setItem(`theme`, `light`);
  document.body.classList.remove(`dark-mode`);
  toggleThemeButton.innerHTML = `<i class="fas fa-moon"></i>`;
  mainTheme.removeAttribute(`content`)
  mainTheme.setAttribute(`content`, `#ff7300`)
}
function darkMode() {
  localStorage.setItem(`theme`, `dark`);
  document.body.classList.add(`dark-mode`);
  toggleThemeButton.innerHTML = `<i class="fas fa-sun"></i>`;
  mainTheme.removeAttribute(`content`)
  mainTheme.setAttribute(`content`, `#222222`)
}

toggleThemeButton.addEventListener(`click`, function () {
  let theme = localStorage.getItem(`theme`);
  if (theme == `dark`) {
    lightMode();
  } else {
    darkMode();
  }
});
///////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
//nav bar for mobile toggle
function open_nav() {
  let sidenav = document.getElementById("Sidenav");
  sidenav.style.transform = "translateX(0vw)";
  sidenav.style.boxShadow = `0 0 20px 3px black`;
}

function close_nav() {
  let sidenav = document.getElementById("Sidenav");
  sidenav.style.transform = "translateX(100%)";
  sidenav.style.boxShadow = `0 0 0px 0px black`;
}

////////////////////////////////////////
//nav bar problem in toggle width of device fixing
window.addEventListener(`resize`, () => {
  if (window.innerWidth > 950) {
    let sidenav = document.getElementById("Sidenav");
    sidenav.style.transform = "translateX(0vw)";
  }
  else {
    let sidenav = document.getElementById("Sidenav");
    sidenav.style.transform = "translateX(100%)";
    sidenav.style.boxShadow = `0 0 0px 0px black`;
  }
})




//auto year change on footer
let year = document.getElementById(`year`);
const date = new Date();
year.innerHTML = date.getFullYear().toString().substr(-2);
if ("serviceWorker" in navigator) {
  navigator.serviceWorker
    .register(`sw.js`)
    .then((registration) => {
      console.log(`sw is registerd` + registration);
    })
    .catch((error) => {
      console.log(error);
    });
}
