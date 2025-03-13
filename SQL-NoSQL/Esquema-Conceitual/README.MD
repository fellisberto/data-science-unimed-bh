# Esquema Conceitual - Oficina Mecânica

Este projeto apresenta o esquema conceitual para um sistema de controle e gerenciamento de ordens de serviço em uma oficina mecânica, representado por um diagrama Entidade-Relacionamento (ER).

## Entidades e Atributos

* **Cliente:**
    * `idCliente` (PK, INT)
    * `Nome` (VARCHAR(45))
    * `CPF` (VARCHAR(45))
* **Veículo:**
    * `idVeículo` (PK, INT)
    * `Modelo` (VARCHAR(45))
    * `Placa` (VARCHAR(45))
* **Mecânico:**
    * `idMecanico` (PK, INT)
    * `Nome` (VARCHAR(45))
    * `Endereço` (VARCHAR(45))
    * `Especialidade` (VARCHAR(45))
    * `Veículo_idVeículo` (FK, INT)
* **Peça:**
    * `idPeça` (PK, INT)
    * `Nome` (VARCHAR(45))
    * `Valor` (VARCHAR(45))
* **Serviços:**
    * `idServiços` (PK, INT)
    * `Tipo_Serviço` (VARCHAR(45))
* **OS (Ordem de Serviço):**
    * `idOS` (PK, INT)
    * `Data_Emissão` (VARCHAR(45))
    * `Valor` (VARCHAR(45))
    * `Status` (VARCHAR(45))
    * `Data_Conclusão` (VARCHAR(45))

## Relacionamentos

* **Cliente_has_Veículo:** Um cliente pode ter um ou vários veículos.
* **Avaliar Execução:** Um mecânico avalia a execução de um veículo.
* **Mecanico_has_OS:** Um mecânico pode ter uma ou várias ordens de serviço.
* **Identificar Serviços:** Um mecânico identifica um ou vários serviços para um veículo.
* **Cliente autoriza OS:** Um cliente autoriza uma ou várias ordens de serviço.
* **Calcula Valor da Peça:** Uma ordem de serviço calcula o valor de uma ou várias peças.

## Observações

* O diagrama representa as principais entidades e seus relacionamentos no contexto de uma oficina mecânica.
* As chaves primárias (PK) e chaves estrangeiras (FK) estão indicadas para garantir a integridade referencial do banco de dados.
* Os atributos são definidos com seus tipos de dados (VARCHAR, INT) e tamanhos.
* Os relacionamentos são representados com suas cardinalidades (1, 1..*).

## Como Utilizar

1.  Visualize o diagrama ER para entender a estrutura do banco de dados da oficina mecânica.
2.  Analise as entidades, atributos e relacionamentos para compreender o contexto do sistema.
3.  Utilize o diagrama como base para implementar o banco de dados em um Sistema de Gerenciamento de Banco de Dados (SGBD).

## Contribuição

Contribuições são bem-vindas! Se você tiver sugestões de melhorias ou correções para o esquema conceitual, sinta-se à vontade para abrir uma issue ou enviar um pull request.
