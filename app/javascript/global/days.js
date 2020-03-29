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

loadDays()
