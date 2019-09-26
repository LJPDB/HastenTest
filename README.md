# Hasten Test App
//testing PR in jenkins 4
This is a test app fro Hasten group to measure the candidates knowledge about swift, xcode and iOS application in general.
I want to start apologizing myself for the delay in delivering the final product and also make a bullet list of pending tasks that are missing in this project. It took me day and a half to finish this app and these are the missing points (although i thought about coding them):

- Using a SINGLETON object for Alamofire network connection: i had started to coding it but it would take me more time to do it
- Animations: same thing, i know a few libraries or plain swift code to achive this point but it´d take me more time
- Name Labels: I wanted to show you the use of Stacks but had no time to figure out the autolayout rules to fix the doubled line label


## Known issues with the information source

When you open the app you will notice that some pictures are missing and there will be a question image instead of the player referenced but, some URLs given from the JSON file are pointing to NO IMAGES and thats why the CELL is taking the DEFAULT IMAGE in place. example:

- Cristiano Ronaldo: http://www.segundoasegundo.com/sas/wp-content/uploads/2014/01/cristiano-ronaldo.jpg  --> this will lead you to a Newspaper instead of a picture of Cristiano

## PODs used in this app

- Alamofire
- SwiftyJSON
- SDWebImage

## Instalation and test

- Download/Clone the app
- Run POD INSTALL
- Open the WORKSPACES generated when installing the PODs
- Run the app from XCode

## Expected behaviour

Dispite the points pending of development and known issues, the app works fine and as expected. NO VALIDATIONS are taking care like no internet, wrong JSON structure passed by, etc. Everything is coded by IDEAL SCENARIO in hand.

## License

[CC0-1.0](./LICENSE).
