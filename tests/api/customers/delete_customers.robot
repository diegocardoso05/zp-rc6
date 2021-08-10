***Settings***
Resource    ../../../resources/services.robot
Library     OperatingSystem

***Test Cases***
Delete Customer
    ${origin}=      Get Json    customers/chimbinha.json

    Delete Customer     ${origin['cpf']}  
    ${resp}=        Post Customer        ${origin}


    ${resp}=        Delete Customer     ${origin['cpf']}

    Status Should Be        204                         ${resp}

Customer Not Found

    ${resp}         Delete Customer     779.617.410-11

    Status Should Be        404                             ${resp}
    Should Be Equal         ${resp.json()['message']}       Customer not found
    