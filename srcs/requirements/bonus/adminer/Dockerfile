# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yamzil <yamzil@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/21 14:08:30 by yamzil            #+#    #+#              #
#    Updated: 2023/03/03 17:47:34 by yamzil           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && \
    apt-get install -y wget php php-mysql && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/vrana/adminer/releases/latest/download/adminer-4.8.1.php -O adminer.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "adminer.php"]