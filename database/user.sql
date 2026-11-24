CREATE DATABASE testdb;
CREATE USER 'dev'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON testdb.* TO 'dev'@'localhost';
FLUSH PRIVILEGES;
ALTER USER 'dev'@'localhost' IDENTIFIED BY 'monNouveauMotDePasse';
