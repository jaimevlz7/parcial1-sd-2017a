package 'mysql-server'

bash 'extract_module' do
    code <<-EOH
    iptables -I INPUT 5 -p tcp -m state --state NEW -m tcp --dport 3306 -j ACCEPT
    service iptables save
    EOH
end

service 'mysqld' do
 action [:enable, :start]
end

package 'expect'

template '/tmp/configure_mysql.sh' do
	source 'configure_mysql.sh.erb'
	mode 0777
	variables(
	password_db: node[:db][:password_db]
	)
end

bash 'configure mysql' do
	cwd '/tmp'
	code <<-EOH
	./configure_mysql.sh
	EOH
end

template '/tmp/create_schema.sql' do
	source 'create_schema.sql.erb'
	mode 0777
	variables(
	usuarioweb_db: node[:db][:usuarioweb_db],
	ip_db: node[:db][:ip_db],
	ip_db1: node[:db][:ip_db1],
	passwordweb_db: node[:db][:passwordweb_db]
	)
end

bash 'create schema' do 
	cwd '/tmp'
	code <<-EOH
	cat create_schema.sql | mysql -u root -pdistribuidos
	EOH
end

