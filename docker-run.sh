#!/bin/bash

# 🐳 Docker deployment script cho TA Project Web

echo "🚀 Starting TA Project Web Docker deployment..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    print_error "Docker is not running. Please start Docker first."
    exit 1
fi

# Check if docker-compose is available
if ! command -v docker-compose &> /dev/null; then
    print_error "docker-compose is not installed. Please install docker-compose first."
    exit 1
fi

# Create necessary directories
print_status "Creating necessary directories..."
mkdir -p logs
mkdir -p config
mkdir -p ssl

# Build and start services
print_status "Building and starting services..."

# Parse command line arguments
SERVICES=""
while [[ $# -gt 0 ]]; do
    case $1 in
        --with-database)
            SERVICES="$SERVICES --profile with-database"
            shift
            ;;
        --with-cache)
            SERVICES="$SERVICES --profile with-cache"
            shift
            ;;
        --with-nginx)
            SERVICES="$SERVICES --profile with-nginx"
            shift
            ;;
        --build)
            docker-compose build
            shift
            ;;
        --down)
            docker-compose down
            print_success "Services stopped successfully!"
            exit 0
            ;;
        --logs)
            docker-compose logs -f
            exit 0
            ;;
        --help)
            echo "Usage: $0 [OPTIONS]"
            echo "Options:"
            echo "  --with-database    Include MySQL database"
            echo "  --with-cache       Include Redis cache"
            echo "  --with-nginx       Include Nginx reverse proxy"
            echo "  --build            Force rebuild images"
            echo "  --down             Stop all services"
            echo "  --logs             Show logs"
            echo "  --help             Show this help message"
            exit 0
            ;;
        *)
            print_warning "Unknown option: $1"
            shift
            ;;
    esac
done

# Start services
if [ -n "$SERVICES" ]; then
    print_status "Starting services with profiles: $SERVICES"
    docker-compose up -d $SERVICES
else
    print_status "Starting basic webapp service..."
    docker-compose up -d webapp
fi

# Wait for services to be ready
print_status "Waiting for services to be ready..."
sleep 10

# Check service health
print_status "Checking service health..."
if docker-compose ps | grep -q "Up (healthy)"; then
    print_success "All services are running and healthy!"
else
    print_warning "Some services may not be fully ready yet. Check logs with: docker-compose logs"
fi

# Show service URLs
echo ""
print_success "🎉 Deployment completed!"
echo ""
echo "📋 Service URLs:"
echo "   Web Application: http://localhost:8080"
if docker-compose ps | grep -q "nginx.*Up"; then
    echo "   Nginx Proxy:     http://localhost:80"
fi
if docker-compose ps | grep -q "mysql.*Up"; then
    echo "   MySQL Database:  localhost:3306"
fi
if docker-compose ps | grep -q "redis.*Up"; then
    echo "   Redis Cache:     localhost:6379"
fi
echo ""
echo "📝 Useful commands:"
echo "   View logs:        docker-compose logs -f"
echo "   Stop services:    docker-compose down"
echo "   Restart:          docker-compose restart"
echo "   Scale webapp:     docker-compose up -d --scale webapp=3"
echo ""
