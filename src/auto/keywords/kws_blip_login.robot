*** Settings ***
Documentation        Aqui estarão presentes todas as keywords dos testes de cadastro
...                  do site automationpractice.com

Resource            ../../config/package.robot

**Variables**
${LOGIN_USER}       ffmeyer@outlook.com
${LOGIN_PASS}       ryT3#9yV1@5M
${FULL_NAME}        Felipe Meyer
${WRONG_PASS}       123456

*** Keywords ***
Dado que possuo credenciais validas
    Input Text        id=${BLIP_LOGIN.input_user}           ${LOGIN_USER}
    Input Text        id=${BLIP_LOGIN.input_pass}           ${LOGIN_PASS}


Quando realizar login
    Click Element       id=${BLIP_LOGIN.click_login}


Entao a devo validar o login na aplicacao
    Wait Until Element Is Visible       css=${BLIP_LOGIN.valid_user_logged_in}
    ${NAME}        Get Text             css=${BLIP_LOGIN.valid_user_logged_in}
    Should Contain                       ${NAME}              ${FULL_NAME}


Dado que não possuo credenciais validas
    Input Text        id=${BLIP_LOGIN.input_user}       ${LOGIN_USER}
    Input Text        id=${BLIP_LOGIN.input_pass}       ${WRONG_PASS}


Entao a devo validar mensagem, não me permitindo acesso.
    ${SHADOW1}          Execute Javascript  const ele = document.querySelector("bds-toast[class=hydrated]"); return ele.shadowRoot.querySelector("bds-typo[class=hydrated]")
    ${MESSAGE}          Get Text            ${SHADOW1}
    Should Contain      ${MESSAGE}          Invalid login and/or password
