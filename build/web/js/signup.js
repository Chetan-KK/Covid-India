//dose selection hide
const dose1date = document.querySelector(`.dosesDate .dose1`)
const dose2date = document.querySelector(`.dosesDate .dose2`)
const doseType = document.getElementById(`doseType`)

const doses = document.getElementById(`doses`)
resetDoses()
doses.addEventListener(`change`, () => {
    if (doses.value == 0) {
        resetDoses()
    }
    else if (doses.value == 1) {
        resetDoses()
        dose1date.removeAttribute(`disabled`)
        dose1date.setAttribute(`required`, `required`)
        doseType.removeAttribute(`disabled`)
    }
    else if (doses.value == 2) {
        dose1date.removeAttribute(`disabled`)
        dose2date.removeAttribute(`disabled`)
        dose1date.setAttribute(`required`, `required`)
        dose2date.setAttribute(`required`, `required`)
        doseType.removeAttribute(`disabled`)
    }
})

function resetDoses() {
    dose1date.setAttribute(`disabled`, `disabled`)
    dose2date.setAttribute(`disabled`, `disabled`)
    dose1date.removeAttribute(`required`, `required`)
    dose2date.removeAttribute(`required`, `required`)
    doseType.setAttribute(`disabled`, `disabled`)
    dose1date.value = null;
    dose2date.value = null;
    doseType.value = null;
    const option = document.createElement(`option`)
    option.setAttribute(`hidden`, `hiddin`)
    option.setAttribute(`selected`, `selected`)
    option.setAttribute(`disabled`, `disabled`)
    option.innerText = `Select Vaccine Type`
    doseType.appendChild(option)
}
