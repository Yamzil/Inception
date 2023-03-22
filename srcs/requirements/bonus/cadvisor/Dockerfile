# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yamzil <yamzil@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/13 16:00:37 by yamzil            #+#    #+#              #
#    Updated: 2023/03/14 13:30:50 by yamzil           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

WORKDIR /usr/bin/

RUN apt-get update ; apt-get upgrade -y ; apt-get install -y wget ; \
    wget https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor ;\
    chmod +x cadvisor

CMD ["cadvisor"]