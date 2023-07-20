*** Settings ***
Library    SeleniumLibrary
Library    String
*** Variables ***
${username}=    xpath=//input[@name="uname"]
${password}=    xpath=//input[@name="pass"]
${submit}=    xpath=//input[@type="submit"]
${BrowsCate}=    xpath=//div//a[@href="categories.php"]
${Poster}=    xpath=//div//a[@href="listproducts.php?cat=1"]
${Postertree}=    xpath=//div//a[@href="product.php?pic=7"]
${Artistname}=    xpath=//div//a[@href="artists.php?artist=2"]
${Contactus}=    xpath=//a[href="mailto:wvs@acunetix.com"]
${Addtocartbtn}=    xpath=//input[@type="submit"]
${Subtotal}=    xpath=//div//h3[@align="right"]

*** Keywords ***
login 
    SeleniumLibrary.Input Text    ${username}    test
    SeleniumLibrary.Input Text    ${password}    test 
    SeleniumLibrary.Click Element    ${submit}  

Browscategories
    SeleniumLibrary.Click Element    ${BrowsCate} 

PosterCategories
    seleniumLibrary.Click Element    ${Poster}
    SeleniumLibrary.Scroll Element Into View    ${Postertree}      
    SeleniumLibrary.Element Should Contain    ${Postertree}    Trees  
    SeleniumLibrary.Scroll Element Into View    ${Artistname}  
    SeleniumLibrary.Element Should Contain    ${Artistname}    Blad3                   
    SeleniumLibrary.Click Element    ${Postertree}
       
Addtocart
    SeleniumLibrary.Click Element    ${Addtocartbtn} 

Checkout
    SeleniumLibrary.Element Should Contain    ${Subtotal}    15000


*** Test Cases ***
Run Assignment2
    Open Browser    http://testphp.vulnweb.com/login.php    browser=Chrome
    ...    options=add_experimental_option("detach", True)
    login
    Browscategories
    PosterCategories
    Addtocart
    Checkout



