TA_project_web
================

Ant-based Java web application scaffold (Servlet + JSP MVC) ready to build into a WAR and deploy to Tomcat.

Structure
- src/main/java/... : Java sources (servlets)
- WebContent/ : JSP pages + assets
- WebContent/WEB-INF/web.xml : servlet mappings
- build.xml : Ant build to compile & create WAR

Build & Run
1. Requirements:
   - JDK 11+ (javac)
   - Ant
   - Apache Tomcat

2. Build WAR:
   Open a terminal in `TA_project_web` and run:

   ant war

   The WAR will be created under `build/TA_project_web.war`.

3. Deploy to Tomcat:
   - Copy `build/TA_project_web.war` to Tomcat's `webapps/` folder.
   - Start Tomcat (or it will auto-deploy if running).
   - Open `http://localhost:8080/TA_project_web/`

Notes
- Contact form currently handled by `ContactServlet` which returns JSON. Integrate a mail service (JavaMail) or persistence as needed.
- Add more Java model/services under `src/main/java/com/ta/webapp/` as project grows.
