#* Exercise 6.1 ----
# List out the possible outcomes from flipping a coin twice.
#   {{H,T}, {H,T}}


#* Exercise 6.2 ----
# List out the possible outcomes for random event of choosing two finalists for an award with four applicants Ann, Jerry, Tom and Andy. 
#   {{Ann, Jerry, Tom, Andy}, {Ann, Jerry, Tom, Andy}}

#* Exercise 6.4 ----
# Probability a fair dice roll is greater than 3?
#   P(4:6) = |4:6| / |1:6| = 3/6 = 1/2


#* Exercise 6.5 ----
# You are in a class with only four students.
# If you have to do a project with a partner what are the chances you are paired with your best friend.
# Assume the assignments are made entirely randomly.
#   P(F) = |F| / |class - you| = 1/(4-1) = 1/3


#* Exercise 6.6 ----
# If you know that someones pin is 4 digits (0-9) long, what are your chances of guessing it?
#   P(4) = |correct pin| / |{0:9, 0:9, 0:9, 0:9 no repeat}| = 1/(10*8*7) = 1/5040


#* Exercise 6.7 ----
# What are the odds that the sum of the rolls from two six-sided dice is 8?
#   P(sim = 8) = |{2,6} {6,2} {3,5} {5,3} {4,4}| / |{1:6, 1:6} = 4/36 = 1/9


#* Exercise 6.9 ----
# Flipping a coin three times.
#   P(H,T) * P(H,T) * P(H,T) = 2*2*2 = 8


#* Exercise 6.10 ----
# How many DNA sequences are their which are 10 base pairs long? Hint: DNA has found bases A,T,C,G
#   P( {A,T,C,G}, {A,T,C,G} no repeat ) * 10 times = (4*3)^10 = 12^10


#* Exercise 6.11 ----
# For a 100 meter dash final with 5 runners how many ways can the runners finish? 
#   5*4*3*2*1 = 120


#* Exercise 6.12 ----
# If you bought ten cans of soup, each different types, and loaded them into the grocery bag randomly.
# What are the odds that when you pull them out of the grocery bag they come out in alphabetical order?
#   P(alphabetical order) = |correct order| / |10!| = 1/10!


#* Exercise 6.13 ----
# How many ways can the cards in a standard deck (52 cards) be ordered?
#   52!


#* Exercise 6.14 ----
# How many orders can 8 French nobles be executed in, if they are drawn randomly from a holding cell with 8 occupants?
#   8!


#* Exercise 6.15 ----
# How many orders can 8 French nobles be executed in, if they are drawn randomly from a holding cell with 18 occupants? 
#   P(18,8) = 18! / (18-8)! = 18! / 12!


#* Exercise 6.16 ----
# How many ways can a jury of 12 people be chosen from a pool of 30 candidates?
choose(30,12)


#* Exercise 6.17 ----
# A fire team of 4 junior Marines must be chosen from a platoon with junior 36 Marines for a patrol.
# Also a sergeant must be chosen to lead the fire team from a pool of 5 candidates.
# How many ways can the patrol be chosen with four juniors and one leader? 
choose(5,1) * choose(36,4)


#* Exercise 6.18 ----
# Let Ω be the set of all students at Schreiner, and
# A be the set of students in this class and let
# M be the set of music majors at Schreiner.

# Is it true that A⊂Ω?
#   Yes
# What does the set Ω∖M contain?
#   all students who are not music majors
# What does the set A∪M contain?
#   set of students in this class + music major students


#* Exercise 6.19 ----
# Suppose 80% of the wizarding world supports restrictions on underage magic, and 55% support the use of dementors as guards at the wizarding prison Azkaban.
# If 50% support both dementors and underage magic restrictions, what percentage support either underage restrictions or dementors?
#   P(restriction)            = 80%
#   P(guards)                 = 55%
#   P(restriction & guards)   = 50%
#   P(restriction or guards)  = P(restriction) + P(guards) - P(restriction & guards) = 85%


