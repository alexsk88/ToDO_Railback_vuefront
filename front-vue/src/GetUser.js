export let TokenBarer = "Bearer " + localStorage.getItem('token')
export let User = JSON.parse(localStorage.getItem('identity'))
