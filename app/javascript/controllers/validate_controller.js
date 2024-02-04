import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="validate"
export default class extends Controller {
  static targets = [ "validateElement", "acceptBookingElement", "declineBookingElement" ]

  connect() {
  }

  colorizeBookingTag() {
    this.validateElementTargets.forEach((target) => {
      if (target.textContent == "Accepted") {
        target.classList.add("accepted", "validated-disabled")
      } else if (target.textContent == "Declined") {
        target.classList.add("declined", "validated-disabled")
      }
    })
  }

  acceptBooking () {
    this.acceptBookingElementTarget.textContent = "Accepted"
    this.declineBookingElementTarget.classList.add("d-none")
  }

  declineBooking () {
    this.declineBookingElementTarget.textContent = "Declined"
    this.acceptBookingElementTarget.classList.add("d-none")
  }
}
