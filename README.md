<img src="https://github.com/bashubb/BillSpliter/blob/main/BillSpliter/Assets.xcassets/AppIcon.appiconset/BillSpliter.png" width="15%"/> <h1>BillSpliter</h1>

<h2>Idea</h2>

Simple app to split the bill. User can choose number of people to split and amount of tip.

The app has default iOS look. It's build from components out of the box, without the custom elements.
'Check amount', 'Tip amount', 'Amount per person' and 'Total amount' have format of local currency, based of device localization.
I've found alot of fun in creating something useful with minimalistic design.
An app has high test coverage, and I'am really proud of it. I would like to keep it that way during the app growth.

<h2>Technology</h2>
<ul>
  <li>SwiftUI</li>
  <li>Unit Tests</li>
</ul>

<h2>Presentation</h2>

<h3>🚀  First look</h3>
<img src="https://github.com/bashubb/BillSpliter/blob/main/BillSpliter-%20firstlook.gif" width="40%" />
On the main view there is a section for type Check amount. Another two for choosing number of people and amount of tip - in precentage or cash. On the bottom there are two fields with total per person and just total with tip.

<br>
<h3>⏲  Validation </h3>
<img src="https://github.com/bashubb/BillSpliter/blob/main/BillSpliter%20-%20calulation%20.gif" width="40%" />
I've created simple warning for not giving any tip. If user would enter some check amount and pick 0% tip or 0.0 in cash, then fields total and total per person going to display amounts in a red color.

<h2>Future</h2>

I would like to create a more advanced functionality to count who owes what amount of money to whom.

 
