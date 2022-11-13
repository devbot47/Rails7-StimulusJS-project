import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["user_modal", "employment_modal"]
  hideModal() {
    this.element.parentElement.removeAttribute("src") // it might be nice to also remove the modal SRC
    this.element.remove()
  }

  showModal(){
    console.log("hello g");
  }
  submitEnd(e) {
    if (e.detail.success) {
      this.hideModal()
      this.showModal()
    }
  }

  closeWithKeyboard(e) {
    if (e.code == "Escape") {
      this.hideModal()
    }
  }

  closeBackground(e) {
    if (e && this.modalTarget.contains(e.target)) {
      return
    }
    this.hideModal()
  }
}