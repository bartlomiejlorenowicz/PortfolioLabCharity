document.addEventListener("DOMContentLoaded", function() {

  /**
   * Form Select
   */
  class FormSelect {
    constructor($el) {
      this.$el = $el;
      this.options = [...$el.children];
      this.init();
    }

    init() {
      this.createElements();
      this.addEvents();
      this.$el.parentElement.removeChild(this.$el);
    }

    createElements() {
      // Input for value
      this.valueInput = document.createElement("input");
      this.valueInput.type = "text";
      this.valueInput.name = this.$el.name;

      // Dropdown container
      this.dropdown = document.createElement("div");
      this.dropdown.classList.add("dropdown");

      // List container
      this.ul = document.createElement("ul");

      // All list options
      this.options.forEach((el, i) => {
        const li = document.createElement("li");
        li.dataset.value = el.value;
        li.innerText = el.innerText;

        if (i === 0) {
          // First clickable option
          this.current = document.createElement("div");
          this.current.innerText = el.innerText;
          this.dropdown.appendChild(this.current);
          this.valueInput.value = el.value;
          li.classList.add("selected");
        }

        this.ul.appendChild(li);
      });

      this.dropdown.appendChild(this.ul);
      this.dropdown.appendChild(this.valueInput);
      this.$el.parentElement.appendChild(this.dropdown);
    }

    addEvents() {
      this.dropdown.addEventListener("click", e => {
        const target = e.target;
        this.dropdown.classList.toggle("selecting");

        // Save new value only when clicked on li
        if (target.tagName === "LI") {
          this.valueInput.value = target.dataset.value;
          this.current.innerText = target.innerText;
        }
      });
    }
  }
  document.querySelectorAll(".form-group--dropdown select").forEach(el => {
    new FormSelect(el);
  });

  /**
   * Hide elements when clicked on document
   */
  document.addEventListener("click", function(e) {
    const target = e.target;
    const tagName = target.tagName;

    if (target.classList.contains("dropdown")) return false;

    if (tagName === "LI" && target.parentElement.parentElement.classList.contains("dropdown")) {
      return false;
    }

    if (tagName === "DIV" && target.parentElement.classList.contains("dropdown")) {
      return false;
    }

    document.querySelectorAll(".form-group--dropdown .dropdown").forEach(el => {
      el.classList.remove("selecting");
    });
  });

  /**
   * Switching between form steps
   */
  class FormSteps {
    constructor(form) {
      this.$form = form;
      this.$next = form.querySelectorAll(".next-step");
      this.$prev = form.querySelectorAll(".prev-step");
      this.$step = form.querySelector(".form--steps-counter span");
      this.currentStep = 1;

      this.$stepInstructions = form.querySelectorAll(".form--steps-instructions p");
      const $stepForms = form.querySelectorAll("form > div");
      this.slides = [...this.$stepInstructions, ...$stepForms];

      this.init();
    }

    /**
     * Init all methods
     */
    init() {
      this.events();
      this.updateForm();
    }

    /**
     * All events that are happening in form
     */
    events() {
      // Next step
      this.$next.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep++;
          this.updateForm();
        });
      });

      // Previous step
      this.$prev.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep--;
          this.updateForm();
        });
      });

      // Form submit
      this.$form.querySelector("form").addEventListener("submit", e => this.submit(e));
    }

    /**
     * Update form front-end
     * Show next or previous section etc.
     */
    updateForm() {
      this.$step.innerText = this.currentStep;

      // TODO: Validation

      this.slides.forEach(slide => {
        slide.classList.remove("active");

        if (slide.dataset.step == this.currentStep) {
          slide.classList.add("active");
        }
      });

      this.$stepInstructions[0].parentElement.parentElement.hidden = this.currentStep >= 5;
      this.$step.parentElement.hidden = this.currentStep >= 5;

      // TODO: get data from inputs and show them in summary
    }

  }
  const form = document.querySelector(".form--steps");
  if (form !== null) {
    new FormSteps(form);
  }
});

$(document).ready(function() {
  // Funkcja aktualizująca podsumowanie
  function updateSummary() {
    var quantity = $('#quantity').val();
    var institution = $('input[name="institution"]:checked').closest('label').find('.title').text(); // Pobierz tekst wybranej instytucji
    var street = $('#street').val();
    var city = $('#city').val();
    var zipCode = $('#zipCode').val();
    var phone = $('#phone').val();
    var pickUpDate = $('#pickUpDate').val();
    var pickUpTime = $('#pickUpTime').val();
    var pickUpComment = $('#pickUpComment').val();

    $('#summaryQuantity').text(quantity);
    $('#summaryInstitution').text(institution);
    $('#summaryStreet').text(street);
    $('#summaryCity').text(city);
    $('#summaryZipCode').text(zipCode);
    $('#summaryPhone').text(phone);
    $('#summaryDate').text(pickUpDate);
    $('#summaryTime').text(pickUpTime);
    $('#summaryComment').text(pickUpComment);
  }

  // Nasłuchiwanie zmian w polach formularza
  $('#quantity, input[name="institution"], #street, #city, #zipCode, #phone, #pickUpDate, #pickUpTime, #pickUpComment').on('input change', function() {
    updateSummary();
  });

  // Upewnij się, że podsumowanie jest aktualizowane na początku
  updateSummary();

  // Zablokowanie domyślnego działania formularza na czas testów
  $('#donationForm').on('submit', function(event) {
    updateSummary();
  });
});

// scrollowanie
$(document).ready(function() {
  // Przewijanie do sekcji
  $('.scroll-to').on('click', function(event) {
    event.preventDefault();
    var target = $(this).attr('href');
    $('html, body').animate({
      scrollTop: $(target).offset().top
    }, 1000);
  });

  // Przewijanie do sekcji footer
  $('.scroll-to-footer').on('click', function(event) {
    event.preventDefault();
    $('html, body').animate({
      scrollTop: $('footer').offset().top
    }, 1000);
  });
});

$(document).ready(function () {
  let currentStep = 1;
  const totalSteps = 5;

  function showStep(step) {
    $('.form-step').removeClass('active');
    $(`[data-step=${step}]`).addClass('active');
    $('.form--steps-counter span').text(step);
  }

  $('.next-step').on('click', function () {
    if (currentStep < totalSteps) {
      currentStep++;
      showStep(currentStep);
    }
  });

  $('.prev-step').on('click', function () {
    if (currentStep > 1) {
      currentStep--;
      showStep(currentStep);
    }
  });

  showStep(currentStep);
});