#* Exercise 6.20 ----
# A card is drawn randomly from a deck of ordinary playing cards.
# You win 10 dollars if the card is a spade or an ace.
# What is the probability that you will win the game?
#   P(ace) = P(spade) = 1/4
#   P(ace & spade) = 0
#   P(ace or spade) = 1/4 + 1/4 - 0 = 2/4 = 1/2


#** 6.3.5.1 Exercise ----
# People vs Collins:
# In 1968 an old lady in Los Angeles, California was mugged and her purse was stolen.
# She didn’t get a good look at her assailants but the police did find one eye witness.
# Unfortunately, this witness didn’t get a good look at the mugger either.
# However, the witness did report seeing a black man with a beard/mustache running back to a yellow car with a blond haired white woman with her hair in a pony tail.
# This was very little to go on, however the police did find a couple which matched his description.
# Amazingly, using just this evidence they were brought to trial.
# At the trial a mathematics professor was brought in to testify for the prosecution.
# The professor presented the below table to the jury:
  
# Characteristic 	Probability
# Black man with beard            1/10
# Man with mustache               1/4
# White woman with pony tail      1/10
# White woman with blonde hair    1/3
# Yellow car 	                    1/10
# Interracial couple              1/1000

# The fact that this was presented by a math professor brings me great shame (for many reasons).
# Let’s examine the argument made by the professor.

# Using the AND rule what are the odds assuming these numbers are accurate in 1968 that a couple would match these all these characteristics?
#   P(Black man with beard/mustache) * P(blond haired white woman with her hair in a pony tail) * P(Yellow car) * P(Interracial couple)
#   = (1/10 + 1/4) * (1/10 * 1/3) * 1/10 * 1/1000
#   = 7/20 * 1/30 * 1/10 * 1/1000
#   = 7/6000000 = 7/6*10^6

# What is wrong with applying the AND rule to this data?
#   AND rule may not be correct since the assumption that the events are independent is incorrect (?)

# If there were 60 million couples in the LA area at the time, about how many couples will match this description?
#   7/6*10^6 * 60*10^6 = 70

# What is the probability that the couple that was arrested actually committed the crime? (Given your calculations above)
#   7/6*10^6

# This poor couple was convicted and it took years of appeals before the conviction was overturned.
# This is called the prosecutors fallacy.
# You will see another tragic case of this in your homework (Sally Clark Case).


#* Exercise 6.21 ----
# You have purchases a mortgage backed security, where you lose your money if at least one of the mortgages in the bundle fails.
# If each mortgage has a 5% chance of failing, independent of the rest, what is the probability you lose your money if you bundle 10 mortgages together? 
#   P(at least one fail) = 1 - P(no fail) = 1 - (95% ^ 10) = 0.4012631

#   If we check with 2 securities
#     SS = P(0) + P(1) + P(1) + P(2)
#     P(at least 1) = 5%*95% + 5%*95% + 5%*5%
#                   = 4.75% + 4.75% + 0.25%
#                   = 9.75%
#                 or
#                   = 1 - P(0) = 1 - 95%*95% = 1 - 0.9025 = 0.0975 = 9.75%


#* Exercise 6.22 ----
# In 2016 the Cleveland Cavaliers had the following record in home and away games:
# Outcome 	Home 	Away
# Wins      31    20
# Losses    10    21

# Using this table find the probability of the Cavaliers winning a game P(W) in 2016.
#   P(W) = (31 + 20) + (31 + 20 + 10 + 21) = 51/82 = 62%

# Then find the conditional probabilities P(W|H), the probability of winning given
#   the game is a home game, and
#   P(W|A) the probability of them winning a game given it is an away game. 
#     P(W|H) = (31) / (31 + 10) = 31/41 = 76%
#     P(W|A) = (20) / (20 + 21) = 20/41 = 49%


#* Exercise 6.23 ----
# Fred has never had MATH 2330 and thinks its a good idea to join a underground game of Russian roulette.
# To make things more interesting he has two pistols to choose from.
# Each of the guns has six chambers (six places to insert a bullet), although you know that one of the guns has two bullets loaded and the other only has a single bullet.
# Assuming he has to choose between the guns randomly what is the probability he survives?
#   S = survives
#   G1 = gun with 1 bullet
#   G2 = gun with 2 bullet
#   P(S) = P(S|G1)P(G1) + P(S|G2)P(G2) = 5/6*1/2 + 4/6*1/2 = 9/12 = 3/4


