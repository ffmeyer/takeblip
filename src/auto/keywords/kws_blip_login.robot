*** Settings ***
Documentation        Aqui estarão presentes todas as keywords dos testes de cadastro
...                  do site automationpractice.com

Resource            ../../config/package.robot

**Variables**
${LOGIN_USER}       ffmeyer@outlook.com
${LOGIN_PASS}       ryT3#9yV1@5M
${BASEURL}          https://account.blip.ai/login
${FULL_NAME}        Felipe Meyer
${WRONG_PASS}       123456

*** Keywords ***
Go To Login Page
    Go to       ${BASEURL}

Dado que possuo credenciais validas
    Go To Login Page
    Input Text        id=email          ${LOGIN_USER}
    Input Text        id=password       ${LOGIN_PASS}


Quando realizar login
    Click Element       id=blip-login


Entao a devo validar o login na aplicacao
    Wait Until Element Is Visible       css=div p
    ${NAME}        Get Text             css=div p
    Should Contain                       ${NAME}              ${FULL_NAME}


Dado que não possuo credenciais validas
    Go To Login Page
    Input Text        id=email          ${LOGIN_USER}
    Input Text        id=password       ${WRONG_PASS}


Entao a devo validar mensagem, não me permitindo acesso.
    ${SHADOW1}          Execute Javascript  const ele = document.querySelector("bds-toast[class=hydrated]"); return ele.shadowRoot.querySelector("bds-typo[class=hydrated]")
    ${MESSAGE}          Get Text            ${SHADOW1}
    Should Contain      ${MESSAGE}          Invalid login and/or password
