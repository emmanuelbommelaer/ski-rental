import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="validate"
export default class extends Controller {
  static targets = ["validateElement"]

  connect() {
    console.log(this.element);
  }

  colorize() {
    switch(this.element.textContent) {
      case "\n        Accepted\n      ":
        this.element.firstElementChild.classList.add("accepted")
        break;
      case "\n        Declined\n      ":
        this.element.firstElementChild.classList.add("declined")
        break;
    }
  }
}
