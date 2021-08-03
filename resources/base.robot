***Settings***

Library     SeleniumLibrary

Library     libs/db.py

Resource    kws.robot
Resource    hooks.robot

Resource    components/SideBar.robot
Resource    components/Toaster.robot
Resource    pages/LoginPage.robot
Resource    pages/CustomersPage.robot

***Variables***
${base_url}     http://zepalheta-web:3000/
${admin_user}   admin@zepalheta.com.br
${admin_pass}   pwd123


# # Simples
# ${nome}     Diego Antonio

# # Lista
# @{carros}       Civic       Lancer      Accord      Chevette

# # Dicionario
# &{cliente}      nome=Bom Jovi   cpf=0000001406      email=bonjov@gmail.com      telefone=11999999999
