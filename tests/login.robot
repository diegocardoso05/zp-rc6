***Settings***
Documentation       Login

Resource        ../resources/base.robot

# executa uma ou mais Keywords antes da execução de todos os steps de cada caso de teste
Test Setup          Start Session
# executa uma ou mais Keywords apos a execução de todos os steps de cada caso de teste
Test Teardown       Finish Session

***Test Cases***
Login do Administrador
    Acesso a página Login
    Submento minhas credenciais     admin@zepalheta.com.br  pwd123
    Devo ver a área logada
 





