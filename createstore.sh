echo "name your store"
read your_domain
sudo mkdir /var/www/$your_domain
sudo chown -R $USER:$USER /var/www/$your_domain
sudo chmod -R 755 /var/www/$your_domain
sudo cp ./index.html /var/www/$your_domain
sudo touch /etc/apache2/sites-available/$your_domain.conf
sudo chmod 777 /etc/apache2/sites-available/$your_domain.conf
# sudo cat > /etc/apache2/sites-available/$your_domain.conf <<'endmsg'
# <VirtualHost *:80>
#     ServerAdmin webmaster@localhost
#     ServerName $your_domain
#     ServerAlias www.$your_domain
#     DocumentRoot /var/www/$your_domain
#     ErrorLog ${APACHE_LOG_DIR}/error.log
#     CustomLog ${APACHE_LOG_DIR}/access.log combined
# </VirtualHost>
# endmsg
sudo -- sh -c "echo '<VirtualHost *:80>
	    ServerAdmin webmaster@localhost
	    ServerName $your_domain
	    ServerAlias www.$your_domain
	    DocumentRoot /var/www/$your_domain
	    ErrorLog ${APACHE_LOG_DIR}/error.log
	    CustomLog ${APACHE_LOG_DIR}/access.log combined
 </VirtualHost>'" >> /etc/apache2/sites-available/$your_domain.conf
sudo a2ensite $your_domain.conf
sudo apache2ctl configtest
sudo systemctl reload apache2
# sudo systemctl restart apache2
sudo -- sh -c "echo '10.0.2.15 $your_domain' >> /etc/hosts"
sudo curl $your_domain
