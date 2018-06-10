## 初始化环境

```
docker 环境：
	mysql:
	
		docker run -ti -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root mysql:5.7
		
	redis:
	
		docker run -ti -p 6379:6379 redis
	
    
	
	fdfs
	
	
		Run as a tracker
            docker run -d --name tracker -v ~/data/fastdfs/tracker:/data/tracker -p 22122:22122 fdfs_tracker
            
           https://github.com/phinexdaz/fdfs_storage

            port: tracker default port is 22122
            base_path: map the path "/data/tracker"
            
         Run as a storage
            docker run -d --name storage -v ~/data/fastdfs/storage:/data/storage --link tracker:tracker -p 80:80 -e TRACKER=tracker fdfs_storage

            port: nginx default port is 80
            base_path and store_path0: map the path "/data/storage"
            TRACKER: tracker container's name
		
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
		 	
		 python manage.py celery worker -1 info
		 

	创建dj管理员密码：
		python manange.py createsuperuser
	
```