#* 6.6 Homework ----------------------------------------------------------
#** 6.6.1 Concept Questions ----
#*** 1. ----
# What is the Law of Sample Spaces and when does it apply?
#   P(A) = number of outcomes in A / total outcomes in sample space
#   when all outcomes are equally likely


#*** 2. ----
# What is the condition for applying the OR rule of probabilities?
#   the two events must be disjointed


#*** 3. ----
# What is the condition for applying the AND rule of probabilities?
#   the two events must be independent


#*** 4. ----
# Is it true that P(A∩B)≤P(A)?
#   True


#*** 5. ----
# Is it true that P(A∪B)≥P(A)?
#   True


#*** 6. ----
# For conditional probabilities does P(A|B)=P(B|A)?
#   No


#** 6.6.2 Practice Problems ----
#*** 1. ----
# How many 7-place license plates are possible if the first two places are letters and the last 5 places are numbers?
#   P(2 letters + 5 numbers) = P(2 letters) + P(5 numbers) = 26P2 + 10P5 = 30565


#*** 2. ----
# Twenty workers are assigned to 20 different jobs, how many different assignments are possible?
#   20P20 = 20!


#*** 3. ----
# How many ways can a wedding table of 5 people be selected from a wedding party of 12 people?
#   12C5 = factorial(12) / factorial(5) = 3991680


#*** 4. ----
# Two fair dice are thrown and let E be the event that the sum of the dice is odd and F be the event the sum is less than 6

#   Create the sets in Excel

# Define E and F and the sample space Ω.
#   Q = {1:6, 1:6}                                = 36 events
#   E = {{odd, even} {even, odd}}                 = 18 events
#   F = {{1, 1:4}, {2, 1:3}, {3, 1:2}}, {4, 1}}   = 10 events

# Are E and F disjoint sets?
#   No

# Find P(E) and P(F)
#   P(E) = 18/36 = 1/2
#   P(F) = 10/36 = 5/18

# Find E∪F and P(E∪F)
#   E∪F = {{1,(1:4,5)}, {2,(1:3,5)}, {3,(1, even)}, {4,1}, {5,even}, {6,odd}} = 22 events
#   P(E∪F) = 22/36 = 11/18

# Find P(E∩F)
#   E∩F = {{1,(2,4)}, {2,(1,3)}, {3,2}, {4,1}} = 6 events
#   P(E∩F)  = 6/36 = 1/6
#           = P(E) + P(F) - P(E∪F)
#           = 9/18 + 5/18 - 11/18 = 3/18 = 1/6

# Are E and F independent events?
#   P(E|F) = P(E∩F)/P(F) = 3/18 / 5/18 = 3/5 <> P(E)
#   P(F|E) = P(E∩F)/P(E) = 3/18 / 9/18 = 1/3 <> P(F)
#   No


#** 6.6.3 Advanced Problems ----
#*** 1. ----
# Advertising Decisions:
# You are trying to decide how effective your product advertisements are.
# You find that 61% of your customers are on Facebook, and 32% are on Twitter with 16% on both Facebook and Twitter.
# If you decide to pay for advertising on both Facebook and twitter what percentage of customers do you expect to reach?
#   P(F) = 61%
#   P(T) = 32%
#   P(F∩T) = 16%
#   P(F∪T) = 61% + 32% - 16% = 77%


#*** 2. ----
# DNA Evidence:
# In a murder trial and expert witness is called to testify about DNA evidence found at the crime scene.
# They say that the probability of a person randomly matching the DNA fragment found at the crime scene is approximately 1 in a million.
# In the cross examination the defense attorney asks what the probability of a lab mistake is during the processing of the evidence (contamination, human error, etc), to which the expert witness replies about 5% of the time.
# If we are a juror, we are interested in the probability the DNA evidence linking the defendant to the crime scene is false. Lets call this event F.
# Call the event that the defendant is unluckily enough to share the DNA sequence with the real killer R, and call the event that the lab screwed up and the match is false L.
#   P(random match) = P(R) = 1/10^6
#   P(mistake) = P(L) = 5%
#   The two events are independent
#   P(F∩T) = P(R) * P(L) = 5/10^8

