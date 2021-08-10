***Settings***
Documentation       Camade de serviços do projeto de automação

Library     RequestsLibrary
Library     Collections
Resource    helpers.robot
  

***Variables***
${base_api_url}     http://zepalheta-api:3333

***Keywords***
## Helpers
Get Session Token
    ${resp}=     Post Session    admin@zepalheta.com.br      pwd123
    
    ${token}    Convert To String     Bearer ${resp.json()['token']}

    [return]   ${token}

## POST /sessions
Post Session
    [Arguments]     ${email}        ${password}

    Create Session      zp-api      ${base_api_url}              

    &{headers}=     Create Dictionary       Content-Type=application/json
    &{payload}=     Create Dictionary       email=${email}        password=${password}

    ${resp}=        POST On Session    zp-api      /sessions       json=${payload}     expected_status=anything

    [return]        ${resp}

## POST /customers
Post Customer
    [Arguments]     ${payload} 

    Create Session      zp-api      ${base_api_url}

    ${token}=       Get Session Token   
    &{headers}=     Create Dictionary       content-type=application/json       authorization=${token}

    ${resp}     POST On Session     zp-api      /customers      json=${payload}     headers=${headers}      expected_status=anything

    [return]        ${resp}

## PUT /customers
Put Customer
    [Arguments]     ${payload}      ${user_id} 

    Create Session      zp-api      ${base_api_url}

    ${token}=       Get Session Token   
    &{headers}=     Create Dictionary       content-type=application/json       authorization=${token}

    ${resp}     PUT On Session     zp-api      /customers/${user_id}     json=${payload}     headers=${headers}      expected_status=anything

    [return]        ${resp}

## Get /customers
Get Customers
    Create Session      zp-api      ${base_api_url}

    ${token}=       Get Session Token
    &{headers}=     Create Dictionary       Content-Type=application/json       Authorization=${token}

    ${resp}=        GET On Session     zp-api      /customers      headers=${headers}

    [return]        ${resp}

Get Unique Customer
    [Arguments] 	${user_id}

    Create Session      zp-api      ${base_api_url}

    ${token}=       Get Session Token
    &{headers}=     Create Dictionary       Content-Type=application/json       Authorization=${token}

    ${resp}=        GET On Session     zp-api      /customers/${user_id}      headers=${headers}        expected_status=anything

    [return]        ${resp}

## DELETE /customers
Delete Customer
    [Arguments]     ${cpf}

    ${token}=       Get Session Token   
    &{headers}=     Create Dictionary       content-type=application/json       authorization=${token}

    ${resp}=        DELETE On Session     zp-api      /customers/${cpf}       headers=${headers}     expected_status=anything

    [Return]        ${resp}