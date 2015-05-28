# Install puppetserver 4
echo "Installing puppetserver ..."
yum install -y puppetserver

# Install configuration files
echo "Copying configuration files ..."
cp /vagrant/vagrant/server/*.conf /etc/puppetlabs/puppet
cp /vagrant/vagrant/server/conf.d/*.conf /etc/puppetlabs/puppetserver/conf.d
cp /vagrant/vagrant/etc/puppet.sh /etc/profile.d

# Disable iptables
echo "Disabling iptables ..."
chkconfig iptables off
service iptables stop

# Ensure service is configured for auto-start
echo "Starting puppetserver ..."
chkconfig puppetserver on
service puppetserver start
