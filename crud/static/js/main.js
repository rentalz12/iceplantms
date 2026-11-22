// sidebar
const toggle = document.getElementById('sidebar-toggle');
const sidebar = document.getElementById('sidebar');
const overlay = document.getElementById('sidebar-overlay');
const iconOpen = document.getElementById('icon-open');
const iconClose = document.getElementById('icon-close');

if (toggle) {
  function openSidebar() {
    sidebar.classList.remove('-translate-x-full');
    overlay.classList.remove('hidden');
    iconOpen.classList.add('hidden');
    iconClose.classList.remove('hidden');
    document.body.style.overflow = 'hidden';
  }
  function closeSidebar() {
    sidebar.classList.add('-translate-x-full');
    overlay.classList.add('hidden');
    iconOpen.classList.remove('hidden');
    iconClose.classList.add('hidden');
    document.body.style.overflow = '';
  }

  toggle.addEventListener('click', () => {
    sidebar.classList.contains('-translate-x-full') ? openSidebar() : closeSidebar();
  });
  overlay.addEventListener('click', closeSidebar);
  document.addEventListener('keydown', e => { if (e.key === 'Escape') closeSidebar(); });
}

// clock
const clockEl = document.querySelector('#clock');
const dateEl = document.querySelector('#date');
const greetingEl = document.querySelector('#greeting');
const username = document.querySelector('#username').textContent;

if (clockEl) {

  function updateClock() {
  
    const now = new Date();

    const h = String(now.getHours()).padStart(2, '0');
    const m = String(now.getMinutes()).padStart(2, '0');
    const s = String(now.getSeconds()).padStart(2, '0');

    clockEl.textContent = h + ':' + m + ':' + s;

    const days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
    const months = ['January','February','March','April','May','June','July','August','September','October','November','December'];
    dateEl.textContent = days[now.getDay()] + ', ' + months[now.getMonth()] + ' ' + now.getDate() + ', ' + now.getFullYear();

const username = document.querySelector('#username').textContent;

const hour = now.getHours();
if (hour < 12) {
  greetingEl.textContent = 'Good morning, ' + username + '!';
} else if (hour < 18) {
  greetingEl.textContent = 'Good afternoon, ' + username + '!';
} else {
  greetingEl.textContent = 'Good evening, ' + username + '!';
}
}

  updateClock();

  setInterval(updateClock, 1000);
}