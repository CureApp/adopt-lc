
assert = require 'power-assert'

AdoptLC = require('../src/adopt-lc')

describe 'AdoptLC', ->

    describe '@getScoreByAge', ->
        it 'returns 0 by 65', ->
            age = 65
            score = AdoptLC.getScoreByAge(age)
            assert(score is 0)

        it 'returns 1 by 66', ->
            age = 66
            score = AdoptLC.getScoreByAge(age)
            assert(score is 1)


    describe '@getScoreByChildPughScore', ->
        it 'returns 0 by A', ->
            cpscore = 'A'
            score = AdoptLC.getScoreByChildPughScore(cpscore)
            assert(score is 0)

        it 'returns 1 by B', ->
            cpscore = 'B'
            score = AdoptLC.getScoreByChildPughScore(cpscore)
            assert(score is 1)

        it 'returns 3 by C', ->
            cpscore = 'C'
            score = AdoptLC.getScoreByChildPughScore(cpscore)
            assert(score is 3)


    describe '@getScoreByCharlsonComorbidityScore', ->
        it 'returns 0 by -1', ->
            ccscore = -1
            score = AdoptLC.getScoreByCharlsonComorbidityScore(ccscore)
            assert(score is 0)

        it 'returns 0 by 2', ->
            ccscore = 2
            score = AdoptLC.getScoreByCharlsonComorbidityScore(ccscore)
            assert(score is 0)

        it 'returns 1 by 3', ->
            ccscore = 3
            score = AdoptLC.getScoreByCharlsonComorbidityScore(ccscore)
            assert(score is 1)

        it 'returns 1 by 5', ->
            ccscore = 5
            score = AdoptLC.getScoreByCharlsonComorbidityScore(ccscore)
            assert(score is 1)

        it 'returns 2 by 6', ->
            ccscore = 6
            score = AdoptLC.getScoreByCharlsonComorbidityScore(ccscore)
            assert(score is 2)


    describe '@getScoreByDurationOfAnesthesia', ->
        it 'returns 0 by -1', ->
            durationOfAnesthesia = -1
            score = AdoptLC.getScoreByDurationOfAnesthesia(durationOfAnesthesia)
            assert(score is 0)

        it 'returns 0 by 180', ->
            durationOfAnesthesia = 180
            score = AdoptLC.getScoreByDurationOfAnesthesia(durationOfAnesthesia)
            assert(score is 0)

        it 'returns 1 by 181', ->
            durationOfAnesthesia = 181
            score = AdoptLC.getScoreByDurationOfAnesthesia(durationOfAnesthesia)
            assert(score is 1)

        it 'returns 1 by 420', ->
            durationOfAnesthesia = 420
            score = AdoptLC.getScoreByDurationOfAnesthesia(durationOfAnesthesia)
            assert(score is 1)


        it 'returns 2 by 421', ->
            durationOfAnesthesia = 421
            score = AdoptLC.getScoreByDurationOfAnesthesia(durationOfAnesthesia)
            assert(score is 2)


    describe '@getMortalityByScore', ->
        it 'returns 0 by 0', ->
            score = 0
            mortality = AdoptLC.getMortalityByScore(score)
            assert(mortality is 0)

        it 'returns 0 by 1', ->
            score = 1
            mortality = AdoptLC.getMortalityByScore(score)
            assert(mortality is 0)


        it 'returns 0.5 by 2', ->
            score = 2
            mortality = AdoptLC.getMortalityByScore(score)
            assert(mortality is 0.5)


        it 'returns 100.0 by 8', ->
            score = 8
            mortality = AdoptLC.getMortalityByScore(score)
            assert(mortality is 100.0)



    describe 'getScore', ->
        it 'returns estimated score', ->

            adoptLC = new AdoptLC(
                71  # 1
                'A' # 0
                3   # 1
                400 # 1
            )
            score = adoptLC.getScore()

            assert(score is 3)


    describe 'getMortality', ->
        it 'returns estimated mortality', ->

            adoptLC = new AdoptLC(
                71  # 1
                'A' # 0
                3   # 1
                400 # 1
            )
            mortality = adoptLC.getMortality()

            assert(mortality is 1.1)

