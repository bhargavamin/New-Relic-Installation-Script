#Script to install new relic on redhat and centos systems
#By Bhargav Amin Github username : bhargavamin


echo "Starting installation... Determining system Arch.."
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  # 64-bit
        echo "Configuring YUM repository for 64bit system"
        sudo rpm -Uvh https://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm
else
  # 32-bit
        echo "Configuring YUM repository for 32bit system"
        sudo rpm -Uvh https://yum.newrelic.com/pub/newrelic/el5/i386/newrelic-repo-5-3.noarch.rpm
fi

echo "Yum repository configured"

echo "Installing New relic agent"

sudo yum install newrelic-sysmond -y

echo "New Relic Agent Installed!"
echo "Enter you license key from your newrelic account :"
read license_key
sudo nrsysmond-config --set license_key=$license_key
#sudo nrsysmond-config --set license_key=4f6b0d4d574131576060507ecdd4554eac6c9881
echo "Starting New Relic on your system"
sudo /etc/init.d/newrelic-sysmond start
