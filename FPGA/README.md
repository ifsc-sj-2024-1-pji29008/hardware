# FPGA

A utilização de um componente de FPGA se faz útil para contornar a limitação na quantidade de pinos de entrada/saída de propósito geral presentes no Raspberry Pi 3.

Foi realizada a implementação de um multiplexador de 4 pinos bidirecionais, que conectarão os sensores DS18B20 nos pinos GPIO do Raspberry Pi 3.

A implementação está nos arquivos [`top.vhd`](multiplexer/top.vhd) e [`multiplexer.vhd`](multiplexer/multiplexer.vhd).

O projeto foi desenvolvido para a o chip Cyclone V, modelo 5CGXFC5C6F27C7N, presente no kit de desenvolvimento Cyclone V GX Starter Kit.

A estruturação atual encontra-se da seguinte forma:

- GPIOs 0 a 7, deverão ser conectados aos sensores DS18B20;
- GPIO 22 a 25, deverão ser conectados ao Raspberry Pi 3.

Há apenas duas seleções de grupos, sendo dois grupos de 4 conexões. Utiliza-se a chave deslizante `SW[0]` para alternar entre os grupos.