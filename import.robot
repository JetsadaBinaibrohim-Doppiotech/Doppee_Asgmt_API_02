***Settings***
Library     RequestsLibrary
Library     SeleniumLibrary
Library     Collections

Variables   ./Resource/Testdata.yaml

Resource    ./Keywords/login_keyword.robot

Resource    ./Keywords/Page/search_page.robot
Resource    ./Keywords/Page/payment_page.robot
Resource    ./Keywords/Page/check_page.robot

Resource    ./Keywords/Feature/search_feature.robot
Resource    ./Keywords/Feature/check_feature.robot