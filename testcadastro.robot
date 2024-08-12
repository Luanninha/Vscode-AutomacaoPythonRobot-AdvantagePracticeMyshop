*** Settings ***
Library    SeleniumLibrary
Resource   variables.robot

*** Test Cases ***
Cadastro Válido
    [Documentation]    Este caso de teste realiza um cadastro válido.
    [Tags]    Cadastro

    # Abrir o navegador e acessar a URL
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Clicar no botão de login/criação de conta
    Click Element    css=.login

    # Inserir email e clicar no botão para criar conta
    Input Text       id=email_create    ${EMAIL_CREATE}
    Click Element    css=#SubmitCreate > span

    # Esperar até que o formulário de criação de conta esteja presente
    Wait Until Element Is Visible    id=id_gender2    timeout=15s

    # Selecionar o gênero
    Click Element    id=id_gender2

    # Preencher os campos do formulário
    Input Text       id=customer_lastname    ${LAST_NAME}
    Input Text       id=customer_firstname   ${FIRST_NAME}
    Input Text       id=passwd               ${PASSWORD}
    
    # Clicar no dropdown de dia de nascimento e selecionar o valor
    Click Element    id=days
    # Selecionar o dia de nascimento
    Select From List By Value    id=days    ${DAY_BIRTH}

    # Clicar no dropdown de mês de nascimento e selecionar o valor
    Click Element    id=months
    Press Keys       id=months    DOWN DOWN DOWN DOWN ENTER

   # Select From List By Value    id=months ${MONTH_BIRTH} 
  

    # Clicar no dropdown de ano de nascimento e selecionar o valor
    Click Element    id=years
    # Selecionar o ano de nascimento
    Select From List By Value    id=years   ${YEAR_BIRTH}

    # Selecionar a opção de newsletter
    Click Element    id=newsletter

    # Enviar o formulário de criação de conta
    Click Element    css=#submitAccount > span

    # Fechar o navegador
    Close Browser
