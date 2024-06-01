# Exemplos

No diretório `sys`, há uma estrutura fantasia de diretórios e arquivos que simulam a presença de sensores DS18B20 em barramentos 1-Wire.

## Leitor de temperatura em shell script

O *script* [`ler_temperatura`](shell/ler_temperatura) realiza a leitura simples da temperatura de um sensor em um barramento de 1-Wire. O uso dá-se conforme mostrado abaixo:

```shell
./ler_temperatura 1
```

No exemplo acima, será lida a temperatura do sensor localizado no barramento `/sys/bus/w1/devices/w1_bus_master1/`, cujo primeiro sensor encontrado terá sua temperatura lida.

## Leitor de temperatura em Python

O *script* [`exemplo.py`](python/exemplo.py) faz a leitura de 4 sensores em 4 barramentos 1-Wire distintos, lendo um sensor por barramento. O uso dá-se conforme mostrado abaixo:

```shell
./exemplo.py
```