// script.js — UI behaviors: smooth scroll, reveal, nav highlight, contact form POST JSON
(function(){
  // Smooth scroll for nav links
  document.querySelectorAll('.nav-link').forEach(a=>{
    a.addEventListener('click', function(e){
      e.preventDefault();
      const id = this.getAttribute('href');
      const el = document.querySelector(id);
      if(el){ el.scrollIntoView({behavior:'smooth', block:'start'}); }
    });
  });

  // Reveal on scroll
  const reveals = document.querySelectorAll('.reveal');
  const rObs = new IntersectionObserver((entries)=>{
    entries.forEach(ent=>{ if(ent.isIntersecting){ ent.target.classList.add('visible'); rObs.unobserve(ent.target); } });
  },{threshold:0.12});
  reveals.forEach(r=>rObs.observe(r));

  // Nav active based on section in viewport
  const sections = document.querySelectorAll('section[id]');
  const navObserver = new IntersectionObserver((entries)=>{
    entries.forEach(ent=>{
      const id = ent.target.id; const link = document.querySelector(`.nav-link[href='#${id}']`);
      if(ent.isIntersecting){ document.querySelectorAll('.nav-link').forEach(n=>n.classList.remove('active')); link && link.classList.add('active'); }
    });
  },{threshold:0.5});
  sections.forEach(s=>navObserver.observe(s));

  // Contact form: send JSON to /contact
  const sendBtn = document.getElementById('sendBtn');
  const formStatus = document.getElementById('formStatus');
  const contactForm = document.getElementById('contactForm');
  // Ensure there's a small label inside the button we can toggle
  let sendLabel = document.getElementById('sendLabel');
  if(!sendLabel && sendBtn){ sendLabel = document.createElement('span'); sendLabel.id = 'sendLabel'; sendLabel.textContent = sendBtn.textContent || 'Send'; sendBtn.textContent = ''; sendBtn.appendChild(sendLabel); }
  function setLoading(loading){ if(sendBtn) sendBtn.disabled = loading; sendBtn && sendBtn.classList.toggle('loading', loading); if(sendLabel) sendLabel.textContent = loading ? 'Sending…' : 'Send'; }

  sendBtn && sendBtn.addEventListener('click', async ()=>{
    formStatus.textContent='';
    // grab values
    const name = document.getElementById('name').value.trim();
    const email = document.getElementById('email').value.trim();
    const message = document.getElementById('message').value.trim();

    if(!name || !email || message.length < 5){ formStatus.textContent = 'Please complete the form (message at least 5 chars).'; formStatus.classList.add('error'); return; }

    setLoading(true);
    try{
      // Build endpoint using global APP_CONTEXT (set by JSP). Fallback to '/contact'
      const ctx = (window.APP_CONTEXT || '').trim();
      const endpoint = (ctx ? ctx : '') + '/contact';

      // Send as application/x-www-form-urlencoded so servlet can read req.getParameter(...)
      const body = new URLSearchParams({ name, email, message });
      const resp = await fetch(endpoint, {
        method: 'POST',
        headers: { 'Accept': 'application/json' },
        body: body
      });

      const json = await resp.json().catch(()=>({ status: 'error', message: 'Invalid JSON response' }));
      if(resp.ok && json.status === 'ok'){
        formStatus.textContent = '✅ Message sent!'; formStatus.classList.remove('error'); formStatus.classList.add('success'); contactForm.reset();
      } else {
        formStatus.textContent = json.message || ('Server error: ' + (resp.status||'unknown'));
        formStatus.classList.add('error');
      }
    } catch(err){
      console.error(err);
      formStatus.textContent = 'Network error. Please try later.';
      formStatus.classList.add('error');
    } finally{ setLoading(false); }
  });

})();
