*** Settings ***
Library    SeleniumLibrary
Resource   variables.robot

*** Test Cases ***
Login Válido
    [Documentation]    Este caso de teste verifica o fluxo de login válido
    [Tags]    Login

    # Abrir o navegador e acessar a URL
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Clicar no botão de login/criação de conta
    Click Element   css=#header .nav .header_user_info > a

    # Inserir email e senha para login
    Input Text      id=email    ${EMAIL_CREATE}
    Input Text      id=passwd   ${PASSWORD}

    # Clicar no botão de login
    Wait Until Element Is Visible    css=#SubmitLogin > span   timeout=15s
    Click Element    css=#SubmitLogin > span

    
    # Verificar se o login foi bem-sucedido (pode ser um elemento específico na página de login)
    Wait Until Element Is Visible    css=#my-account

    # Validar que o usuário está logado com sucesso (exemplo de verificação)
    Page Should Contain Element    css=#my-account

    # Fechar o navegador
    Close Browser
