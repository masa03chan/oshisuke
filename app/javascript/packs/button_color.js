document.addEventListener("DOMContentLoaded", function() {
  var colorPickers = document.querySelectorAll(".color-picker");
  var applyButtons = document.querySelectorAll(".apply-color-btn");

  applyButtons.forEach(function(button) {
    var eventId = button.getAttribute("data-event-id");
    var savedColor = localStorage.getItem(`eventColor-${eventId}`);
    if (savedColor) {
      var colorPicker = document.querySelector(`.color-picker[data-event-id="${eventId}"]`);
      colorPicker.value = savedColor; // デフォルトの選択色として保存された色を設定

      var eventButton = document.querySelector(`.link-button[data-event-id="${eventId}"]`);
      eventButton.style.backgroundColor = savedColor; // 保存された色を適用
    }
    button.addEventListener("click", function() {
      var eventId = this.getAttribute("data-event-id");
      var colorPicker = document.querySelector(`.color-picker[data-event-id="${eventId}"]`);
      var eventButton = document.querySelector(`.link-button[data-event-id="${eventId}"]`);

      eventButton.style.backgroundColor = colorPicker.value;

      // ローカルストレージに色を保存
      localStorage.setItem(`eventColor-${eventId}`, colorPicker.value);
    });

    // ローカルストレージから色をレストア
    var eventId = button.getAttribute("data-event-id");
    var savedColor = localStorage.getItem(`eventColor-${eventId}`);
    if (savedColor) {
      var eventButton = document.querySelector(`.link-button[data-event-id="${eventId}"]`);
      eventButton.style.backgroundColor = savedColor;
    }
  });
});