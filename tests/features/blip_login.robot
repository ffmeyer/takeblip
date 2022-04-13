*** Settings ***
Documentation        Aqui neste arquivo estarão presentes todos os testes relativos a login

Resource           ../../src/config/package.robot

Test Setup         Abrir navegador
Test Teardown      Fechar navegador

*** Test Cases ***

Caso de Teste 01: Login valido no site blip
	[Tags]		passed
    Dado que possuo credenciais validas
	Quando realizar login
	Entao a devo validar o login na aplicacao


Caso de Teste 02: Senha invalida no site blip
	[Tags]		error
	Dado que não possuo credenciais validas
	Quando realizar login
	Entao a devo validar mensagem, não me permitindo acesso.


#in dev
Caso de Teste 03: Esqueci a senha
	[Tags]		change
	Dado que possuo usuario valido, mas nao senha
	Quando clicar em Forgot your password?
	E preencho os dados solicitados e envio
	Entao o usuario deve exibir mensagem de envio de email
