*** Settings ***
Documentation        Aqui estarão presentes todos os elementos mapeados da tela de login

*** Variables ***
&{BLIP_LOGIN}
...            input_user=email
...            input_pass=password
...            click_login=blip-login
...            valid_user_logged_in=div p
...            forgot_pass=login-forgot-password
...            checkpoint_forgot_pass=//div[@id="blip-forgot-password-page"]//a
...            label_checkpoint=//*[@id="welcome-message"]
...            input_forgot_pass=input[id=Email]
...            click_forgot_pass=button[id="submitButton"]
...            checkpoint_email=h1[class*=bp-fw-bold]
