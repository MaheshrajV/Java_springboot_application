# Spring Boot + MySQL + Nginx Reverse Proxy Setup

This project is a simple **Spring Boot REST API** connected to **MySQL**, served via **Nginx** as a reverse proxy.

## 📦 Project Structure
demo/ # Spring Boot project
├── src/main/java # Java source code
├── src/main/resources # Config and static files
├── pom.xml # Maven dependencies

yaml
## ⚙ Requirements
- **Java 17+**
- **Maven 3+**
- **MySQL** (running locally or remotely)
- **Nginx**
- **Git** (optional)
- **Linux or WSL** (recommended for setup)

---

## 1️⃣ Database Setup
1. Start MySQL and create the database:
    mysql -u root -p
    CREATE DATABASE employeedb;
    EXIT;
    ```

2. Update **`src/main/resources/application.properties`**:
    # MySQL configuration
    spring.datasource.url=jdbc:mariadb://localhost:3306/employeedb
    spring.datasource.username=root
    spring.datasource.password=YOUR_PASSWORD
    spring.datasource.driver-class-name=org.mariadb.jdbc.Driver

    # Hibernate
    spring.jpa.hibernate.ddl-auto=update
    spring.jpa.show-sql=true
    spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MariaDBDialect

    # Server
    server.port=8081
    server.address=0.0.0.0
    ```

---

## 2️⃣ Build & Run Spring Boot
mvn clean package
java -jar target/demo-0.0.1-SNAPSHOT.jar
Spring Boot will now run at:

arduino
http://localhost:8081
3️⃣ Nginx Reverse Proxy
Install Nginx:

sudo apt update
sudo apt install nginx -y
Create config file /etc/nginx/sites-available/springboot:

Enable the site:
sudo ln -s /etc/nginx/sites-available/springboot /etc/nginx/sites-enabled/
sudo nginx -t   # Test config
sudo systemctl restart nginx

4️⃣ Test the Setup
Start Spring Boot

Visit:
http://localhost/
Nginx will forward requests to Spring Boot running on port 8081.

5️⃣ Optional - HTTPS with Let's Encrypt
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d your-domain.com

📝 Notes
Static HTML can be placed in:
css
src/main/resources/static
and accessed directly via browser.

If you change server.port in Spring Boot, also update proxy_pass in Nginx.

🚀 Useful Commands
# Restart Spring Boot (if running manually)
CTRL + C to stop, then run:
mvn spring-boot:run

# Restart Nginx
sudo systemctl restart nginx

# Check logs
sudo tail -f /var/log/nginx/error.log
✅ Endpoints
Example:
curl http://localhost/employees   # Get all employees
curl http://localhost/health      # Health check

📌 Author
Developed by Mahesh
