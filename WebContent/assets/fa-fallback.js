// fa-fallback.js — small runtime fallback for missing Font Awesome icons
// If Font Awesome fails to load or a specific icon is unavailable, replace <i> icon elements
// in .tech-row and .tag-icon with a compact SVG badge showing 1-2 letters from the label.
(function(){
  function createBadge(label, bg){
    const txt = (label||'').trim().slice(0,2).toUpperCase() || '?';
  const bgColor = bg || 'rgba(167,170,225,0.18)';
    const fg = '#fff';
    const svg = `<?xml version="1.0" encoding="UTF-8"?><svg xmlns='http://www.w3.org/2000/svg' width='28' height='28' viewBox='0 0 28 28' class='icon-fallback' aria-hidden='true'>
      <rect rx='6' width='28' height='28' fill='${bgColor}' />
      <text x='50%' y='54%' text-anchor='middle' fill='${fg}' font-family='Segoe UI, Roboto, Arial, Helvetica, sans-serif' font-size='12' font-weight='700'>${txt}</text>
    </svg>`;
    return svg;
  }

  function needsFallback(el){
    if(!el) return false;
    // If width is extremely small (icon didn't render) or computed font-family doesn't include Font Awesome
    const rect = el.getBoundingClientRect();
    const cs = window.getComputedStyle(el);
    const ff = cs.fontFamily || '';
    if(rect.width < 8 || !/Font Awesome|FontAwesome|fa-/.test(ff)) return true;
    return false;
  }

  function applyFallbacks(){
    // tech icons
    document.querySelectorAll('.tech-row').forEach(row=>{
      const i = row.querySelector('i');
      const label = row.querySelector('span') ? row.querySelector('span').textContent : '';
      if(i && needsFallback(i)){
        i.innerHTML = createBadge(label);
        // remove potential FA classes to avoid strange fonts
        i.className = 'icon-fallback-container';
      }
    });
    // card icons (.card-icon)
    document.querySelectorAll('.card-icon').forEach(el=>{
      const i = el.querySelector('i');
      const txt = el.textContent || el.getAttribute('data-label') || '';
      if(i && needsFallback(i)){
        i.innerHTML = createBadge(txt);
        i.className = 'icon-fallback-container';
      } else if(!i && needsFallback(el)){
        // If there is no <i>, but the element has emoji/text that was intended as icon, keep it.
      }
    });
  }

  if(document.readyState === 'loading'){
    document.addEventListener('DOMContentLoaded', applyFallbacks);
  } else applyFallbacks();
})();
