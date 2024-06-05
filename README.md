# Hardware

Neste repositório estão contidos os códigos fonte relacionados à parte de *hardware* do projeto.

## *Hardware* atual em uso

Inicialmente, foram realizadas tentativas de uso do kit de desenvolvimento DE10-nano. Entretanto, foi verificado que a implementação do barramento One-Wire seria custosa e poderia não ter a estabilidade necessária para os testes com o sensor DS18B20. Outra alternativa, foi utilizar o Raspberry Pi 3 Model B, que já possui um barramento One-Wire implementado. Foram realizados testes bem sucedidos com o sensor em modo parasita. Para tal, foi criado o *script* [`ler_temperatura`](testes/ler_temperatura), na linguagem Bash.

Abaixo, estão listadas as características do ambiente de desenvolvimento:

- Placa: Raspberry Pi 3 Model B
- CPU: ARM Cortex-A53 + (4) @ 1.20 GHz (64-bits)
- Memória: 1 GB
- Sistema Operacional: openSUSE Tumbleweed (aarch64)
- Kernel: 6.8.9-1-default
- Python: 3.11.9

## Testes em linguagens de alto nível

Para verficar o funcionamento do barramento One-Wire no Raspberry Pi 3, foi implementado um teste bem simples na linguagem Bash e outro mais bem elaborado na linguagem Python. Veja mais informarções [aqui](testes/README.md).

## FPGA

Veja mais informações [aqui](FPGA/README.md).