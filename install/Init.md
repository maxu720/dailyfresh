## 初始化环境

```
docker 环境：
	mysql:
	
		docker run -ti -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root mysql:5.7
		
	redis:
	
		docker run -ti -p 6379:6379 redis
	
    
	
	fdfs
	
		镜像
			
            fastdfs-tracker

                cd wl-rancher-catalog/dockerfiles/fastdfs/fastdfs-tracker
                docker build -t fastdfs_tracker .

            fastdfs-storage

                cd wl-rancher-catalog/dockerfiles/fastdfs/fastdfs-storage
                docker build -t fastdfs_storage .
		
		运行
			
			docker run -ti --rm --name tracker -p 22122:22122 fastdfs_tracker

			docker run -ti --rm --name storage --link tracker:tracker -p 80:80 -e TRACKER=tracker fastdfs_storage
	
		
依赖包：
	
	fdfs_client：

        apt-get install gcc
        pip install fdfs_client
        
	
初始化数据库：
	
	create database dailyfresh_23
	导入数据文件：
		install/dailyfresh_23.sql
		
修改程序配置：
	
	修改数据库地址：
		dailyfresh_23/settings.py
			
     修改celery 使用redis地址：
     	/celery_tasks/tasks.py 
     	
运行程序：
	启动celery 任务：
	https://blog.csdn.net/michael_lbs/article/details/74923367
	
		 初始化dj celery表：
		 	python manage.py migrate djcelery
		 	
		 python manage.py celery worker -l info
		 

	创建dj管理员密码：
		python manange.py createsuperuser
	
```

