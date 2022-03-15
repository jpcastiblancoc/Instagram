import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ['query', 'activity', 'count', 'list']

  beforePerform (element, reflex) {
    console.log("Hola Mundo")
    this.activityTarget.hidden = false
    this.countTarget.hidden = true
  }

  increment(event) {
    console.log("Hola Mundo")
    event.preventDefault()
    this.stimulate('Counter#increment', 1)
  }

  perform (event) {
    console.log("Hola Mundo")
    console.log("Hola Mundo")
    event.preventDefault()
    this.stimulate('BookSearchReflex#perform', this.queryTarget.value)
  }
}