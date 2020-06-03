*** Variables ***
${SearchLink}   css=a[href='/search']
${SearchField}  id=q
${SearchButton}     css=div.buttons>input[value='Search']
${AddToCart}    xpath=(//input[@value='Add to cart'])[1]
${AddedToCart}  xpath=//p[contains(text(),'The product has been added to your ')]/a[text()='shopping cart']
${CloseNotification}    css=div.bar-notification>span[title='Close']
${ShoppingCartLink}     css=li#topcartlink>a
${AddedItemCount}   xpath=//div[@id='flyout-cart']//div[@class='count' and contains(text(), 'There are')]/a[text()='1 item(s)']
${SortBy_Dropdown}  id=products-orderby
