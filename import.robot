***Settings***
Library     RequestsLibrary
Library     SeleniumLibrary
Library     Collections

Variables   ./Resource/Testdata.yaml

Resource    ./Keywords/commom_keyword.robot
Resource    ./Keywords/Page/search_page.robot
Resource    ./Keywords/Page/payment_page.robot
Resource    ./Keywords/Page/check_page.robot

Resource    ./Keywords/Feature/search_feature.robot
Resource    ./Keywords/Feature/payment_feature.robot