# Esquema Conceitual - Oficina Mecânica

Este projeto consiste na modelagem conceitual de um sistema de controle e gerenciamento de ordens de serviço em uma oficina mecânica.

## Entidades

* **Cliente:** Informações sobre os clientes.
* **Veículo:** Informações sobre os veículos dos clientes.
* **Mecânico:** Informações sobre os mecânicos da oficina.
* **Ordem de Serviço (OS):** Registro das ordens de serviço.
* **Serviço:** Informações sobre os serviços prestados.
* **Peça:** Informações sobre as peças utilizadas.
* **OS_Servico:** Tabela de junção entre OS e Serviço.
* **OS_Peca:** Tabela de junção entre OS e Peça.

## Relacionamentos

* Um cliente possui vários veículos.
* Um veículo possui uma OS.
* Um mecânico executa uma OS.
* Uma OS possui vários serviços.
* Uma OS possui várias peças.
* Um serviço pode estar em várias OSs.
* Uma peça pode estar em várias OSs.

## Observações

* Foi assumido que um veículo só pode ter uma ordem de serviço aberta por vez.
* Foram criadas tabelas de junção OS_Servico e OS_Peca para implementar o relacionamento muitos-para-muitos entre OS e Serviço, e entre OS e Peça, respectivamente.
* Foi adicionado o atributo quantidade e valor total nas tabelas de junção, para que seja possível armazenar a quantidade de peças e serviços utilizados em cada OS.

## Como Utilizar

1.  Abra a ferramenta de modelagem de dados de sua preferência.
2.  Crie as entidades e relacionamentos conforme o esquema conceitual descrito acima.
3.  Defina os atributos de cada entidade.
4.  Especifique as chaves primárias (PK) e chaves estrangeiras (FK).

## Contribuição

Contribuições são bem-vindas! Se você tiver sugestões de melhorias ou correções, sinta-se à vontade para abrir uma issue ou enviar um pull request.
