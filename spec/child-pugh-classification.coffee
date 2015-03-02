
assert = require 'power-assert'

ChildPughClassification = require('../src/child-pugh-classification')

describe 'ChildPughClassification', ->

    describe '@getScoreByPoint', ->
        it 'returns A by 4', ->
            point = 4
            score = ChildPughClassification.getScoreByPoint(point)
            assert(score is 'A')


        it 'returns A by 6', ->
            point = 6
            score = ChildPughClassification.getScoreByPoint(point)
            assert(score is 'A')


        it 'returns B by 8', ->
            point = 8
            score = ChildPughClassification.getScoreByPoint(point)
            assert(score is 'B')

        it 'returns B by 9', ->
            point = 9
            score = ChildPughClassification.getScoreByPoint(point)
            assert(score is 'B')

        it 'returns C by 10', ->
            point = 10
            score = ChildPughClassification.getScoreByPoint(point)
            assert(score is 'C')

        it 'returns C by 100', ->
            point = 100
            score = ChildPughClassification.getScoreByPoint(point)
            assert(score is 'C')


    describe '@getPointByEncephalopathy', ->
        it 'returns 2 by 2', ->
            freqOfEncephalopathy = 2
            score = ChildPughClassification.getPointByEncephalopathy(freqOfEncephalopathy)
            assert(score is 2)

        it 'returns 3 by 4', ->
            freqOfEncephalopathy = 4
            score = ChildPughClassification.getPointByEncephalopathy(freqOfEncephalopathy)
            assert(score is 3)


        it 'returns 1 by 0', ->
            freqOfEncephalopathy = 0
            score = ChildPughClassification.getPointByEncephalopathy(freqOfEncephalopathy)
            assert(score is 1)



    describe '@getPointByAscites', ->
        it 'returns 2 by 2', ->
            degreeOfAscites = 2
            score = ChildPughClassification.getPointByAscites(degreeOfAscites)
            assert(score is 2)

        it 'returns 3 by 4', ->
            degreeOfAscites = 4
            score = ChildPughClassification.getPointByAscites(degreeOfAscites)
            assert(score is 3)


        it 'returns 1 by 0', ->
            degreeOfAscites = 0
            score = ChildPughClassification.getPointByAscites(degreeOfAscites)
            assert(score is 1)



    describe '@getPointByTotalBillirubin', ->
        it 'returns 1 by 1.9', ->
            totalBillirubin = 1.9
            score = ChildPughClassification.getPointByTotalBillirubin(totalBillirubin)
            assert(score is 1)

        it 'returns 2 by 2.0', ->
            totalBillirubin = 2.0
            score = ChildPughClassification.getPointByTotalBillirubin(totalBillirubin)
            assert(score is 2)

        it 'returns 2 by 3.0', ->
            totalBillirubin = 3.0
            score = ChildPughClassification.getPointByTotalBillirubin(totalBillirubin)
            assert(score is 2)

        it 'returns 3 by 3.1', ->
            totalBillirubin = 3.1
            score = ChildPughClassification.getPointByTotalBillirubin(totalBillirubin)
            assert(score is 3)



    describe '@getPointByAlbumin', ->
        it 'returns 1 by 3.6', ->
            albumin = 3.6
            score = ChildPughClassification.getPointByAlbumin(albumin)
            assert(score is 1)

        it 'returns 2 by 3.5', ->
            albumin = 3.5
            score = ChildPughClassification.getPointByAlbumin(albumin)
            assert(score is 2)

        it 'returns 2 by 2.8', ->
            albumin = 2.8
            score = ChildPughClassification.getPointByAlbumin(albumin)
            assert(score is 2)

        it 'returns 3 by 2.7', ->
            albumin = 2.7
            score = ChildPughClassification.getPointByAlbumin(albumin)
            assert(score is 3)


    describe '@getPointByProthrombinTime', ->
        it 'returns 1 by 71', ->
            prothrombinTime = 71
            score = ChildPughClassification.getPointByProthrombinTime(prothrombinTime)
            assert(score is 1)

        it 'returns 2 by 70', ->
            prothrombinTime = 70
            score = ChildPughClassification.getPointByProthrombinTime(prothrombinTime)
            assert(score is 2)

        it 'returns 2 by 40', ->
            prothrombinTime = 40
            score = ChildPughClassification.getPointByProthrombinTime(prothrombinTime)
            assert(score is 2)

        it 'returns 3 by 39', ->
            prothrombinTime = 39
            score = ChildPughClassification.getPointByProthrombinTime(prothrombinTime)
            assert(score is 3)


    describe 'getPoint', ->
        it 'returns estimated point', ->

            cpclass = new ChildPughClassification(
                2   # 2
                2   # 2
                3.1 # 3
                3.0 # 2
                77  # 1
            )
            point = cpclass.getPoint()

            assert(point is 10)


    describe 'getScore', ->
        it 'returns estimated score', ->

            cpclass = new ChildPughClassification(
                2   # 2
                2   # 2
                3.1 # 3
                3.0 # 2
                77  # 1
            )
            point = cpclass.getScore()

            assert(point is 'C')











