---

---

## TravelProject 运行环境

### Linux环境

```shell
ubuntu 16.04
```

## python依赖

[../requirements.txt]()

```shell
# 当前文件目录下的requirements.txt
pip3 install -r requirements.txt
```

### mysql数据库

```shell
mysql 5.7.33
```

### TravelProject运行步骤

#### mysql数据库信息

```shell
# 安装mysql
sudo apt-get install mysql-server mysql-client
# 创建数据库,导入当前文件下travel.sql
# 登录数据库
mysql -u root -p
# 创建数据库
create database travel;
# 导入数据文件
mysql -u root -p < travel.sql
```

#### python代码

```shell
# 运行程序
python3 manage.py runserver
```

