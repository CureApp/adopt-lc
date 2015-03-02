
assert = require 'power-assert'

CharlsonComorbidityIndex = require('../src/charlson-comorbidity-index')

describe 'CharlsonComorbidityIndex', ->

    describe '@getDescriptionByScore', ->
        it 'returns Low by -1', ->
            score = -1
            description = CharlsonComorbidityIndex.getDescriptionByScore(score)
            assert(description is 'Low')


        it 'returns Low by 0', ->
            score = 0
            description = CharlsonComorbidityIndex.getDescriptionByScore(score)
            assert(description is 'Low')

        it 'returns Medium by 1', ->
            score = 1
            description = CharlsonComorbidityIndex.getDescriptionByScore(score)
            assert(description is 'Medium')

        it 'returns Medium by 2', ->
            score = 2
            description = CharlsonComorbidityIndex.getDescriptionByScore(score)
            assert(description is 'Medium')

        it 'returns High by 3', ->
            score = 3
            description = CharlsonComorbidityIndex.getDescriptionByScore(score)
            assert(description is 'High')

        it 'returns High by 4', ->
            score = 4
            description = CharlsonComorbidityIndex.getDescriptionByScore(score)
            assert(description is 'High')

        it 'returns Very high by 5', ->
            score = 5
            description = CharlsonComorbidityIndex.getDescriptionByScore(score)
            assert(description is 'Very high')


    describe 'getScore', ->
        it 'returns 0 by just constructed', ->
            ccindex = new CharlsonComorbidityIndex()
            score = ccindex.getScore()
            assert(score is 0)


        it 'returns 1 by adding one mild disease', ->
            ccindex = new CharlsonComorbidityIndex()
            ccindex.hasConnectiveTissueDisease = true
            score = ccindex.getScore()
            assert(score is 1)


        it 'returns 2 by adding two mild diseases', ->
            ccindex = new CharlsonComorbidityIndex()
            ccindex.hasConnectiveTissueDisease = true
            ccindex.hasDementia = true
            score = ccindex.getScore()
            assert(score is 2)

        it 'returns 1 by adding mild diabetes', ->
            ccindex = new CharlsonComorbidityIndex()
            ccindex.hasDiabetes = true
            score = ccindex.getScore()
            assert(score is 1)

        it 'returns 2 by adding diabetes with organ damage', ->
            ccindex = new CharlsonComorbidityIndex()
            ccindex.hasDiabetesWithOrganDamage = true
            score = ccindex.getScore()
            assert(score is 2)

        it 'returns 2 by adding diabetes with organ damage with mild diabetes', ->
            ccindex = new CharlsonComorbidityIndex()
            ccindex.hasDiabetes = true
            ccindex.hasDiabetesWithOrganDamage = true
            score = ccindex.getScore()
            assert(score is 2)

        it 'returns 1 by adding mild liver disease', ->
            ccindex = new CharlsonComorbidityIndex()
            ccindex.hasMildLiverDisease = true
            score = ccindex.getScore()
            assert(score is 1)

        it 'returns 3 by adding moderate liver disease', ->
            ccindex = new CharlsonComorbidityIndex()
            ccindex.hasModerateLiverDisease = true
            score = ccindex.getScore()
            assert(score is 3)

        it 'returns 3 by adding moderate liver disease with mild liver disease', ->
            ccindex = new CharlsonComorbidityIndex()
            ccindex.hasMildLiverDisease = true
            ccindex.hasModerateLiverDisease = true
            score = ccindex.getScore()
            assert(score is 3)


        it 'returns 2 by adding solid tumor', ->
            ccindex = new CharlsonComorbidityIndex()
            ccindex.hasSolidTumor = true
            score = ccindex.getScore()
            assert(score is 2)


        it 'returns 6 by adding solid tumor with metastasis', ->
            ccindex = new CharlsonComorbidityIndex()
            ccindex.hasMetastaticSolidTumor = true
            score = ccindex.getScore()
            assert(score is 6)

        it 'returns 6 by adding solid tumor with metastasis with solid tumor', ->
            ccindex = new CharlsonComorbidityIndex()
            ccindex.hasSolidTumor = true
            ccindex.hasMetastaticSolidTumor = true
            score = ccindex.getScore()
            assert(score is 6)

        it 'returns 6 by adding AIDS', ->
            ccindex = new CharlsonComorbidityIndex()
            ccindex.hasAIDS = true
            score = ccindex.getScore()
            assert(score is 6)


    describe 'getScoreDescription', ->
        it 'returns Low by just constructed', ->
            ccindex = new CharlsonComorbidityIndex()
            description = ccindex.getScoreDescription()
            assert(description is 'Low')







































