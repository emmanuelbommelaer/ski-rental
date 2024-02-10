import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = {
    booked: Array
  }

  connect() {
    console.log(this.bookedValue)
    flatpickr(this.element,
      {
        disable: this.bookedValue
      })
  }
}
