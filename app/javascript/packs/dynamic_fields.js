document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("[data-add]").forEach(button => {
    button.addEventListener("click", () => {
      const assoc = button.dataset.add;
      const wrapper = document.querySelector(`[data-wrapper='${assoc}']`);
      const time = new Date().getTime();
      const regexp = new RegExp("new_" + assoc, "g");
      const newField = wrapper.dataset.prototype.replace(regexp, time);
      wrapper.insertAdjacentHTML("beforeend", newField);
    });
  });

  document.addEventListener("click", e => {
    if (e.target.matches("[data-remove]")) {
      e.preventDefault();
      const field = e.target.closest("[data-field]");
      field.querySelector("input[type='hidden'][name*='_destroy']").value = 1;
      field.style.display = "none";
    }
  });
});
