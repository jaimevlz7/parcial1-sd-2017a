package 'Install Apache' do
  case node[:platform]
  when 'redhat', 'centos'
    package_name 'httpd'
  when 'ubuntu', 'debian'
    package_name 'apache2'
  end
end

service "httpd" do
 case node[:platform]
  when 'redhat', 'centos'
    service_name 'httpd'
  when 'ubuntu', 'debian'
    service_name 'apache2'
  end
  action :start
end

bash 'extract_module' do
    code <<-EOH
    iptables -I INPUT 5 -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
    service iptables save
    cd /var/www/html/
    wget -O /var/www/html/index.html www.icesi.edu.co
    EOH
end
