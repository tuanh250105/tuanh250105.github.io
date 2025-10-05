
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Lê Trần Tuấn Anh — Personal Portfolio</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  
  <!-- Fonts (tuỳ chọn) -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet" />
  <!-- Font Awesome for technology icons (CDN) - remove invalid SRI to avoid blocking -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous" />

  <!-- Styles -->
  <!-- Use JSP expression to resolve context path reliably at runtime -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/styles.css">
</head>
<body>

  <!-- Navbar (sticky) -->
  <nav class="navbar">
    <div class="nav-inner">
      <a class="brand" href="#home" aria-label="Go home">
  <span class="logo-mark" style="background-image: url('<%=request.getContextPath()%>/assets/IMG_0519_copy.jpg');"></span>
        <span class="name">Tuan Anh</span>
      </a>
      <ul class="nav-links">
        <li><a class="nav-link" href="#home">Home</a></li>
  <li><a class="nav-link" href="#homework">Homework</a></li>
        <li><a class="nav-link" href="#connect">Connect</a></li>
      </ul>
    </div>
  </nav>

  <!-- Hero / Home -->
  <section id="home" class="section hero">
    <div class="hero-inner reveal">
      <div>
        <h1 class="hero-title">Hi, I’m Tuan Anh — Data Engineering Student</h1>
        <p class="hero-sub">I’m passionate about backend systems, databases, big data, and cloud technologies.</p>
        <div class="hero-ctas">
          <a class="btn btn-cta nav-link" href="#homework">View Homework</a>
          <a class="btn btn-ghost nav-link" href="#connect">Contact Me</a>
        </div>
      </div>
      <div class="avatar-wrap">
        <div class="avatar-ring">
          <div class="avatar">
      <img class="face-center" src="<%=request.getContextPath()%>/assets/IMG_0519_copy.jpg" alt="Avatar"
        onerror="this.onerror=null;this.style.display='none';const p=this.parentElement; p.classList.add('img-missing'); p.innerHTML='<div class=\'avatar-fallback\'>TA</div>';" />
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- About (ngắn gọn) -->
  <!-- Profile section (user requested complete profile) -->
  <section id="profile" class="section profile-section reveal">
    <div class="container profile-inner">
      <header class="profile-header">
        <h2 class="section-title">Profile</h2>
        <p class="section-sub">👤 Brief overview of background, education, and skills</p>
      </header>

      <div class="profile-grid">
        <!-- Personal card -->
        <div class="profile-card card-personal">
          <div class="card-icon">👤</div>
          <h3 class="card-title">Lê Trần Tuấn Anh</h3>
          <p class="card-sub">Ho Chi Minh City University of Technology and Education (HCMUTE) — Department of Information Technology</p>

          <ul class="personal-list">
            <li><strong>School:</strong> Ho Chi Minh City University of Technology and Education (HCMUTE)</li>
            <li><strong>Department:</strong> Information Technology</li>
            <li><strong>Major:</strong> Data Engineering</li>
            <li><strong>Focus:</strong> Full-Stack Developer with a data foundation</li>
          </ul>

          <p class="personal-desc" style="color:var(--muted-1);">
            I’m <strong>Lê Trần Tuấn Anh</strong>, a Data Engineering student at HCMUTE. I build modern full‑stack web applications and data systems; my core technologies include:
            Frontend — HTML, CSS, JavaScript, React, Tailwind CSS, Chart.js; Backend — Java Servlet, Node.js (Express, NestJS), Flask, Docker, AWS S3; Data Engineering — SQL Server, PostgreSQL, MongoDB, Hadoop, Python, Flyway, and ETL tools.
          </p>
        </div>

        <!-- Right column: education + skills -->
        <div class="profile-side">
          <div class="profile-card card-education">
            <div class="card-icon">🎓</div>
            <h3 class="card-title">Education</h3>
            <div class="edu-item">
              <strong>Ho Chi Minh City University of Technology and Education (HCMUTE)</strong>
              <div class="edu-sub">Department of Information Technology — Data Engineering (2022–2026)</div>
              <div class="edu-list" style="color:var(--muted-1); margin-top:8px;">Notable coursework: Databases, Web Programming, Cloud Computing, Big Data Systems, Machine Learning.</div>
            </div>
          </div>

          <div class="profile-card card-skills">
            <div class="card-icon">💻</div>
            <!-- Soft skills only here (technical skills detailed below in the Skills section) -->
            <h3 class="card-title" style="margin-top:6px;">Soft Skills</h3>
            <ul class="soft-skills" aria-label="Soft skills list">
              <li><span class="tag-icon"><i class="fas fa-users"></i></span><div><strong>Effective Teamwork</strong><div style="color:var(--muted-1)">Collaborates effectively using GitHub workflows</div></div></li>
              <li><span class="tag-icon"><i class="fas fa-lightbulb"></i></span>
                <div><strong>Analytical Thinking</strong><div style="color:var(--muted-1)">Proactively analyzes and resolves problems</div></div></li>
              <li><span class="tag-icon"><i class="fas fa-book-open"></i></span><div><strong>Quick Learner</strong><div style="color:var(--muted-1)">Researches new technologies and applies them to homework</div></div></li>
              <li><span class="tag-icon"><i class="fas fa-comments"></i></span><div><strong>Clear Communication</strong><div style="color:var(--muted-1)">Documents and presents ideas clearly</div></div></li>
              <li><span class="tag-icon"><i class="fas fa-clock"></i></span><div><strong>Time Management</strong><div style="color:var(--muted-1)">Effectively managing tasks and deadlines during semester homework</div></div></li>
            </ul>

          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="section container">
    <div class="about reveal">
      <div class="avatar-frame">
        <div class="avatar-border">
    <img class="avatar-img face-center" src="<%=request.getContextPath()%>/assets/IMG_0519_copy.jpg" alt="Avatar"
      onerror="this.onerror=null;this.style.display='none';const p=this.parentElement; p.classList.add('img-missing'); p.innerHTML='<div class=\'avatar-fallback\'>TA</div>';" />
        </div>
      </div>
      <div class="about-card">
        <!-- About paragraph removed (merged into the Profile section to avoid repetition) -->
        <div class="skills-grid">
          <!-- Frontend -->
          <div class="skill-cat reveal">
            <h4 class="skill-cat-title">Frontend</h4>
            <div class="tech-row"><i class="fab fa-html5"></i><span>HTML</span></div>
            <div class="tech-row"><i class="fab fa-css3-alt"></i><span>CSS</span></div>
            <div class="tech-row"><i class="fab fa-js-square"></i><span>JavaScript</span></div>
            <div class="tech-row"><i class="fab fa-react"></i><span>React</span></div>
            <div class="tech-row"><i class="fas fa-layer-group"></i><span>Tailwind CSS</span></div>
            <div class="tech-row"><i class="fas fa-chart-line"></i><span>Chart.js</span></div>
            <div class="skill-bar" aria-hidden="true"><div class="skill-fill" style="--value:65%"></div></div>
          </div>

          <!-- Backend -->
          <div class="skill-cat reveal">
            <h4 class="skill-cat-title">Backend</h4>
            <div class="tech-row"><i class="fab fa-java"></i><span>Java Servlet</span></div>
            <div class="tech-row"><i class="fab fa-node-js"></i><span>Node.js</span></div>
            <div class="tech-row"><i class="fas fa-code-branch"></i><span>NestJS</span></div>
            <div class="tech-row"><i class="fas fa-share-alt"></i><span>Express</span></div>
            <div class="tech-row"><i class="fas fa-flask"></i><span>Flask</span></div>
            <div class="tech-row"><i class="fab fa-docker"></i><span>Docker</span></div>
            <div class="tech-row"><i class="fas fa-cloud-upload-alt"></i><span>AWS S3</span></div>
            <div class="skill-bar" aria-hidden="true"><div class="skill-fill" style="--value:70%"></div></div>
          </div>

          <!-- Data Engineering -->
          <div class="skill-cat reveal">
            <h4 class="skill-cat-title">Data Engineering</h4>
            <div class="tech-row"><i class="fas fa-server"></i><span>SQL Server</span></div>
            <div class="tech-row"><i class="fas fa-database"></i><span>PostgreSQL</span></div>
            <div class="tech-row"><i class="fas fa-database"></i><span>MongoDB</span></div>
            <div class="tech-row"><i class="fas fa-network-wired"></i><span>Hadoop</span></div>
            <div class="tech-row"><i class="fab fa-python"></i><span>Python</span></div>
            <div class="tech-row"><i class="fas fa-exchange-alt"></i><span>Flyway</span></div>
            <div class="tech-row"><i class="fas fa-project-diagram"></i><span>ETL tools</span></div>
            <div class="skill-bar" aria-hidden="true"><div class="skill-fill" style="--value:68%"></div></div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Homework -->
  <section id="homework" class="section container">

    <h2 class="section-title reveal">Homework</h2>
    <p class="section-sub muted reveal">Selected homework — click to open each demo or repo.</p>

    <div class="projects-grid reveal">
      <article class="project-card guardian proj-purple">
        <div class="project-media">NW</div>
  <h3 class="project-title">New Web Homework</h3>
  <p class="project-desc">Personal new web homework (GitHub repo).</p>
        <div class="project-actions"><a class="btn-sm btn-gh" href="https://github.com/tuanh250105/new_web_project" target="_blank">Repo</a></div>
      </article>

      <article class="project-card guardian proj-purple">
        <div class="project-media">S1</div>
  <h3 class="project-title">Survey (ch04-ex1)</h3>
  <p class="project-desc">Deployed homework app.</p>
        <div class="project-actions"><a class="btn-sm btn-gh" href="https://ch04-ex1-survey-znrm.onrender.com/" target="_blank">Open</a></div>
      </article>

      <article class="project-card guardian proj-purple">
        <div class="project-media">EA</div>
  <h3 class="project-title">Email App</h3>
  <p class="project-desc">Email homework demo deployed.</p>
        <div class="project-actions"><a class="btn-sm btn-gh" href="https://email-app-chuong5.onrender.com/" target="_blank">Open</a></div>
      </article>

      <article class="project-card guardian proj-purple">
        <div class="project-media">CH6</div>
  <h3 class="project-title">CH-06 Demo</h3>
  <p class="project-desc">Chapter 6 homework site.</p>
        <div class="project-actions"><a class="btn-sm btn-gh" href="https://ch-06.onrender.com/" target="_blank">Open</a></div>
      </article>

      <article class="project-card guardian proj-purple">
        <div class="project-media">CW</div>
  <h3 class="project-title">Cart Web</h3>
  <p class="project-desc">Cart web homework (separate homework).</p>
        <div class="project-actions"><a class="btn-sm btn-gh" href="https://cart-web-ggq6.onrender.com/" target="_blank">Open</a></div>
      </article>

      <article class="project-card guardian proj-purple">
        <div class="project-media">C7</div>
  <h3 class="project-title">Cart & Download (ch07)</h3>
  <p class="project-desc">Cart and Download homework for ch07 (two endpoints).</p>
        <div class="project-actions">
          <a class="btn-sm btn-gh" href="https://ch07-cart-8dig.onrender.com/" target="_blank">Cart</a>
          <a class="btn-sm btn-gh" href="https://ch07-download-wids.onrender.com/" target="_blank">Download</a>
        </div>
      </article>

      <article class="project-card guardian proj-purple">
        <div class="project-media">D12</div>
  <h3 class="project-title">DMSO (ch12)</h3>
  <p class="project-desc">Chapter 12 homework site.</p>
        <div class="project-actions"><a class="btn-sm btn-gh" href="https://ch12-dmso.onrender.com/" target="_blank">Open</a></div>
      </article>
    </div>

  </section>


  <!-- Connect + Contact -->
  <section id="connect" class="section container contact">
    <!-- Socials -->
  <div class="contact-card reveal connect-card">
      <h2>Connect</h2>
      <p class="muted">Open to internships, collaborations, and tech discussions.</p>
      <div class="socials" style="margin-top:12px;">
        <a href="https://github.com/tuanh250105" target="_blank" aria-label="GitHub" class="social-link">
          <!-- GitHub SVG (inlined) -->
          <svg class="social-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M12 .5C5.73.5.75 5.48.75 11.75c0 4.95 3.2 9.15 7.64 10.63.56.1.76-.24.76-.53 0-.26-.01-.96-.01-1.89-3.11.68-3.77-1.5-3.77-1.5-.51-1.3-1.25-1.65-1.25-1.65-1.02-.7.08-.69.08-.69 1.13.08 1.73 1.16 1.73 1.16 1 1.71 2.62 1.22 3.26.93.1-.72.39-1.22.71-1.5-2.48-.28-5.09-1.24-5.09-5.52 0-1.22.44-2.22 1.15-3-.12-.28-.5-1.4.11-2.92 0 0 .94-.3 3.08 1.15a10.8 10.8 0 0 1 2.8-.38c.95.01 1.9.13 2.8.38 2.14-1.46 3.08-1.15 3.08-1.15.61 1.52.23 2.64.12 2.92.72.78 1.15 1.78 1.15 3 0 4.29-2.62 5.24-5.11 5.52.4.35.76 1.03.76 2.08 0 1.5-.01 2.71-.01 3.08 0 .29.2.64.77.53C19.05 20.9 22.25 16.7 22.25 11.75 22.25 5.48 18.27.5 12 .5z"/></svg>
        </a>
        <a href="https://www.facebook.com/lttuananh25" target="_blank" aria-label="Facebook" class="social-link">
          <!-- Facebook SVG (inlined) -->
          <svg class="social-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M22 12a10 10 0 1 0-11.5 9.9v-7h-2.2v-2.9h2.2V9.3c0-2.2 1.3-3.4 3.3-3.4.95 0 1.9.17 1.9.17v2.1h-1.06c-1.05 0-1.38.66-1.38 1.33v1.6h2.35l-.38 2.9h-1.97v7A10 10 0 0 0 22 12z"/></svg>
        </a>
        <a href="mailto:tuanh25012005@gmail.com" aria-label="Email" class="social-link">
          <!-- Mail SVG (inlined) -->
          <svg class="social-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M12 13.5L2 6.75V18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V6.75L12 13.5z" opacity=".9"/><path d="M22 5H2a1 1 0 0 0-1 1v.04L12 12l11-5.96V6a1 1 0 0 0-1-1z"/></svg>
        </a>
      </div>
    </div>

    <!-- Contact form -->
  <div class="contact-card reveal contact-card--form">
      <h2>Contact</h2>
  <form id="contactForm" class="contact-form" action="<%=request.getContextPath()%>/contact" method="post" onsubmit="return false;">
        <label for="name">Name</label>
        <input id="name" name="name" placeholder="Your name" required />

        <label for="email">Email</label>
        <input id="email" name="email" type="email" placeholder="your@email.com" required />

        <label for="message">Message</label>
        <textarea id="message" name="message" rows="4" placeholder="Say hello…" required></textarea>

          <div style="margin-top:12px; display:flex; align-items:center; gap:10px;">
          <button id="sendBtn" type="button" class="btn btn-send"><span id="sendLabel">Send</span></button>
          <span id="formStatus" class="form-status" aria-live="polite"></span>
        </div>
      </form>
    </div>
  </section>

  <!-- Footer -->
  <footer class="site-footer">
    <div class="footer-inner">
      <small class="copyright">© 2025 Lê Trần Tuấn Anh — All Rights Reserved</small>
      <div class="socials">
        <a href="https://github.com/tuanh250105" target="_blank" aria-label="GitHub" class="social-link">
          <svg class="social-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M12 .5C5.73.5.75 5.48.75 11.75c0 4.95 3.2 9.15 7.64 10.63.56.1.76-.24.76-.53 0-.26-.01-.96-.01-1.89-3.11.68-3.77-1.5-3.77-1.5-.51-1.3-1.25-1.65-1.25-1.65-1.02-.7.08-.69.08-.69 1.13.08 1.73 1.16 1.73 1.16 1 1.71 2.62 1.22 3.26.93.1-.72.39-1.22.71-1.5-2.48-.28-5.09-1.24-5.09-5.52 0-1.22.44-2.22 1.15-3-.12-.28-.5-1.4.11-2.92 0 0 .94-.3 3.08 1.15a10.8 10.8 0 0 1 2.8-.38c.95.01 1.9.13 2.8.38 2.14-1.46 3.08-1.15 3.08-1.15.61 1.52.23 2.64.12 2.92.72.78 1.15 1.78 1.15 3 0 4.29-2.62 5.24-5.11 5.52.4.35.76 1.03.76 2.08 0 1.5-.01 2.71-.01 3.08 0 .29.2.64.77.53C19.05 20.9 22.25 16.7 22.25 11.75 22.25 5.48 18.27.5 12 .5z"/></svg>
        </a>
        <a href="https://www.facebook.com/lttuananh25" target="_blank" aria-label="Facebook" class="social-link">
          <svg class="social-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M22 12a10 10 0 1 0-11.5 9.9v-7h-2.2v-2.9h2.2V9.3c0-2.2 1.3-3.4 3.3-3.4.95 0 1.9.17 1.9.17v2.1h-1.06c-1.05 0-1.38.66-1.38 1.33v1.6h2.35l-.38 2.9h-1.97v7A10 10 0 0 0 22 12z"/></svg>
        </a>
        <a href="mailto:tuanh25012005@gmail.com" aria-label="Email" class="social-link">
          <svg class="social-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M12 13.5L2 6.75V18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V6.75L12 13.5z" opacity=".9"/><path d="M22 5H2a1 1 0 0 0-1 1v.04L12 12l11-5.96V6a1 1 0 0 0-1-1z"/></svg>
        </a>
      </div>
    </div>
  </footer>

  <!-- Expose context path so script.js can construct endpoints correctly -->
  <script>window.APP_CONTEXT = '<%=request.getContextPath()%>';</script>

  <!-- JS (ensure these point to /assets/) -->
  <script src="<%=request.getContextPath()%>/assets/scripts.js"></script>
  <script src="<%=request.getContextPath()%>/assets/script.js"></script>
  <script src="<%=request.getContextPath()%>/assets/fa-fallback.js"></script>

  <!-- Debug helper: quick link to the stylesheet and a fetch tester -->
  <!-- Profile reveal / progress animation helper -->
  <script>
    (function(){
      const profile = document.querySelector('.profile-section');
      if(!profile) return;
      const revealCb = (entries, obs) => {
        entries.forEach(e => {
          if(e.isIntersecting) {
            e.target.classList.add('visible');
            // animate each skill-fill using its inline --value
            document.querySelectorAll('.skill-fill').forEach(el=>{
              const v = el.style.getPropertyValue('--value') || el.getAttribute('data-value') || '';
              if(!v) return;
              // force reflow then set width so transition happens
              void el.offsetWidth;
              el.style.width = v.trim();
            });
            obs.unobserve(e.target);
          }
        });
      };
      if('IntersectionObserver' in window){
        const io = new IntersectionObserver(revealCb, {threshold: 0.12});
        io.observe(profile);
      } else {
        profile.classList.add('visible');
        document.querySelectorAll('.skill-fill').forEach(el=> el.style.width = el.style.getPropertyValue('--value') || el.getAttribute('data-value') || '0%');
      }
    })();
  </script>
</body>
</html>
