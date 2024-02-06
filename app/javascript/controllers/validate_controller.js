import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="validate"
export default class extends Controller {
  static targets = [ "tag" ]

  connect() {
    this.tagTargets.forEach((tag) => {
      console.log(tag)
      if (tag.textContent === "Accepted") {
        tag.classList.add("accepted");
      } else if (tag.textContent === "Declined") {
        tag.classList.add("declined");
      }
    })
  }

  acceptBooking () {
    this.tagTarget.classList.add("accepted")
  }

  declineBooking () {
    this.tagTarget.classList.add("declined")
  }
}
