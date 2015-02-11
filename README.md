# TodaiScore

## installation

```bash
git clone github:CureApp/todai-score.git
npm install
npm install -g mocha # only for test.
```

and put it to "lib" directory in Titanium Alloy

## usage

### Child-Pugh Classification

```coffee
ChildPughClassification = require('child-pugh-classification')
cpclass = new ChildPughClassification(
    2   #  frequency of encephalopathy
    2   #  degree of ascites
    3.1 #  total billirubin
    3.0 #  albumin
    77  #  prothrombin time
)

score = cpclass.getScore() # A|B|C

```

### Charlson Comorbidity Index 

```coffee
CharlsonComorbidityIndex = require('charlson-comorbidity-index')
ccindex = new CharlsonComorbidityIndex()
ccindex.hasAIDS = true
score = ccindex.getScore() # number
description = ccindex.getScoreDescription() # Low|Moderate|High|Very high
```

### Todai Score

```coffee
TodaiScore = require('../todai-score')
todaiScore = new TodaiScore(
    71  # age
    'A' # Child-Pugh score
    3   # score value of Charlson Comorbidity Index
    400 # duration of anesthesia
)
score = todaiScore.getScore() # number
mortality = todaiScore.getMortality() # number(float)
```



## test

```bash
cake test
```

or 
```bash
npm test
```
