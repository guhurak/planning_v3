window.loadDays = () => {
  document.querySelectorAll('.day-form').forEach((el) => {
    el.addEventListener('input', () => {
      let dayId = el.dataset.id
      let day = el.dataset.day
      let assign = el.value
      setTimeout(() => {
        if(el.value == assign) {
          axios({
            method: 'PATCH',
            url: '/days/' + dayId,
            data: {
              day: day,
              assign: assign
            }
          })
        }
      }, 500)
    })
  })
}

window.loadAssistants = () => {
  document.querySelectorAll('.assistant-form').forEach((el) => {
    el.addEventListener('input', () => {
      let count = el.value
      setTimeout(() => {
        if(el.value == count) {
          axios({
            method: 'PATCH',
            url: '/assistants/0',
            data: {
              count: count
            }
          })
        }
      }, 500)
    })
  })
}

loadAssistants()
loadDays()
