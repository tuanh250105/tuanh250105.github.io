#!/bin/sh
set -e

# If Render (or platform) provides PORT, replace connector port in server.xml
if [ -n "$PORT" ]; then
  echo "[entrypoint] Setting Tomcat port to $PORT"
  sed -i "s/port=\"8080\"/port=\"$PORT\"/g" "$CATALINA_HOME/conf/server.xml"
fi

# Remove any existing ROOT exploded folder or war to avoid conflicts
if [ -d "$CATALINA_HOME/webapps/ROOT" ]; then
  echo "[entrypoint] Removing existing ROOT folder"
  rm -rf "$CATALINA_HOME/webapps/ROOT"
fi
if [ -f "$CATALINA_HOME/webapps/ROOT.war" ]; then
  echo "[entrypoint] Removing existing ROOT.war"
  rm -f "$CATALINA_HOME/webapps/ROOT.war"
fi

# If build produced a WAR, copy it to Tomcat webapps as ROOT.war
if [ -f "/app/build/war/TA_project_web.war" ]; then
  echo "[entrypoint] Deploying app as ROOT.war"
  cp /app/build/war/TA_project_web.war "$CATALINA_HOME/webapps/ROOT.war"
fi

chown -R tomcat:tomcat "$CATALINA_HOME"

echo "[entrypoint] Starting Tomcat as tomcat user..."
# Drop privileges and run Tomcat as the 'tomcat' user. Use su to switch user.
exec su -s /bin/sh tomcat -c "$CATALINA_HOME/bin/catalina.sh run"
