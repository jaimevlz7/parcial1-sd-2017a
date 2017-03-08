package 'httpd'
package 'php'
package 'php-mysql' #Libreria para conectar php con mysql
package 'mysql' #Este el cliente de mysql

service 'httpd' do
 action [:enable, :start]
end

bash 'open port' do 
 code <<-EOH
 iptables -I INPUT 5 -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
 service iptables save
EOH
end

cookbook_file 'etc/httpd/conf.d/lb.conf' do
 source 'lb.conf'
 mode 0644
end

