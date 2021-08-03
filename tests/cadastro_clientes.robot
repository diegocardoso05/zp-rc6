***Settings***
Documentation       Cadastro de clientes

Resource        ../resources/base.robot

Suite Setup          Login Session
Suite Teardown       Finish Session

***Test Cases***
Novo cliente
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...     Bon Jovi        00000001406     Rua dos Bugs, 1000      11999999999
    Então devo ver a notificação:   Cliente cadastrado com sucesso!

Campos Obrigatórios
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...     ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
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

***Keywords***
Validação de Campos
    [Arguments]     ${nome}    ${cpf}    ${endereco}    ${telefone}    ${saida} 
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...     ${nome}    ${cpf}    ${endereco}    ${telefone}
    Então devo ver o texto:    ${saida} 
