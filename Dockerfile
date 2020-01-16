FROM richarvey/nginx-php-fpm

# Nginx 配置替换兼容 Laravel
RUN sed -i "s/try_files \$uri \$uri\/ =404;/try_files \$uri \$uri\/ \/index.php?\$query_string;/g" /etc/nginx/sites-available/default.conf \
  && sed -i "s/try_files \$uri \$uri\/ =404;/try_files \$uri \$uri\/ \/index.php?\$query_string;/g" /etc/nginx/sites-available/default-ssl.conf \
  && sed -i "s/root \/var\/www\/html/root \/var\/www\/html\/public/g" /etc/nginx/sites-available/default.conf \
  && sed -i "s/root \/var\/www\/html/root \/var\/www\/html\/public/g" /etc/nginx/sites-available/default-ssl.conf

# 设置时区
RUN echo "Asia/Shanghai" > /etc/TZ

# 取消自动 Composer Install
ENV SKIP_COMPOSER 1

# 复制文件到指定目录
COPY . /var/www/html

# 排除 cache
RUN rm -rf /var/www/html/storage/framework/cache/data/*

# 排除 sessions
RUN rm -rf /var/www/html/storage/framework/sessions/*

# 排除 views
RUN rm -rf /var/www/html/storage/framework/views/*

# 排除 logs
RUN rm -rf /var/www/html/storage/framework/logs/*
