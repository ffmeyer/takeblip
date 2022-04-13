*** Settings ***
Documentation        Aqui estarão presentes todas as keywords dos testes de cadastro
...                  do site automationpractice.com

Resource            ../../config/package.robot

**Variables**
${LOGIN_USER}               ffmeyer@outlook.com
${LOGIN_PASS}               ryT3#9yV1@5M
${FULL_NAME}                Felipe Meyer
${WRONG_PASS}               123456
${FORGOT_PASS_EMAIL}        ffmeyer@gmail.com
${FORGOT_PASS_HIDE}         f****r@gmail.com

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


Dado que possuo usuario valido, mas nao senha
    Wait Until Element Is Visible       xpath=${BLIP_LOGIN.label_checkpoint}

Quando clicar em Forgot your password?
    Click Element       id=${BLIP_LOGIN.forgot_pass}

E o sistema exibe nova tela com opcao de mudança de senha
    Wait Until Element Is Visible       xpath=${BLIP_LOGIN.checkpoint_forgot_pass}

E preencho os dados solicitados e envio
    Input Text          css=${BLIP_LOGIN.input_forgot_pass}        ${FORGOT_PASS_EMAIL}
    Click Element       css=${BLIP_LOGIN.click_forgot_pass}


Entao o usuario deve exibir mensagem de envio de email

    Wait Until Element Is Visible       css=${BLIP_LOGIN.checkpoint_email}
    ${EXPECTED_MESSAGE}                 Get Text                css=${BLIP_LOGIN.checkpoint_email}
    Should Contain                      ${EXPECTED_MESSAGE}     ${FORGOT_PASS_HIDE}