## 基础依赖说明

- docker:latest `容器工具`
- docker-compose:latest `容器编排`
- nginx-php-fpm:latest `Web 服务基础镜像`
- traefik:2.1.2 `服务网关`
- redis:latest `缓存服务`
- mysql:5.7 `数据库服务`

## 配置修改

- 修改 `Envoy.blade.php` 文件，将 `xxx` 替换成你自定义的镜像名
- 修改 `docker-compose-dev.yaml` 文件，搜索 `请替换` 替换成你自己的相关信息

## 启动项目

> 本项目基于 `Mac` 系统下 `docker` 启动开发环境 <br />
> 请先安装 `docker` <br />
> Windows 系统，请在 `bash` 终端下操作 <br />
> 可选：建议配置 Docker 的 `registry mirrors`，具体可以百度 <br />
> 请将当前项目所在目录路径共享给 Docker 访问，PS：在 `Docker` 的设置中

- 第 1 步，复制 `docker-compose-dev.yaml.bak` 为 `docker-composer-dev.yaml`
- 第 2 步，复制 `Envoy.blade.php.bak` 为 `Envoy.blade.php`
- 第 3 步，执行 `composer install`，安装依赖
- 第 4 步，执行 `envoy run build`，进行构建镜像，如出现命令不存在，请参考 `envoy` 安装教程
- 第 5 步，执行 `envoy run start`，启动服务
    
## 访问服务

> 启动之后可能需要过 1 - 2 分钟，方能正常访问服务，视机器性能而言

- `http://{traefik 域名}` 访问 traefik 面板
- `http://{web 服务域名}` 访问 web 服务，将会看到 laravel
- `http://{web 服务域名}/api/info` PHPINFO
 
- `redis` 链接, `127.0.0.1:6379`
- `mysql` 链接, `127.0.0.1:3306`，密码：`123456`

## 其他问题

#### 负载均衡
- 执行 `docker-compose -f docker-compose-dev scale web-core=3`，将会启动三个 `web-core` 服务
- 此时再访问 `http://{web 服务域名}/api/info` 你会发现每次的主机IP都不一样，至此负载均衡完成

## 感言
- 感谢开源软件作者以及团队，感谢自己多年积累，感谢这两天自己所受的苦难没有白费，感谢群里各位大神的疑难解答！
