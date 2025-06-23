document.addEventListener("turbo:load", () => {
  console.log("✅ dynamic_fields.js loaded");

  // Add new nested fields
  document.querySelectorAll("[data-add]").forEach(button => {
    button.addEventListener("click", () => {
      const assoc = button.dataset.add;
      const wrapper = document.querySelector(`[data-wrapper='${assoc}']`);
      const prototype = wrapper.dataset.prototype;
      const timestamp = new Date().getTime();
      const newFields = prototype.replace(/NEW_RECORD/g, `new_${timestamp}`);
      wrapper.insertAdjacentHTML("beforeend", newFields);
    });
  });

  // Remove nested field
  document.addEventListener("click", (e) => {
    if (e.target.matches("[data-remove]")) {
      e.preventDefault();
      const fieldGroup = e.target.closest("[data-field]");
      if (fieldGroup) {
        const destroyField = fieldGroup.querySelector("input[name*='_destroy']");
        if (destroyField) {
          destroyField.value = "1";
          fieldGroup.style.display = "none";
        } else {
          fieldGroup.remove(); // fallback for unsaved ones
        }
      }
    }
  });
});
