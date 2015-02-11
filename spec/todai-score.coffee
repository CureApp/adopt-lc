
assert = require 'power-assert'

TodaiScore = require('../todai-score')

describe 'TodaiScore', ->

    describe '@getScoreByAge', ->
        it 'returns 0 by 60', ->
            age = 60
            score = TodaiScore.getScoreByAge(age)
            assert(score is 0)

        it 'returns 1 by 61', ->
            age = 61
            score = TodaiScore.getScoreByAge(age)
            assert(score is 1)


    describe '@getScoreByChildPughScore', ->
        it 'returns 0 by A', ->
            cpscore = 'A'
            score = TodaiScore.getScoreByChildPughScore(cpscore)
            assert(score is 0)

        it 'returns 1 by B', ->
            cpscore = 'B'
            score = TodaiScore.getScoreByChildPughScore(cpscore)
            assert(score is 1)

        it 'returns 4 by C', ->
            cpscore = 'C'
            score = TodaiScore.getScoreByChildPughScore(cpscore)
            assert(score is 4)


    describe '@getScoreByCharlsonComorbidityScore', ->
        it 'returns 0 by -1', ->
            ccscore = -1
            score = TodaiScore.getScoreByCharlsonComorbidityScore(ccscore)
            assert(score is 0)

        it 'returns 0 by 2', ->
            ccscore = 2
            score = TodaiScore.getScoreByCharlsonComorbidityScore(ccscore)
            assert(score is 0)

        it 'returns 1 by 3', ->
            ccscore = 3
            score = TodaiScore.getScoreByCharlsonComorbidityScore(ccscore)
            assert(score is 1)

        it 'returns 1 by 5', ->
            ccscore = 5
            score = TodaiScore.getScoreByCharlsonComorbidityScore(ccscore)
            assert(score is 1)

        it 'returns 2 by 6', ->
            ccscore = 6
            score = TodaiScore.getScoreByCharlsonComorbidityScore(ccscore)
            assert(score is 2)


    describe '@getScoreByDurationOfAnesthesia', ->
        it 'returns 0 by -1', ->
            durationOfAnesthesia = -1
            score = TodaiScore.getScoreByDurationOfAnesthesia(durationOfAnesthesia)
            assert(score is 0)

        it 'returns 0 by 180', ->
            durationOfAnesthesia = 180
            score = TodaiScore.getScoreByDurationOfAnesthesia(durationOfAnesthesia)
            assert(score is 0)

        it 'returns 1 by 181', ->
            durationOfAnesthesia = 181
            score = TodaiScore.getScoreByDurationOfAnesthesia(durationOfAnesthesia)
            assert(score is 1)

        it 'returns 1 by 420', ->
            durationOfAnesthesia = 420
            score = TodaiScore.getScoreByDurationOfAnesthesia(durationOfAnesthesia)
            assert(score is 1)


        it 'returns 2 by 421', ->
            durationOfAnesthesia = 421
            score = TodaiScore.getScoreByDurationOfAnesthesia(durationOfAnesthesia)
            assert(score is 2)


    describe '@getMortalityByScore', ->
        it 'returns 0 by 0', ->
            score = 0
            mortality = TodaiScore.getMortalityByScore(score)
            assert(mortality is 0)

        it 'returns 0 by 1', ->
            score = 1
            mortality = TodaiScore.getMortalityByScore(score)
            assert(mortality is 0)


        it 'returns 0.8 by 2', ->
            score = 2
            mortality = TodaiScore.getMortalityByScore(score)
            assert(mortality is 0.8)


        it 'returns 50.0 by 9', ->
            score = 9
            mortality = TodaiScore.getMortalityByScore(score)
            assert(mortality is 50.0)



    describe 'getScore', ->
        it 'returns estimated score', ->

            todaiScore = new TodaiScore(
                71  # 1
                'A' # 0
                3   # 1
                400 # 1
            )
            score = todaiScore.getScore()

            assert(score is 3)


    describe 'getMortality', ->
        it 'returns estimated mortality', ->

            todaiScore = new TodaiScore(
                71  # 1
                'A' # 0
                3   # 1
                400 # 1
            )
            mortality = todaiScore.getMortality()

            assert(mortality is 1.0)

