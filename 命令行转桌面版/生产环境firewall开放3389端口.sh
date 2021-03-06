echo "*******************************************************************************"
echo " 判断防火墙为是否为firewall，是则开放端口3389，否则进行下一步"
echo "*******************************************************************************"
firewall-cmd    --state>/dev/null 2&>1
if [ $? -ne 0 ]; then
	echo "*******************************************************************************"
	echo " 配置防火墙开放3389端口"
	echo "*******************************************************************************"
	firewall-cmd --permanent --zone=public --add-port=3389/tcp
	firewall-cmd --reload
	echo "*******************************************************************************"
	echo " 配置防火墙开放3389端口成功"
	echo " 临时关闭防火墙可以使用systemctl stop firewalld"
	echo " 禁止开机启动systemctl disable firewalld"
	echo "*******************************************************************************"
else
echo "*******************************************************************************"
	echo "firewall 没运行"
	echo "*******************************************************************************"  
fi