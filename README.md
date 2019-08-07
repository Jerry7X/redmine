这是个人redmine项目管理的数据

docker镜像：

CONTAINER ID        IMAGE                        COMMAND                  CREATED             STATUS              PORTS                            NAMES
7192b3ab4449        sameersbn/redmine:3.4.2      "/sbin/entrypoint.sh "   15 months ago       Up 14 months        443/tcp, 0.0.0.0:10083->80/tcp   redmine_redmine_1
c435f696ab44        sameersbn/postgresql:9.6-2   "/sbin/entrypoint.sh"    15 months ago       Up 14 months        5432/tcp                         redmine_postgresql_1

postgresql备份：
1，注意使用9.6版本的psql
2，pg_dump -h 172.19.0.2 -U redmine redmine_production -f MyRedmine.sql
