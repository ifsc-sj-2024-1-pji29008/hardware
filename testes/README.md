# Exemplos

No diretório `sys`, há uma estrutura fantasia de diretórios e arquivos que simulam a presença de sensores DS18B20 em barramentos 1-Wire.

## Simulador de barramentos 1-wire e sensores DS18B20

No diretório [`shell`](shell) há o _script_ [`w1_simulation`](shell/w1_simulation) que simula a presença de barrentos 1-Wire, bem como sensores nestes barramentos. A rotina cria toda a estrutura de diretórios e arquivos necessária.

Abaixo estão alguns exemplos de uso:

 - Para ver a ajuda do _script_:
    ```bash
    ./wi_simulation -h
    ```
    ```bash
    Usage: ./w1_simulation [options] bus_amount sensors_per_bus bus_path
    Options:
    -h, --help              Display this help message
    -b, --bus-amount        The amount of buses to create
    -s, --sensors-per-bus   The amount of sensors to create per bus
                            You can specify the amount of sensors per bus by bus id
                            in the following format: bus_id:sensor_count
    -p, --bus-path          The path to the bus

    Example:
    ./w1_simulation -b 2 -s 3 -p /tmp
    This will create 2 buses with 3 sensors each in the /tmp/sys/bus/w1/devices directory

    ./w1_simulation -b 2 -s 2:3 -p /tmp
    This will create 2 buses with 2 and 3 sensors in the /tmp/sys/bus/w1/devices directory

    ./w1_simulation -b 2 -s 2:3,1:4 -p /tmp
    This will create 2 buses, where the bus 1 will have 4 sensors and bus 2 will have 3 sensors

    ./w1_simulation -b 10 -s *:3,6:0 -p /tmp
    This will create 10 buses, where all buses will have 3 sensors except bus 6 which will have 0 sensors
    ```

- Para criar 2 barramentos com 3 sensores cada, no diretório `/tmp`:
    ```bash
    ./w1_simulation -b 2 -s 3 -p /tmp
    ```

- Para criar 2 barramentos, onde o primeiro terá 2 sensores e o segundo 3 sensores, no diretório `/tmp`:
    ```bash
    ./w1_simulation -b 2 -s 2:3 -p /tmp
    ```

- Para criar 2 barramentos, onde o primeiro terá 4 sensores e o segundo 3 sensores, no diretório `/tmp`:
    ```bash
    ./w1_simulation -b 2 -s 2:3,1:4 -p /tmp
    ```

- Para criar 10 barramentos, onde todos terão 3 sensores, exceto o barramento 6 que não terá sensores, no diretório `/tmp`:
    ```bash
    ./w1_simulation -b 10 -s *:3,6:0 -p /tmp
    ```

Dentro do diretório especificado, será criada a estrutura mostrada abaixo:

```shell
/tmp/sys/bus/w1/devices/
├── w1_bus_master1
│   ├── 28-abcdef123456
│   │   ├── temperature
...
├── w1_bus_masterN
│   ├── 28-abcdef123456
│   │   ├── temperature
```

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