@echo off
REM 🐳 Docker deployment script cho TA Project Web (Windows)

echo 🚀 Starting TA Project Web Docker deployment...

REM Check if Docker is running
docker info >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Docker is not running. Please start Docker first.
    exit /b 1
)

REM Check if docker-compose is available
docker-compose --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] docker-compose is not installed. Please install docker-compose first.
    exit /b 1
)

REM Create necessary directories
echo [INFO] Creating necessary directories...
if not exist logs mkdir logs
if not exist config mkdir config
if not exist ssl mkdir ssl

REM Parse command line arguments
set SERVICES=
set FORCE_BUILD=
set SHOW_LOGS=
set STOP_SERVICES=

:parse_args
if "%~1"=="" goto start_services
if "%~1"=="--with-database" (
    set SERVICES=%SERVICES% --profile with-database
    shift
    goto parse_args
)
if "%~1"=="--with-cache" (
    set SERVICES=%SERVICES% --profile with-cache
    shift
    goto parse_args
)
if "%~1"=="--with-nginx" (
    set SERVICES=%SERVICES% --profile with-nginx
    shift
    goto parse_args
)
if "%~1"=="--build" (
    set FORCE_BUILD=1
    shift
    goto parse_args
)
if "%~1"=="--down" (
    set STOP_SERVICES=1
    shift
    goto parse_args
)
if "%~1"=="--logs" (
    set SHOW_LOGS=1
    shift
    goto parse_args
)
if "%~1"=="--help" (
    echo Usage: %0 [OPTIONS]
    echo Options:
    echo   --with-database    Include MySQL database
    echo   --with-cache       Include Redis cache
    echo   --with-nginx       Include Nginx reverse proxy
    echo   --build            Force rebuild images
    echo   --down             Stop all services
    echo   --logs             Show logs
    echo   --help             Show this help message
    exit /b 0
)
echo [WARNING] Unknown option: %~1
shift
goto parse_args

:start_services
if "%STOP_SERVICES%"=="1" (
    docker-compose down
    echo [SUCCESS] Services stopped successfully!
    exit /b 0
)

if "%SHOW_LOGS%"=="1" (
    docker-compose logs -f
    exit /b 0
)

REM Force rebuild if requested
if "%FORCE_BUILD%"=="1" (
    echo [INFO] Force rebuilding images...
    docker-compose build
)

REM Start services
if not "%SERVICES%"=="" (
    echo [INFO] Starting services with profiles:%SERVICES%
    docker-compose up -d %SERVICES%
) else (
    echo [INFO] Starting basic webapp service...
    docker-compose up -d webapp
)

REM Wait for services to be ready
echo [INFO] Waiting for services to be ready...
timeout /t 10 /nobreak >nul

REM Check service health
echo [INFO] Checking service health...
docker-compose ps | findstr "Up (healthy)" >nul
if errorlevel 1 (
    echo [WARNING] Some services may not be fully ready yet. Check logs with: docker-compose logs
) else (
    echo [SUCCESS] All services are running and healthy!
)

REM Show service URLs
echo.
echo [SUCCESS] 🎉 Deployment completed!
echo.
echo 📋 Service URLs:
echo    Web Application: http://localhost:8080
docker-compose ps | findstr "nginx.*Up" >nul
if not errorlevel 1 (
    echo    Nginx Proxy:     http://localhost:80
)
docker-compose ps | findstr "mysql.*Up" >nul
if not errorlevel 1 (
    echo    MySQL Database:  localhost:3306
)
docker-compose ps | findstr "redis.*Up" >nul
if not errorlevel 1 (
    echo    Redis Cache:     localhost:6379
)
echo.
echo 📝 Useful commands:
echo    View logs:        docker-compose logs -f
echo    Stop services:    docker-compose down
echo    Restart:          docker-compose restart
echo    Scale webapp:     docker-compose up -d --scale webapp=3
echo.

pause
