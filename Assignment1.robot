*** Settings ***
Library    SeleniumLibrary
Library    String
*** Variables ***
${username}=    xpath=//input[@name="uname"]
${password}=    xpath=//input[@name="pass"]
${submit}=    xpath=//input[@type="submit"]
${BrowsCate}=    xpath=//div//a[@href="categories.php"]
${Poster}=    xpath=//div//a[@href="listproducts.php?cat=1"]
${Paitings}=    xpath=//div//a[@href="listproducts.php?cat=2"]
${Stickers}=    xpath=//div//a[@href="listproducts.php?cat=3"]
${Grafitty}=    xpath=//div//a[@href="listproducts.php?cat=4"]


*** Keywords ***
login 
    SeleniumLibrary.Input Text    ${username}    test
    SeleniumLibrary.Input Text    ${password}    test 
    SeleniumLibrary.Click Element    ${submit}  

Browscategories
    SeleniumLibrary.Click Element    ${BrowsCate} 
    SeleniumLibrary.Element Should Contain    ${Poster}    Posters
    SeleniumLibrary.Element Should Contain    ${Paitings}    Paintings
    SeleniumLibrary.Element Should Contain    ${Stickers}    Stickers    
    SeleniumLibrary.Element Should Contain    ${Grafitty}    Graffity


*** Test Cases ***
Run assignment1
    Open Browser    http://testphp.vulnweb.com/login.php    browser=Chrome
    ...    options=add_experimental_option("detach", True)
    login
    Browscategories