require('coffee-script/register')

module.exports =
    CharlsonComorbidityIndex: require('./src/charlson-comorbidity-index')
    ChildPughClassification : require('./src/child-pugh-classification')
    AdoptLC                 : require('./src/adopt-lc')

