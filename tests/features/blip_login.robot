*** Settings ***
Documentation        Aqui neste arquivo estarão presentes todos os testes relativos a login

Resource           ../../src/config/package.robot

Test Setup         Abrir navegador
Test Teardown      Fechar navegador

*** Test Cases ***

Caso de Teste 01: Login valido no site blip
    Dado que possuo credenciais validas
	Quando realizar login
	Entao a devo validar o login na aplicacao


Caso de Teste 02: Login valido no site blip
	Dado que não possuo credenciais validas
	Quando realizar login
	Entao a devo validar mensagem, não me permitindo acesso.
