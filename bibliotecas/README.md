# Biblioteca de Sensores 1-Wire

### Sumário

- [Descrição](#descrição)
- [Estrutura da Classe `onewire`](#estrutura-da-classe-onewire)
  - [Construtor](#construtor)
  - [Métodos](#métodos)
- [Estrutura da Classe `sensor`](#estrutura-da-classe-sensor)
    - [Construtor](#construtor-1)
    - [Métodos](#métodos-1)
- [Exemplo de Uso](#exemplo-de-uso)
- [Notas](#notas)

## Descrição

Esta biblioteca em Python é projetada para gerenciar sensores de temperatura DS18B20 conectados via barramentos 1-wire no sistema de arquivos Linux. A classe principal `onewire` é responsável por detectar e gerenciar barramentos 1-wire e sensores DS18B20, enquanto a classe `sensor` fornece uma interface de alto nível para interagir com os sensores.

## Estrutura da Classe `onewire`

### Construtor

```python
def __init__(self, w1_system_path='/sys/bus/w1/devices', search_tries=20)
```
- **w1_system_path**: Caminho para os dispositivos 1-wire no sistema de arquivos.
- **search_tries**: Número de tentativas para limpar a busca de sensores.

### Métodos

- **clean_search(w1_bus)**: Realiza uma busca limpa no barramento 1-wire especificado.
- **search_w1_buses(w1_system_path)**: Procura por barramentos 1-wire disponíveis.
- **search_sensors(w1_bus)**: Procura por sensores DS18B20 em um barramento 1-wire específico.
- **search_all_sensors()**: Procura por sensores em todos os barramentos 1-wire.
- **set_value(w1_bus, property_name, value)**: Define valores nos pseudo-arquivos de um barramento 1-wire.
- **set_search(w1_bus, value)**: Define a busca de sensores em um barramento 1-wire.
- **set_pullup(w1_bus, value)**: Define o pull-up de um barramento 1-wire.
- **list_w1_buses()**: Retorna a lista de barramentos 1-wire.
- **list_sensors(w1_bus_number)**: Retorna uma lista de sensores DS18B20 em um barramento 1-wire.
- **get_temperature(w1_bus_number, sensor_id)**: Retorna o valor de temperatura de um sensor DS18B20 pelo ID.
- **get_address(w1_bus_number, sensor_id)**: Obtém o endereço de um sensor DS18B20.

## Estrutura da Classe `sensor`

### Construtor

```python
def __init__(self, w1_system_path='/sys/bus/w1/devices')
```
- **w1_system_path**: Caminho para os dispositivos 1-wire no sistema de arquivos.

### Métodos

- **new_search()**: Realiza uma nova busca limpa em todos os barramentos 1-wire.
- **get_temperature(w1_bus_number)**: Retorna a temperatura do sensor DS18B20 no barramento especificado.
- **get_address(w1_bus_number)**: Obtém o endereço do sensor DS18B20 no barramento especificado.
- **list_w1_buses()**: Retorna a lista de barramentos 1-wire.
- **list_sensors()**: Retorna uma lista de sensores DS18B20 detectados.
- **get_sensor_amount()**: Retorna a quantidade de sensores DS18B20 detectados.

## Exemplo de Uso

Veja exemplos em [testes](../testes/README.md).

---
## Notas

- Esta biblioteca requer permissões adequadas para acessar os arquivos do sistema de barramento 1-wire.
- Certifique-se de que os módulos do kernel necessários estão carregados para suportar dispositivos 1-wire.

---