***Settings***
Resource    ../../../resources/services.robot
Library     OperatingSystem

***Test Cases***
Get Customers List

    ${list}=        Get Json    customers/list.json

    FOR     ${item}     IN      @{list['data']}
        # O ${item} é o PayLoad
        Post Customer   ${item}
    END

    ${resp}             Get Customers
    Status Should Be    200     ${resp}
    ${total}=           Get Length          ${resp.json()}
    Should Be True      ${total} > 0
