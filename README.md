giftexchange
============

A set of MATLAB scripts to run a custom gift exchange with algorithmically chosen targets

### Running the gift exchange

#### Setting up the gift exchange
The gift exchange should include at least a few reasonably friendly people. Typically I have had success with 20-25, although it's likely that fewer people works fine too. I have used this for custom gift exchanges, where people make handmade goods and so knowing the recipient is especially important, however it should work fine for regular exchanges too.

#### Steps to the gift exchange

Here are the steps in the process.

  1. Determine who is in the gift exchange. I usually do this by emailing my list of friends and giving them 3-4 days to respond. I will also send a heckling email before the deadline. Generate a list of players and their email addresses and store that on the left columns of GiftExchangeCompiled.xlsx.
  2. One the list of people is finalized, have each person fill out the GiftExchangeTemplate.xlsx. The document will need to be modified so that the list of all players is in it. Each person should mark the other people as either 'N' if they don't want to make a gift for them, 'Y' if they do want to make a gift for that person, or 'YYY' if they *really* want to make a gift for that person. The program also accepts 'YYYYY' for cases where a matching trumps all others. Filling out the sheet is quick to do, but most people procrastinate. I give them about a week to fill it out.
  3. Take all of the responses and compile them in the GifExchangeCompiled.xlsx spreadsheet. This will be directly input into MATLAB. In the future I want to work out a way where the person running it does not see these steps, but that is for later.
  4. In MATLAB run input_graph.m with the compiled spreadsheet as the input. This will output a gift_graph structure.
  5. In MATLAB run compute_matchings.m on the gift_graph, this will output a new gift_graph object that includes the assignments. The assignments are scrambled so you don't accidentally see the results.
  6. Run email targets on the resulting gift graph, which will email the people their targets. You will need to input a gmail address and a password, and you will need to set your gmail security to allowing insecure apps. I highly recommend you make a special gmail address for this step.
  7. Have people make/buy gifts for their targets.
  
  
### Known bugs/issues

  * Does not yet handle situations where the pairings are impossible
  * Allows for multiple cycles in the solution, and even two people getting each other as targets. This isn't necessarily a problem, or even bad, but it should be known.