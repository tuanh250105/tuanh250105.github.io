<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Contact — Lê Trần Tuấn Anh</title>
  <!-- Poppins font -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles.css">
</head>
<body>
  <main class="contact-page">
    <div class="container">
      <section class="section">
        <div class="contact-card center reveal">
          <h1 class="hero-title">Contact Me</h1>
          <p class="hero-sub">Có gì muốn chia sẻ? Gửi tin nhắn cho tôi — tôi sẽ trả lời sớm nhất có thể.</p>

          <form id="contactForm" class="contact-form" method="post" action="${pageContext.request.contextPath}/contact">
            <label for="name">Name</label>
            <input id="name" name="name" type="text" placeholder="Your full name" required />

            <label for="email">Email</label>
            <input id="email" name="email" type="email" placeholder="you@example.com" required />

            <label for="message">Message</label>
            <textarea id="message" name="message" rows="6" placeholder="Write your message (min 5 chars)" required></textarea>

            <div class="form-actions">
              <button id="sendBtn" class="btn btn-cta btn-send" type="submit">Send</button>
              <div id="formStatus" class="form-status" aria-live="polite"></div>
            </div>
          </form>
        </div>
      </section>
    </div>
  </main>

  <script src="${pageContext.request.contextPath}/assets/scripts.js"></script>
  <script>
    // Handle form with fetch to servlet
    (function(){
      const form = document.getElementById('contactForm');
      const sendBtn = document.getElementById('sendBtn');
      const statusEl = document.getElementById('formStatus');

      form.addEventListener('submit', async function(e){
        e.preventDefault();
        statusEl.textContent = '';
        sendBtn.disabled = true; sendBtn.classList.add('loading');
        sendBtn.textContent = 'Sending…';

        const data = new URLSearchParams(new FormData(form));

        try{
          const res = await fetch(form.action, {
            method: 'POST',
            headers: { 'Accept': 'application/json' },
            body: data
          });
          const json = await res.json();
          statusEl.textContent = json.message || 'No response';
          if (json.status === 'ok') {
            statusEl.classList.remove('error'); statusEl.classList.add('success');
            form.reset();
          } else {
            statusEl.classList.remove('success'); statusEl.classList.add('error');
          }
        } catch(err){
          statusEl.textContent = 'Network error. Please try later.';
          statusEl.classList.remove('success'); statusEl.classList.add('error');
        } finally{
          sendBtn.disabled = false; sendBtn.classList.remove('loading'); sendBtn.textContent = 'Send';
        }
      });
    })();
  </script>
</body>
</html>
