## 编译说明

- 基于davinci[作者开源地址](https://github.com/edp963/davinci)，使用docker环境封装而成

## 编译方法：

1. 安装docker,docker-compose
2. 下载最新版的davinci[下载地址](https://github.com/edp963/davinci/releases)

3. 修改`davinci/bin/davinci.sql`，在最前面增加两句代码

   ```shell
   create database `davinci` default character set utf8 collate utf8_general_ci;
   USE davinci;
   ```

4. 复制`davinci/bin/start-server.sh`为`davinci/bin/init-server.sh`,最前面加入几行代码，防止mysql的数据库还没有创建成功导致bi访问失败。

   ```shell
   echo "等待mysql数据库创建完成后再执行"
   echo "wait 45s"
   sleep 45s
   #start server
   ```

5. 修改`davinci/cofig/application.yml`,也可以直接用我的，我是修改了host,mysql,redis,email信息，最好email用你自己的。

6. 之后直接在根目录文件夹，终端环境下输入以下指令编译image

   `docker-compose build`

   输入`docker images`,将会看到生成davinci_davinci与davinci_mysql两个镜像。

7. 输入`docker-compose up`则将启动环境，首次启动大概需要1分钟，请耐心等待。

## 成品分享

- davinci_davinci

  ```shelll
  docker pull registry.cn-hangzhou.aliyuncs.com/tlntin/davinci_davinci
  ```

- davinci_mysql

  ```shell
  docker pull registry.cn-hangzhou.aliyuncs.com/tlntin/davinci_mysql
  ```

  

