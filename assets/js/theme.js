(function () {
  var btn = document.getElementById('theme-toggle');
  var stored = localStorage.getItem('theme');
  if (stored === 'dark') {
    document.documentElement.setAttribute('data-theme', 'dark');
    if (btn) btn.textContent = '☀ light';
  }
  if (btn) {
    btn.addEventListener('click', function () {
      var isDark = document.documentElement.getAttribute('data-theme') === 'dark';
      if (isDark) {
        document.documentElement.removeAttribute('data-theme');
        localStorage.setItem('theme', 'light');
        btn.textContent = '☾ dark';
      } else {
        document.documentElement.setAttribute('data-theme', 'dark');
        localStorage.setItem('theme', 'dark');
        btn.textContent = '☀ light';
      }
    });
  }
})();
