(function (window) {
  function byId(id) { return document.getElementById(id); }

  window.meTVe = {
    poll: function (url, renderFn, intervalMs) {
      intervalMs = intervalMs || 10000;
      function tick() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
          if (xhr.readyState === 4 && xhr.status === 200) {
            renderFn(xhr.responseText);
          }
        };
        xhr.open('GET', url + '&_=' + new Date().getTime(), true);
        xhr.send(null);
      }
      tick();
      window.setInterval(tick, intervalMs);
    },
    notify: function (msg) {
      var box = byId('legacyNotice');
      if (!box) { alert(msg); return; }
      box.innerHTML = msg;
    }
  };
}(window));
