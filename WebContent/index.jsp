
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

  <!-- Styles -->
  <!-- Use JSP expression to resolve context path reliably at runtime -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/styles.css">
</head>
<body>

  <!-- Navbar (sticky) -->
  <nav class="navbar">
    <div class="nav-inner">
      <a class="brand" href="#home" aria-label="Go home">
        <span class="logo-mark"></span>
        <span class="name">Tuan Anh</span>
      </a>
      <ul class="nav-links">
        <li><a class="nav-link" href="#home">Home</a></li>
        <li><a class="nav-link" href="#project">Project</a></li>
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
          <a class="btn btn-cta nav-link" href="#project">View Projects</a>
          <a class="btn btn-ghost nav-link" href="#connect">Contact Me</a>
        </div>
      </div>
      <div class="avatar-wrap">
        <div class="avatar-ring">
          <div class="avatar"></div>
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
        <p class="section-sub">👤 Tổng quan về cá nhân, học vấn và kỹ năng</p>
      </header>

      <div class="profile-grid">
        <!-- Personal card -->
        <div class="profile-card card-personal">
          <div class="card-icon">👤</div>
          <h3 class="card-title">Lê Trần Tuấn Anh</h3>
          <p class="card-sub">Đại học Sư phạm Kỹ thuật TP.HCM (HCMUTE) — Khoa CNTT</p>

          <ul class="personal-list">
            <li><strong>Trường:</strong> Đại học Sư phạm Kỹ thuật TP. Hồ Chí Minh (HCMUTE)</li>
            <li><strong>Khoa:</strong> Công nghệ Thông tin</li>
            <li><strong>Chuyên ngành:</strong> Kỹ thuật Dữ liệu</li>
            <li><strong>Định hướng:</strong> Full-Stack Developer có nền tảng về dữ liệu</li>
          </ul>

          <p class="personal-desc" style="color:var(--muted-1);">
            Tôi là <strong>Lê Trần Tuấn Anh</strong>, sinh viên <strong>Kỹ thuật Dữ liệu</strong> tại HCMUTE.
            Với định hướng trở thành Full-Stack Developer, tôi tập trung vào phát triển các ứng dụng web hiện đại —
            kết hợp Frontend thân thiện, Backend mạnh mẽ và cơ sở dữ liệu được thiết kế tối ưu. Tôi có kinh nghiệm
            với Java Servlet, NestJS, Flask, SQL Server, PostgreSQL, MongoDB, và triển khai hệ thống thực tế bằng Docker, Flyway, AWS S3.
          </p>
        </div>

        <!-- Right column: education + skills -->
        <div class="profile-side">
          <div class="profile-card card-education">
            <div class="card-icon">🎓</div>
            <h3 class="card-title">Education</h3>
            <div class="edu-item">
              <strong>Đại học Sư phạm Kỹ thuật TP.HCM</strong>
              <div class="edu-sub">Khoa CNTT — Kỹ thuật Dữ liệu (2022–2026)</div>
              <div class="edu-list" style="color:var(--muted-1); margin-top:8px;">
                Môn tiêu biểu: Cơ sở dữ liệu, Lập trình Web, Điện toán đám mây, Hệ thống Dữ liệu Lớn, Học máy.
              </div>
            </div>
          </div>

          <div class="profile-card card-skills">
            <div class="card-icon">💻</div>
            <h3 class="card-title">Technical Skills</h3>

            <!-- Skills with progress bars -->
            <div class="skill-row">
              <div class="skill-meta"><span>Frontend</span><span class="skill-percent">65%</span></div>
              <div class="skill-bar" aria-hidden="true">
                <div class="skill-fill" style="--value:65%"></div>
              </div>
            </div>

            <div class="skill-row">
              <div class="skill-meta"><span>Backend</span><span class="skill-percent">70%</span></div>
              <div class="skill-bar" aria-hidden="true">
                <div class="skill-fill" style="--value:70%"></div>
              </div>
            </div>

            <div class="skill-row">
              <div class="skill-meta"><span>Web Development</span><span class="skill-percent">68%</span></div>
              <div class="skill-bar" aria-hidden="true">
                <div class="skill-fill" style="--value:68%"></div>
              </div>
            </div>

            <div class="skill-row">
              <div class="skill-meta"><span>SQL &amp; Database Design</span><span class="skill-percent">70%</span></div>
              <div class="skill-bar" aria-hidden="true">
                <div class="skill-fill" style="--value:70%"></div>
              </div>
            </div>

            <!-- tech tags -->
            <div style="margin-top:12px; display:flex; flex-wrap:wrap; gap:8px;">
              <span class="skill" style="background:transparent;color:var(--muted-1);border-radius:8px;padding:6px 8px;border:1px solid rgba(255,255,255,0.03)">Java 17</span>
              <span class="skill" style="background:transparent;color:var(--muted-1);border-radius:8px;padding:6px 8px;border:1px solid rgba(255,255,255,0.03)">NestJS</span>
              <span class="skill" style="background:transparent;color:var(--muted-1);border-radius:8px;padding:6px 8px;border:1px solid rgba(255,255,255,0.03)">Flask</span>
              <span class="skill" style="background:transparent;color:var(--muted-1);border-radius:8px;padding:6px 8px;border:1px solid rgba(255,255,255,0.03)">SQL Server</span>
              <span class="skill" style="background:transparent;color:var(--muted-1);border-radius:8px;padding:6px 8px;border:1px solid rgba(255,255,255,0.03)">PostgreSQL</span>
              <span class="skill" style="background:transparent;color:var(--muted-1);border-radius:8px;padding:6px 8px;border:1px solid rgba(255,255,255,0.03)">MongoDB</span>
              <span class="skill" style="background:transparent;color:var(--muted-1);border-radius:8px;padding:6px 8px;border:1px solid rgba(255,255,255,0.03)">Docker</span>
              <span class="skill" style="background:transparent;color:var(--muted-1);border-radius:8px;padding:6px 8px;border:1px solid rgba(255,255,255,0.03)">Flyway</span>
              <span class="skill" style="background:transparent;color:var(--muted-1);border-radius:8px;padding:6px 8px;border:1px solid rgba(255,255,255,0.03)">AWS S3</span>
              <span class="skill" style="background:transparent;color:var(--muted-1);border-radius:8px;padding:6px 8px;border:1px solid rgba(255,255,255,0.03)">Hadoop</span>
            </div>

            <!-- soft skills -->
            <h3 class="card-title" style="margin-top:14px;">Soft Skills</h3>
            <ul class="soft-skills" aria-label="Soft skills list">
              <li><span class="tag-icon">🤝</span><div><strong>Làm việc nhóm hiệu quả</strong><div style="color:var(--muted-1)">Phối hợp tốt qua workflow trên GitHub</div></div></li>
              <li><span class="tag-icon">🧠</span>
                <div><strong>Tư duy logic</strong><div style="color:var(--muted-1)">Chủ động phân tích và giải quyết vấn đề</div></div></li>
              <li><span class="tag-icon">📚</span><div><strong>Tự học nhanh</strong><div style="color:var(--muted-1)">Nghiên cứu công nghệ mới và áp dụng vào dự án</div></div></li>
              <li><span class="tag-icon">🗣️</span><div><strong>Giao tiếp rõ ràng</strong><div style="color:var(--muted-1)">Trình bày tài liệu và ý tưởng dễ hiểu</div></div></li>
              <li><span class="tag-icon">⏱️</span><div><strong>Quản lý thời gian</strong><div style="color:var(--muted-1)">Quản lý công việc hiệu quả trong đồ án học kỳ</div></div></li>
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
          <img class="avatar-img" src="<%=request.getContextPath()%>/assets/avatar.svg" alt="Avatar" />
        </div>
      </div>
      <div class="about-card">
        <p class="about-text">
          Tôi là <strong>Lê Trần Tuấn Anh</strong>, sinh viên <strong>Kỹ thuật Dữ liệu</strong> tại <strong>HCMUTE</strong>. 
          Đam mê Web Dev toàn diện, đặc biệt là <strong>Backend</strong> và <strong>Database</strong>. 
          Kinh nghiệm với Java Servlet, NestJS, Flask, SQL Server, PostgreSQL, MongoDB; triển khai Docker, Flyway, AWS S3.
        </p>
        <div class="skills">
          <span class="skill">Java 17</span>
          <span class="skill">SQL Server</span>
          <span class="skill">PostgreSQL</span>
          <span class="skill">Docker</span>
          <span class="skill">Hadoop</span>
          <span class="skill">NestJS</span>
          <span class="skill">MongoDB</span>
          <span class="skill">AWS S3</span>
        </div>
      </div>
    </div>
  </section>

  <!-- Projects -->
  <section id="project" class="section container">

    <h2 class="section-title reveal">Projects</h2>
    <p class="section-sub muted reveal">Selected projects — click to open each demo or repo.</p>

    <div class="projects-grid reveal">
      <article class="project-card guardian">
        <div class="project-media">NW</div>
        <h3 class="project-title">New Web Project</h3>
        <p class="project-desc">Personal new web project (GitHub repo).</p>
        <div class="project-actions"><a class="btn-sm btn-gh" href="https://github.com/tuanh250105/new_web_project" target="_blank">Repo</a></div>
      </article>

      <article class="project-card guardian">
        <div class="project-media">S1</div>
        <h3 class="project-title">Survey (ch04-ex1)</h3>
        <p class="project-desc">Deployed survey app.</p>
        <div class="project-actions"><a class="btn-sm btn-gh" href="https://ch04-ex1-survey-znrm.onrender.com/" target="_blank">Open</a></div>
      </article>

      <article class="project-card guardian">
        <div class="project-media">EA</div>
        <h3 class="project-title">Email App</h3>
        <p class="project-desc">Email app demo deployed.</p>
        <div class="project-actions"><a class="btn-sm btn-gh" href="https://email-app-chuong5.onrender.com/" target="_blank">Open</a></div>
      </article>

      <article class="project-card guardian">
        <div class="project-media">CH6</div>
        <h3 class="project-title">CH-06 Demo</h3>
        <p class="project-desc">Chapter 6 demo site.</p>
        <div class="project-actions"><a class="btn-sm btn-gh" href="https://ch-06.onrender.com/" target="_blank">Open</a></div>
      </article>

      <article class="project-card guardian">
        <div class="project-media">CW</div>
        <h3 class="project-title">Cart Web</h3>
        <p class="project-desc">Cart web demo (separate project).</p>
        <div class="project-actions"><a class="btn-sm btn-gh" href="https://cart-web-ggq6.onrender.com/" target="_blank">Open</a></div>
      </article>

      <article class="project-card guardian">
        <div class="project-media">C7</div>
        <h3 class="project-title">Cart & Download (ch07)</h3>
        <p class="project-desc">Cart and Download services for ch07 (two endpoints).</p>
        <div class="project-actions">
          <a class="btn-sm btn-gh" href="https://ch07-cart-8dig.onrender.com/" target="_blank">Cart</a>
          <a class="btn-sm btn-gh" href="https://ch07-download-wids.onrender.com/" target="_blank">Download</a>
        </div>
      </article>

      <article class="project-card guardian">
        <div class="project-media">D12</div>
        <h3 class="project-title">DMSO (ch12)</h3>
        <p class="project-desc">Chapter 12 demo site.</p>
        <div class="project-actions"><a class="btn-sm btn-gh" href="https://ch12-dmso.onrender.com/" target="_blank">Open</a></div>
      </article>
    </div>

  </section>


  <!-- Connect + Contact -->
  <section id="connect" class="section container contact">
    <!-- Socials -->
    <div class="contact-card reveal">
      <h2>Connect</h2>
      <p class="muted">Open to internships, collaborations, and tech discussions.</p>
      <div class="socials" style="margin-top:12px;">
        <a href="https://github.com/tuanh250105" target="_blank" aria-label="GitHub">GitHub</a>
        <a href="https://www.facebook.com/lttuananh25" target="_blank" aria-label="Facebook">Facebook</a>
        <a href="mailto:tuanh25012005@gmail.com" aria-label="Email">Gmail</a>
      </div>
    </div>

    <!-- Contact form -->
    <div class="contact-card reveal">
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
        <a href="https://github.com/tuanh250105" target="_blank" aria-label="GitHub">GH</a>
        <a href="https://www.facebook.com/lttuananh25" target="_blank" aria-label="Facebook">FB</a>
        <a href="mailto:tuanh25012005@gmail.com" aria-label="Email">Mail</a>
      </div>
    </div>
  </footer>

  <!-- Expose context path so script.js có thể xây endpoint đúng -->
  <script>window.APP_CONTEXT = '<%=request.getContextPath()%>';</script>

  <!-- JS (ensure these point to /assets/) -->
  <script src="<%=request.getContextPath()%>/assets/scripts.js"></script>
  <script src="<%=request.getContextPath()%>/assets/script.js"></script>

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
