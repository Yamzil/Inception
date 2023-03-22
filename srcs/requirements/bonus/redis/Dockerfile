# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yamzil <yamzil@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/04 01:05:38 by yamzil            #+#    #+#              #
#    Updated: 2023/03/21 13:05:56 by yamzil           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update ; apt-get upgrade -y ;\
    apt-get install redis-server -y; \
    sed -i "s/127.0.0.1/0.0.0.0/g" /etc/redis/redis.conf

CMD [ "redis-server","--protected-mode" , "no"]
