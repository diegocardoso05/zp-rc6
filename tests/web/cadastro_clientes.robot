***Settings***
Documentation       Cadastro de clientes

Resource        ../../resources/base.robot

Suite Setup          Login Session
Suite Teardown       Finish Session

***Test Cases***
Novo cliente
    [Tags]      smoke
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...     Bon Jovi        00000001406     Rua dos Bugs, 1000      11999999999
    Quando faço a inclusão desse cliente
    Então devo ver a notificação:   Cliente cadastrado com sucesso!
    E esse deve ser exibido na lista

Cliente duplicado
    [Tags]      dup
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...     Adrian Smith        000000014141     Rua dos Bugs, 2000      11999999991
    Mas este cpf já existe no sistema
    Quando faço a inclusão desse cliente
    Então devo ver a notificação de erro:   Este CPF já existe no sistema! 

Campos Obrigatórios
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...     ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Quando faço a inclusão desse cliente
    Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios

Nome é Obrigatório
    [Tags]      required  
    [Template]      Validação de Campos
    ${EMPTY}        15799329082         Rua dos Bugs, 1000      11999999999     Nome é obrigatório

Cpf é Obrigatório
    [Tags]      required
    [Template]      Validação de Campos
    Diego Cardoso       ${EMPTY}        Rua dos Bugs, 1000      11999999999     CPF é obrigatório

Endereço é Obrigatório
    [Tags]      required
    [Template]      Validação de Campos
    Diego Cardoso       15799329082     ${EMPTY}      11999999999     Endereço é obrigatório

Telefone é Obrigatório
    [Tags]      required
    [Template]      Validação de Campos
    Diego Cardoso       15799329082     Rua dos Bugs, 1000      ${EMPTY}     Telefone é obrigatório

Telefone incorreto
    [Template]      Validação de Campos
    Joao da Silva   0000001406      Rua dos Bugs, 1000      1199999999      Telefone inválido     

***Keywords***
Validação de Campos
    [Arguments]     ${nome}    ${cpf}    ${endereco}    ${telefone}    ${saida} 
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...     ${nome}    ${cpf}    ${endereco}    ${telefone}
    Quando faço a inclusão desse cliente
    Então devo ver o texto:    ${saida} 
