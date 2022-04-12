*** Settings ***
Documentation        Este aqui é o nosso gerenciador de dependências.

########################################################
#                      Libraries                       #
########################################################
Library        SeleniumLibrary
Library        DebugLibrary
Library        Collections

########################################################
#                       Keywords                       #
########################################################
Resource       ../auto/keywords/kws_blip_login.robot
########################################################
#                        Pages                         #
########################################################
Resource       ../auto/pages/page_blip_login.robot
########################################################
#                        Hooks                         #
########################################################
Resource        hooks.robot
Variables       hooks.yaml
########################################################
#                       Variables                         #
########################################################
