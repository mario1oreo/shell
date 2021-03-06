echo "*******************************************"
echo "请输入要创建的镜像的名字"
echo "*******************************************"
read name
echo "*******************************************"
echo "正在拉取centos镜像"
echo "*******************************************"
docker pull centos
echo "*******************************************"
echo "正在创建镜像"
echo "*******************************************"
docker run -itd --name=$name -p 8888:8080 centos /bin/bash
echo "*******************************************"
echo "正在将宿主机Tomact、jdk上传到容器中"
echo "*******************************************"
docker cp apache-tomcat-7.0.47.tar.gz $name:/root/
docker cp jdk-8u161-linux-x64.tar.gz $name:/root/
docker cp create_tomcat_centos_images.sh $name:/root/
echo "*******************************************"
echo "进入镜像中"
echo "*******************************************"
docker exec -it $name /bin/bash