# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yamzil <yamzil@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/01 03:46:59 by yamzil            #+#    #+#              #
#    Updated: 2023/03/14 13:20:46 by yamzil           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update -y ; apt-get upgrade -y ; \
    apt-get install -y mariadb-server

COPY ./tools/script.sh /script.sh

CMD ["sh", "script.sh"]
