***Settings***
Resource    ../../../resources/services.robot
Library     OperatingSystem



***Test Cases***
Update a Customer

    # Cliente origem  
    ${payload}=     Get Json        customers/slash.json

    #Cadastro o cliente
    Delete Customer    ${payload['cpf']} 
    ${resp}=        Post Customer       ${payload}

    #Pega o id do cliente
    ${user_id}=     Convert To String   ${resp.json()['id']}

    # Muda a massa de teste para um novo nome
    Set To Dictionary       ${payload}       name        Saul Hudson

    # Solicita a alteração na API
    ${resp}         Put Customer    ${payload}      ${user_id}


    Status Should Be        204     ${resp}

    # Obtem os dados do cliente para valdar se o nome foi alterado
    ${resp}         Get Unique Customer     ${user_id}

    Should Be Equal     ${resp.json()['name']}      Saul Hudson