# How can we express F in terms of R and L?
#   F = R∪L

# Using the numbers given by the expert witness find P(F) in this case.
#   P(F) = P(R∪L) = P(R) + P(L) - P(F∩T) = 1/10^6 + 5% - 5/10^8 = (100 + 5000000 - 5)/10^8 = ~5%

# Is this beyond your reasonable doubt? How would you explain this to your fellow jurors who aren’t skilled in probability theory?
#   No. Explain that Probability of random match is nearly impossible and if consider that the probability of L is only 5%,
#     then the chance of evidence being false is only 5%, which is what we got above.

  
#*** 3. ----
# The Simpson Trial:
# During the O.J. Simpson trial the prosecution argued that the history of domestic abuse by O.J. towards his ex-wife Nicole Brown showed a pattern of escalating violence which culminated in her murder.
# To make the point the chief prosecutor famously used the line A slap is a prelude to homicide’’.
# Predictably, the defense argued this history of domestic abuse meant nothing.
# The defense used the following statistics to make their argument:
#   over 4 million women were victims of domestic abuse in 1992 and only 1,432 of these were killed by their significant others.
#   Therefore the probability, in 1992, that an abuser murders their spouse is less than 1/2500.
#   Therefore, they argued that very few wife beaters actually go on to murder their wives.

# Write the defense’s statistic in terms of a conditional probability where
# M is the event that the women is murdered by their abuser, and
# A is the event that they were previously abused.
#   P(M|A) = P(M∩A)/P(A) = 1432/(4/10^6) = 0.000358 ~< 1/2500


# What key piece of information is the defense conveniently forgetting to condition on?
# Hint: Is it relevant to consider the probability that O.J. will murder Nicole at some future date?
#   Yes. The defense only considered the murder that took place in 1992, but abuse can occur over several years and the murder might take place in a later year.

# If I told you that 90% of the time when an abused women is murdered, the murderer was the abuser (this is true).
# How would you respond to the defenses argument?
#   P(M|A) = 90%
#   P(A∩M) = P(M|A) * P(A) = 0.90 * (4*10^6) = 3.6+e06
#   So respond to defence that the figure is not 1432 but 3.6 million.


#*** 4. ----
# Sally Clark Case:
# Sally Clark was a women in England who in 1999 was convicted of killing her two children.
# The first child’s untimely death was put down to Sudden Infant Death Syndrome (SIDS).
# However, when two years later another seemingly healthy child suddenly died, Sally was accused of murdering the two children.
# The thrust of the prosecutions argument hinged on the fact that SIDS, thankfully, is relatively rare.
# The odds of a randomly chosen baby, dying from SIDS is about 3 in 5000.

# If the two deaths are independent then what is the probability of having two children who die of SIDS?
#   P(SIDS) = 3/5000
#   P(2 SIDS) = 3/5000 * 3/5000 = 0.00000036

# If 130 million babies are born worldwide each year, about how many will die from SIDS using the 3:5000 odds?
#   SIDS = 130*10^6 * 3/5000 = 78K

# If 50,000 mothers have another child after having a child die of SIDS about how many will have a second child die from SIDS assuming the two deaths are independent?
#   P(SIDS | SIDS) = P(SIDS) = 3/5000
#   50000 * 3/5000 = 30

# Using you answer from part(c) how would you defend Sally in court?
#   Given that 30 out of 50K mothers lose 2 children to SIDS, it is possible that Sally was part of this statistic.
  

#*** 5. ----
# If two events A and B are disjoint (i.e. A∩B=∅) does this mean they are independent?
# If not give an example of a case where this fails.
# Hint: Consider A and Ac.
#   No. Ac is formed based on the events in A. Therefore, Ac is dependent on A.
#   E.g.
#     If a 6-sided dice is thrown and A is the event of even numbers then Ac is the event of odd numbers.
#     However, if A is now event of numbers less than 4, then Ac changes to numbers 4 and above.
#   Therefore, even though A and Ac are disjoint they are not independent.
