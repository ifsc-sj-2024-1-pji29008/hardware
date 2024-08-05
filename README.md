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


## Estrutura do Projeto

```plaintext
Projeto hardware-main
|
|-- Bibliotecas
|   |-- jpmsb.py
|
|-- Testes
    |-- Python
    |   |-- exemplo.py
    |   |-- jpmsb.py
    |
    |-- Shell
    |   |-- ler_temperatura
    |   |-- w1_simulation
    |
    |-- W1 Configuração e Leitura
        |-- sys/bus/w1/devices/
            |-- w1_master_pullup
            |-- w1_master_remove
            |-- w1_master_search
            |-- w1_master_slaves
            |-- temperature
```

### Diretório Raiz (`hardware-main`)
- **LICENSE**: Contém a licença sob a qual o projeto é distribuído.
- **README.md**: Este arquivo, fornecendo uma visão geral e instruções para o uso do projeto.

### Diretório `bibliotecas`
Contém bibliotecas de scripts Python.

#### Arquivos Importantes:
- **jpmsb.py**: Script Python com funções e classes reutilizáveis.

### Diretório `testes`
Contém scripts e arquivos de teste para o hardware.

#### Subdiretório `python`
- **exemplo.py**: Script de exemplo para testes em Python.
- **jpmsb.py**: Funções de teste em Python.

#### Subdiretório `shell`
- **ler_temperatura**: Script de shell para leitura de temperatura de sensores W1.
- **w1_simulation**: Script de shell para simulação de dispositivos W1.

#### Subdiretório `sys/bus/w1/devices`
Contém arquivos de configuração e leitura para dispositivos W1.

### Arquivos de Configuração W1
- **w1_master_pullup**: Configuração para ativar o pull-up no barramento W1.
- **w1_master_remove**: Configuração para remover dispositivos do barramento W1.
- **w1_master_search**: Configuração para buscar dispositivos no barramento W1.
- **w1_master_slaves**: Lista de dispositivos escravos no barramento W1.
- **temperature**: Leitura de temperatura de dispositivos específicos.

## Instruções de Uso

### Configuração do Ambiente

1. **Clone o Repositório**:
   ```bash
   git clone <URL-do-repositório>
   cd hardware-main
   ```

2. **Configure o Ambiente Python**:
   - Crie um ambiente virtual e instale as dependências.
   ```bash
   python -m venv env
   source env/bin/activate
   pip install -r requirements.txt
   ```

3. **Configuração da Raspberry Pi**:
   - Certifique-se de que a Raspberry Pi está configurada corretamente para interagir com os dispositivos W1. 
   - Adicione as seguintes linhas ao final do arquivo `/boot/config.txt`:
   ```bash
   dtoverlay=w1-gpio
   ```

### Testes com Sensores W1

1. **Scripts de Shell**:
   - Utilize os scripts de shell no diretório `testes/shell` para interagir com os sensores W1.
   ```bash
   sh testes/shell/ler_temperatura
   sh testes/shell/w1_simulation
   ```

2. **Leitura de Temperatura**:
   - Verifique as leituras de temperatura nos arquivos localizados em `testes/sys/bus/w1/devices`.

### Contribuição

1. **Fork o Projeto**:
   - Faça um fork do projeto no GitHub e clone o repositório.

2. **Crie uma Branch**:
   - Crie uma branch para suas modificações.
   ```bash
   git checkout -b minha-nova-feature
   ```

3. **Commit suas Alterações**:
   - Faça commit das suas alterações.
   ```bash
   git commit -m "Adicionei uma nova feature"
   ```

4. **Faça Push**:
   - Envie suas alterações para o GitHub.
   ```bash
   git push origin minha-nova-feature
   ```

5. **Crie um Pull Request**:
   - Abra um pull request no repositório original.


