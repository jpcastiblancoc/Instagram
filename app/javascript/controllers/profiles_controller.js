import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ['query', 'activity', 'count', 'list']

  beforePerform (element, reflex) {
    console.log("punto 1")
    this.activityTarget.hidden = false
    this.countTarget.hidden = true
  }

  perform (event) {
    console.log("punto 2")
    event.preventDefault()
    this.stimulate('ProfilesReflex#perform', this.queryTarget.value)
  }
}