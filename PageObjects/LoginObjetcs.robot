*** Variables ***
${LoginLink}    css=a[href='/login?returnUrl=%2F']
${EmailField}   id=Email
${PasswordField}    id=Password
${LoginButton}  css=input[type='submit'][value='Log in']
${InvalidLoginError}    xpath=//div[contains(@class,'validation-summary-errors') and text()='Login was unsuccessful. Please correct the errors and try again.']
${InvaliLoginText}      Login was unsuccessful. Please correct the errors and try again.
${LogOut}       css=a[href='/logout']